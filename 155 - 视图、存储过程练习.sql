USE LAB4;
GO

------------------> 视图例子 Примеры создания и использования представлений

--1.	Пример создания и использования 【представления】 для выборки  названий дисциплин, 
--	по которым хотя бы одним студентом была получена оценка 
CREATE VIEW Disciplines_with_balls 
AS 
	SELECT Distinct Name 
	FROM Disciplines 
		INNER JOIN Uplans 
			ON Disciplines.NumDisc=Uplans.NumDisc 
		INNER JOIN Balls 
			ON Uplans.IdDisc=Balls.IdDisc;
GO
SELECT * FROM Disciplines_with_balls;


--2. Пример создания 【процедуры】 c входным параметром. 创建带有输入参数的【存储过程】的例子
--Создаем процедуру для подсчета计算 студентов, сдавших хотя бы один экзамен в заданном某一（作为输入） семестре
GO
CREATE PROCEDURE Count_Students_Sem
	@Count_sem AS INT
AS
	SELECT COUNT(Distinct NumSt)
	FROM Balls
	JOIN Uplans ON Uplans.IdDisc=Balls.IdDisc
	WHERE Semestr>=@Count_sem;
GO



--3. Пример создания и использования 【представления】 с использованием агрегатных функций【聚合函数】, 
--	 группировки【分组】 и подзапросов для вывода студентов, которые сдали все экзамены первого семестра
GO
CREATE VIEW Students_complete (Fio, Direction, Numer_of_balls)
AS 
	SELECT NumSt, NumDir, COUNT(Ball)
	FROM Balls
		JOIN Uplans ON Balls.IdDisc=Uplans.IdDisc
	WHERE Semestr=1
	GROUP BY NumSt, NumDir 
	HAVING Count(Ball)=(SELECT COUNT( *) FROM Uplans u WHERE Uplans.NumDir=u.NumDir and semestr=1);
GO
SELECT * FROM Students_complete


-- 4. Пример создания и использования представления с использованием предиката NOT EXISTS
	-- для вывода номеров студентов, которые сдали все экзамены своего курса 
GO
CREATE VIEW Students_complete_2 AS 
	SELECT Students.NumSt
	FROM Students
	JOIN Groups ON Groups.NumGr = Students.NumGr
	WHERE NOT EXISTS
	(SELECT * FROM Uplans  
		WHERE
			(Semestr=CONVERT(int, LEFT(Students.NumGr,1))*2-1
				OR 
			 Semestr=CONVERT(int, LEFT(Students.NumGr,1))*2
			)
		AND 
			Groups.NumDir=Uplans.NumDir
		AND NOT EXISTS
		(SELECT * FROM Balls WHERE Balls.IdDisc=Uplans.IdDisc and Students.NumSt=Balls.NumSt)
	);
GO
SELECT * FROM Students_complete_2;


------------------> 存储过程例子 Примеры создания и запуска хранимых процедур
-- 1. Пример создания процедуры без параметров.
-- Создаем процедуру для подсчета общего количества студентов
GO
CREATE PROCEDURE Count_Students
AS
	SELECT COUNT(*) FROM Students
GO

EXEC Count_Students


-- 2. Пример создания процедуры c входным параметром.
--		Создаем процедуру для подсчета студентов, сдавших хотя бы один экзамен в заданном семестре
GO
CREATE PROCEDURE Count_Students_Sem2
	@Count_sem AS INT
AS
	SELECT COUNT(Distinct NumSt) FROM Balls
		JOIN Uplans ON Uplans.IdDisc=Balls.IdDisc
	WHERE Semestr>=@Count_sem;
GO

EXEC Count_Students_Sem2 1
-- или с использованием переменной
DECLARE @kol int;
SET @kol=1;
EXEC Count_Students_Sem2 @kol;


-- 3.1. Создаем процедуру для получения 【списка】 студентов указанного направления,
-- сдавших экзамен по указанной дисциплине
GO
CREATE PROCEDURE List_Students_Dir (@Dir AS INT, @Disc AS VARCHAR(30))
AS
	SELECT Distinct Students.FIO
	FROM Groups
	JOIN Students ON Groups.NumGr=Students.NumGr
	JOIN Balls ON Students.NumSt=Balls.NumSt
	JOIN Uplans ON Uplans.IdDisc=Balls.IdDisc
	WHERE Groups.NumDir=@Dir and NumDisc=(SELECT NumDisc FROM Disciplines WHERE Name=@Disc);
GO

EXEC List_Students_Dir 230100, 'Физика'
-- или с использованием переменной
DECLARE @dir int, @title varchar(30);
SET @dir=230100;
SET @title ='Физика';
EXEC List_Students_Dir @dir,@title;


-- 3.2. Создаем процедуру для ввода информации о новом студенте

GO
CREATE PROCEDURE Enter_Students (@Fio AS VARCHAR(30), @Group AS VARCHAR(10))
AS
	INSERT INTO Students(FIO, NumGr) VALUES (@Fio, @Group);
GO

DECLARE @Stud VARCHAR(30), @Group varchar(10);
SET @Stud='Новая Наталья';
SET @Group ='53504/3';
--INSERT Groups VALUES(@Group, 230400, 0, 15)
EXEC Enter_Students @Stud, @Group;



-- 4. Пример создания процедуры с входными параметрами и значениями по умолчанию.
--	Создать процедуру для перевода студентов указанной группы на следующий курс
GO
--Добавьте в таблицу Groups новые записи с группами 23504/3 и 23504/1

GO
CREATE PROCEDURE Next_Course (@Group AS VARCHAR(10)='13504/1')
AS
	UPDATE Students
		SET
			NumGr=CONVERT(char(1),CONVERT(int, LEFT(NumGr,1))+1)
					+ SUBSTRING(NumGr,2, LEN(NumGr)-1)
	WHERE NumGr=@Group;
GO

--Alter table Students DROP CONSTRAINT FK_Students_NumGr

DECLARE @Group VARCHAR(10);
 SET @Group='13504/3';
 EXEC Next_Course @Group;
GO


-- !!! Напишите процедуру, которая будет возвращать старые номера групп обратно
GO
CREATE PROCEDURE Back_Course (@Group AS VARCHAR(10)='23504/1')
AS
	UPDATE Students
		SET
			NumGr=CONVERT(char(1),CONVERT(int, LEFT(NumGr,1))-1)
					+ SUBSTRING(NumGr,2, LEN(NumGr)-1)
	WHERE NumGr=@Group;
GO

--Alter table Students DROP CONSTRAINT FK_Students_NumGr

DECLARE @Group VARCHAR(10);
 SET @Group='23504/3';
 EXEC Back_Course @Group;
GO


-- 5. Пример создания процедуры с входными и выходными параметрами.
-- Создать процедуру для определения количества групп по указанному направлению.
GO
CREATE PROCEDURE Number_Groups (@Dir AS int, @Number AS int OUTPUT)
AS
	SELECT @Number =COUNT(NumGr) FROM Groups WHERE NumDir=@Dir;
GO
-- Получить и посмотреть результат можно следующим образом:
DECLARE @Group int;
	EXEC Number_Groups 230100, @Group OUTPUT;
SELECT @Group;
GO


-- 6. Пример создания процедуры, использующей вложенные【嵌套】 хранимые процедуры.
-- Создать улучшенную процедуру для перевода студентов указанной группы на следующий курс.
USE LAB4;
INSERT Students VALUES('Уходящий Павел', '63504/3')
INSERT Balls VALUES(3, 22, 5, '2008-01-10')
DROP TABLE ArchiveStudents

CREATE TABLE ArchiveStudents
(
	Id			int				IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	[Year]		INT				NOT NULL,
	NumSt		INT				NOT NULL,
	FIO			nchar(50)		NOT NULL,
	NumGr		char(10)		NOT NULL
)

--ALTER TABLE ArchiveStudents
--	ADD CONSTRAINT UQ_ArchiveStudents_NumSt UNIQUE(NumSt)
--ALTER TABLE ArchiveStudents
--	ADD CONSTRAINT FK_ArchiveStudents_NumSt FOREIGN KEY(NumSt) REFERENCES Students ,
--		CONSTRAINT FK_ArchiveStudents_FIO FOREIGN KEY(FIO) REFERENCES Students(FIO),
--		CONSTRAINT FK_ArchiveStudents_NumGr FOREIGN KEY(NumGr) REFERENCES Students(NumGr)

-- Создадим хранимую процедуру для сохранения данных о закончивших обучение студентах
--	в архиве и удаление информации о них из основной таблицы студентов.
GO
CREATE PROCEDURE Delete_Students_Complete
AS
	INSERT INTO ArchiveStudents SELECT YEAR(GETDATE()), NumSt, FIO, NumGr  FROM Students  WHERE LEFT(NumGr,1)=6;
	DELETE FROM Students WHERE LEFT(NumGr,1)=6;
GO


-- Создадим хранимую процедуру для перевода студентов на следующий курс и удаления из базы данных информации о закончивших обучение студентах.
CREATE PROCEDURE Next_Course_2 
AS
	EXEC Delete_Students_Complete;
	UPDATE Students SET NumGr=CONVERT(char(1),CONVERT(int, LEFT(NumGr,1))+1)+ SUBSTRING(NumGr,2,LEN(NumGr)-1)
	WHERE NumSt IN (SELECT NumSt FROM Students_complete_2);
GO
-- Для обращения к процедуре можно использовать команду:
EXEC Next_Course_2;
 GO


-- Напишите обратную процедуру восстановления студентов из архивной таблицы в основную
GO
CREATE PROC Back_Course_2
AS
	SET IDENTITY_INSERT Students ON
	INSERT INTO Students(NumSt, FIO, NumGr) SELECT NumSt, FIO, NumGr FROM ArchiveStudents
	TRUNCATE TABLE ArchiveStudents
	UPDATE Students SET NumGr=CONVERT(char(1),CONVERT(int, LEFT(NumGr,1))-1)+ SUBSTRING(NumGr,2,LEN(NumGr)-1)
	WHERE NumSt IN (SELECT NumSt FROM Students_complete_2)
GO

EXEC Back_Course_2






-- Вывести представления: ФИО студента, группа студента, оценка по физике
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='vw_PhyExam')
	DROP VIEW vw_PhyExam
GO
CREATE VIEW vw_PhyExam
AS
	SELECT FIO, NumGr, Ball AS PhyMark
		FROM Balls
		INNER JOIN Students
			ON Students.NumSt=Balls.NumSt
		INNER JOIN Uplans
			ON Uplans.IdDisc=Balls.IdDisc
		INNER JOIN Disciplines
			ON Disciplines.NumDisc=Uplans.NumDisc
		WHERE Disciplines.[Name]='Физика'
GO

SELECT * FROM vw_PhyExam



-- процедур: Вывести ФИО студента, группа студента, СРЕДНАЯ оценка каждый студент
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='usp_avgMark')
	DROP PROCEDURE usp_avgMark
GO
CREATE PROC usp_avgMark
AS
	SELECT Students.NumSt, Students.FIO, Students.NumGr, ROUND(AVG(Balls.Ball * 1.0), 3) AS avgMarkStu
	FROM Balls
	INNER JOIN Students
		ON Students.NumSt=Balls.NumSt
	GROUP BY Students.NumSt, Students.FIO, Students.NumGr
GO

exec usp_avgMark


select * from Groups


IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='usp_printStuAllinGroup')
	DROP PROCEDURE usp_printStuAllinGroup
GO
GO
CREATE PROCEDURE usp_printStuAllinGroup
	@nameGroup	char(50)	output
AS
	SELECT Groups.NumGr, Students.NumSt ,Students.FIO
	FROM Groups
	INNER JOIN Students
		ON Students.NumGr=Groups.NumGr
	WHERE Groups.NumGr=@nameGroup
GO

EXEC usp_printStuAllinGroup @nameGroup='13504/1'




IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='vw_stuWithPlan')
	DROP VIEW vw_stuWithPlan
GO

CREATE VIEW vw_stuWithPlan
AS
	SELECT Groups.NumGr, Students.NumSt, Students.FIO, Directions.Title
	FROM Students
		INNER JOIN Groups
			ON Groups.NumGr=Students.NumGr
		INNER JOIN Directions
			ON Directions.NumDir=Groups.NumDir
GO

SELECT * FROM vw_stuWithPlan