USE master

if exists(select * from sysdatabases where name='LAB4_2')
	DROP database LAB4_2
GO

execute sp_configure 'show advanced options',1
Reconfigure
execute sp_configure 'xp_cmdshell',1
Reconfigure
execute xp_cmdshell 'mkdir D:\SQLServer\DataBase\LAB4_2'

CREATE DATABASE LAB4_2
ON PRIMARY
(
	NAME='LAB4_2_data',
	FILENAME='D:\SQLServer\DataBase\LAB4_2\LAB4_2_data.mdf',
	SIZE=5MB,
	MAXSIZE=50MB,
	FILEGROWTH=1MB
)
LOG ON
(
	NAME='LAB4_2_log',
	FILENAME='D:\SQLServer\DataBase\LAB4_2\LAB4_2_log.ldf',
	SIZE=5MB,
	MAXSIZE=50MB,
	FILEGROWTH=1%
)
GO




USE LAB4_2
CREATE TABLE Directions
(
	NumDir			char(6)			not null,
	Title			nvarchar(50)	not null,
	Quantity		int				not null
)
GO

USE LAB4_2
CREATE TABLE Groups
(
	NumGr			char(10)		not null,
	NumDir			char(6)			not null,
	NumSt			int				not null,
	Quantity		int				not null
)
GO

USE LAB4_2
CREATE TABLE Students
(
	NumSt			int				identity(1, 1) not null,
	FIO				nchar(50)		not null,
	NumGr			char(10)		not null
)
GO

USE LAB4_2
CREATE TABLE Disciplines
(
	NumDisc			int				identity(1, 1) not null,
	[Name]			nvarchar(50)	not null
)
GO

USE LAB4_2
CREATE TABLE Uplans
(
	IdDisc			int				identity(1, 1) not null,
	NumDir			char(6)			not null,
	NumDisc			int				not null,
	Semestr			int				not null
)
GO

USE LAB4_2
CREATE TABLE Balls
(
	IdBall			int				identity(1, 1) not null,
	IdDisc			int				not null,
	NumSt			int				not null,
	Ball			int				not null,
	DateEx			datetime		not null
)
GO




ALTER TABLE Directions
	ADD CONSTRAINT PK_Directions_NumDir PRIMARY KEY(NumDir),
		CONSTRAINT UQ_Directions_Title UNIQUE(Title)
GO

ALTER TABLE Groups
	ADD CONSTRAINT UQ_Groups_NumGr UNIQUE(NumGr),
		CONSTRAINT FK_Groups_NumDir FOREIGN KEY(NumDir) REFERENCES Directions(NumDir)
GO

ALTER TABLE Students
	ADD CONSTRAINT PK_Students_NumSt PRIMARY KEY(NumSt),
		CONSTRAINT FK_Students_NumGr FOREIGN KEY(NumGr) REFERENCES Groups(NumGr)
GO

ALTER TABLE Disciplines
	ADD CONSTRAINT PK_Disciplines_NumDisc PRIMARY KEY(NumDisc),
		CONSTRAINT UQ_Disciplines_Name UNIQUE(Name)
GO

ALTER TABLE Uplans
	ADD CONSTRAINT PK_Uplans_IdDisc PRIMARY KEY(IdDisc),
		CONSTRAINT FK_Uplan_NumDir FOREIGN KEY(NumDir) REFERENCES Directions(NumDir),
		CONSTRAINT FK_Uplan_NumDisc FOREIGN KEY(NumDisc) REFERENCES Disciplines(NumDisc)
GO

ALTER TABLE Balls
	ADD CONSTRAINT PK_Balls_IdBall PRIMARY KEY(IdBall),
		CONSTRAINT FK_Balls_IdDisc FOREIGN KEY(IdDisc) REFERENCES Uplans(IdDisc),
		CONSTRAINT FK_Balls_NumSt FOREIGN KEY(NumSt) REFERENCES Students(NumSt)
GO




INSERT INTO dbo.Directions
VALUES
	('230100', 'Информатика и вычислительная техника', '10'),
	('231000', 'Программная инженерия', '10'),
	('230400', 'Информационные системы и технологии', '10'),
	('230200', 'Системы автоматического управления', '5')
GO

INSERT INTO dbo.Groups
VALUES
	('13504/1', '231000', 1, 5),
	('13504/2', '231000', 3, 5),
	('13504/3', '230100', 5, 10),
	('13504/4', '230400', 8, 10)
GO

INSERT INTO dbo.Students
VALUES
	('Иванов Иван', '13504/1'),
	('Смирнов Василий', '13504/4'),
	('Житников Петр', '13504/2'),
	('Семенов Николай', '13504/2'),
	('Веселов Андрей', '13504/3'),
	('Шуман Дмитрий', '13504/1'),
	('Симонов Евгений', '13504/2'),
	('Епифанова Зинаида', '13504/4'),
	('Сумарокова Нина', '13504/4'),
	('Широков Алексей', '13504/4'),
	('Ветрова Ксения', '13504/3'),
	('Свечнова Елена', '13504/4'),
	('Житомирская Екатерина', '13504/1'),
	('Никодимов Семен', '13504/2'),
	('Шведов Эдуард', '13504/1'),
	('Светлов Сергей', '13504/2'),
	('Кленова Жанна', '13504/1'),
	('Пугачев Емельян', '13504/3'),
	('Нарышкин Петр', '13504/3'),
	('Романова Екатерина','13504/3')
GO


INSERT INTO dbo.Disciplines
VALUES
	('Физика'),
	('Математика'),
	('Электроника'),
	('Философия')
GO

INSERT INTO dbo.Uplans
VALUES
	('230100', 1, 1),
	('230100', 1, 2),
	('230100', 2, 1),
	('230100', 2, 2),
	('230100', 3, 2),
	('230100', 4, 1),
	('231000', 1, 1),
	('231000', 2, 2),
	('231000', 3, 2),
	('230400', 1, 1),
	('230400', 2, 2)
GO

INSERT INTO dbo.Balls
VALUES
	(7, 1, 4, '2014.01.10'),
	(1, 2, 3, '2014.01.14'),
	(7, 6, 5, '2014.01.10'),
	(7, 13,	4, '2014.01.10'),
	(7, 15,	5, '2014.01.10'),
	(7, 17,	5, '2014.01.10'),
	(7, 14,	4, '2014.01.12'),
	(1, 18,	5, '2014.01.14'),
	(1, 19,	4, '2014.01.14'),
	(3, 18,	5, '2014.01.16')
GO



--Однотабличный запрос без фильтрации: 
---	выбрать все названия дисциплин из таблицы дисциплины 
SELECT [Name] FROM Disciplines
---	выбрать все номера дисциплин, по которым были получены оценки
SELECT IdDisc FROM Balls
--- с удалением дублей
SELECT DISTINCT IdDisc FROM Balls


--Однотабличный запрос с фильтрацией:
---	выбрать номера студентов, сдавших экзамен 14.01.2014
SELECT NumSt FROM Balls WHERE DateEx='2014.01.14'
---	выбрать номера студентов, которые сдавали дисциплину с номером «1» 10.01.2014
SELECT NumSt FROM Balls WHERE DateEx='2014.01.10' AND IdDisc=1
---	выбрать дисциплины, начинающиеся с буквы Ф
SELECT [Name] FROM Disciplines WHERE [Name] LIKE 'Ф%'


--Однотабличный запрос с группировкой:
---	вывести имеющееся количество групп
SELECT COUNT(NumGr) FROM Groups
---	вывести количество групп по каждому направлению
SELECT NumDir, COUNT(NumGr) FROM Groups GROUP BY NumDir
---	вывести номера направлений, по которым имеется более чем одна группа
SELECT NumDir FROM Groups 
     GROUP BY NumDir HAVING COUNT(NumGr)>1


--Многотабличные запросы
---	вывести наименование направлений, по которым имеется более чем одна группа
USE LAB4_2
SELECT Title 
	FROM Groups, Directions 
		WHERE Groups.NumDir=Directions.NumDir
			GROUP BY Title HAVING COUNT(NumGr)>1


-- HomeWork
USE LAB4_2
--3. Составьте следующие простейшие запросы на выборку данных:
--	3.1. Выберите все направления подготовки, по которым обучаются студенты
SELECT DISTINCT Directions.Title
	FROM Groups, Directions
	WHERE Groups.NumDir=Directions.NumDir

SELECT DISTINCT Directions.Title
	FROM Directions
	INNER JOIN Groups ON Groups.NumDir=Directions.NumDir
		
--	3.2. Выберите все номера групп по всем направлениям подготовки
SELECT Groups.NumGr, Directions.Title
	FROM Groups, Directions
	WHERE Groups.NumDir=Directions.NumDir
	ORDER BY Groups.NumGr desc

--	3.3. Выберите ФИО всех студентов
SELECT Students.FIO FROM Students

USE LAB4_2
--	3.4. Выберите идентификаторы(识别码) всех студентов, которые получили оценки
SELECT Balls.IdBall, Students.FIO
	FROM Balls, Students
	WHERE BallS.NumSt=Students.NumSt

--	3.5. Выберите номера направлений подготовки специалистов, которые включены в учебный план.
--			Напишите два варианта запроса: без DISTINCT и с использованием DISTINCT
SELECT Directions.* 
	FROM Directions, Uplans
	WHERE Uplans.NumDir=Directions.NumDir

SELECT DISTINCT Directions.* 
	FROM Directions, Uplans
	WHERE Uplans.NumDir=Directions.NumDir

--	3.6. Выберите номера семестров из таблицы Uplans, удалив дубликаты строк.
SELECT DISTINCT Uplans.Semestr
	FROM Uplans

--	3.7. Выберите всех студентов группы 13504/1
SELECT Students.FIO
	FROM Students
	WHERE Students.NumGr='13504/1'

--	3.8. Выберите дисциплины первого семестра для направления 230100
SELECT DISTINCT Disciplines.[Name]
	FROM Disciplines, Uplans
	WHERE Uplans.Semestr=1 AND Uplans.NumDir='230100'

--	3.9. Выведите номера групп с указанием количества студентов в каждой группе
SELECT Students.NumGr, COUNT(*) AS 'Количество студентов'
	FROM Students
	GROUP BY Students.NumGr
	ORDER BY Students.NumGr

--	3.10. Выведите для каждой группы количество студентов, сдававших хотя бы один экзамен
SELECT Students.NumGr, COUNT(*) AS 'Количество студентов'
	FROM Students, Balls
	WHERE Students.NumSt=Balls.NumSt
	GROUP BY Students.NumGr
	ORDER BY COUNT(*) desc

--	3.11. Выведите для каждой группы количество студентов, сдавших более одного экзамена
SELECT Students.NumGr, COUNT(*) AS 'Количество студентов'
	FROM Students, Balls
	WHERE Students.NumSt=Balls.NumSt
	GROUP BY Students.NumGr
	HAVING COUNT(*)>1
	ORDER BY COUNT(*) desc

--4. Составьте многотабличные запросы:
--	4.1. Выберите ФИО студентов, которые сдали экзамены
SELECT DISTINCT Students.FIO AS 'Студентов, которые сдали экзамены'
	FROM Students, Balls
	WHERE Students.NumSt=Balls.NumSt

--	4.2. Выберите названия дисциплин, по которым студенты сдавали экзамены
SELECT Students.NumSt, Students.FIO, Disciplines.[Name]
	FROM Students, Balls, Uplans, Disciplines
	WHERE Students.NumSt=Balls.NumSt AND Balls.IdDisc=Uplans.IdDisc

SELECT Disciplines.[Name]
	FROM Disciplines
	WHERE Disciplines.NumDisc IN (
			SELECT DISTINCT Uplans.NumDisc
			FROM Uplans, Balls
			WHERE Balls.IdDisc=Uplans.IdDisc
		)

--	4.3. Выведите названия дисциплин по направлению 230100
SELECT DISTINCT Disciplines.[Name]
	FROM Uplans, Disciplines
	WHERE Uplans.NumDir='230100' AND Uplans.NumDisc=Disciplines.NumDisc

--	4.4. Выведите ФИО студентов, которые сдали более одного экзамена
SELECT Students.FIO
	FROM Students, Balls
	WHERE Students.NumSt=Balls.NumSt
	GROUP BY Students.FIO, Balls.NumSt
	HAVING COUNT(Balls.NumSt)>1

SELECT * 
	FROM Students
	WHERE Students.NumSt IN 
	(
		SELECT Balls.NumSt
			FROM Balls
			GROUP BY Balls.NumSt
			HAVING COUNT(Balls.NumSt)>1
	)

--4.5. Выведите ФИО студентов, получивших минимальный балл
DECLARE @min_ball AS INT = (SELECT MIN(Balls.Ball) FROM Balls)
DECLARE @min_ball_stu_num AS INT = (SELECT Balls.NumSt
								FROM Balls
								WHERE Balls.Ball=@min_ball)
SELECT *
	FROM Students
	WHERE Students.NumSt=@min_ball_stu_num
---------------
-- TODO 
SELECT Students.FIO
	FROM Students
	WHERE Students.NumSt=
		(
			SELECT Balls.NumSt
				FROM Balls
				WHERE Balls.Ball=
				(
					SELECT MIN(Balls.Ball) FROM Balls
				)
		)


-- NEW---------------------------------------------------------
SELECT Students.FIO, Balls.Ball
	FROM Students, Balls
	WHERE Students.NumSt=
		(
			SELECT Balls.NumSt
				FROM Balls
				WHERE Balls.Ball=
				(
					SELECT MIN(Balls.Ball) FROM Balls
				)
		)
		AND Balls.Ball=(SELECT MIN(Balls.Ball) FROM Balls)

--4.6. Выведите ФИО студентов, получивших максимальный балл
DECLARE @max_ball AS INT = (SELECT MAX(Balls.Ball) FROM Balls)
SELECT *
	FROM Students
	WHERE Students.NumSt IN (SELECT Balls.NumSt
								FROM Balls
								WHERE Balls.Ball=@max_ball)
---------------
SELECT *
	FROM Students
	WHERE Students.NumSt IN
		(
			SELECT Balls.NumSt
				FROM Balls
				WHERE Balls.Ball IN
				(
					SELECT MAX(Balls.Ball) FROM Balls
				)
		)

		
--4.7. Выведите номера групп, в которые есть более одного студента,
-- сдавшего экзамен по Физике в 1 семестре
DECLARE @num_phy AS INT = (SELECT Disciplines.NumDisc FROM Disciplines WHERE Disciplines.[Name]='Физика')
SELECT Students.NumGr
	FROM Students
	WHERE Students.NumSt IN
	(
		SELECT Balls.NumSt
			FROM Balls
			WHERE Balls.IdDisc IN
				(
					SELECT Uplans.IdDisc
						FROM Uplans
						WHERE Uplans.NumDisc=@num_phy AND Uplans.Semestr=1
				)
	)
	GROUP BY Students.NumGr
	HAVING COUNT(Students.NumGr)>1
			
			
-- TODO 
--4.8. Выведите ФИО студентов, получивших за время обучения общее количество баллов по всем предметам более 9.
SELECT DISTINCT FIO, BallS.NumSt 
	FROM Balls, Students
	GROUP BY Students.FIO, Balls.NumSt
	HAVING SUM(Balls.Ball)>9

--4.9. Выведите семестры, по которым количество сдавших студентов более одного
SELECT Semestr FROM Uplans, Balls
	WHERE Balls.IdDisc=Uplans.IdDisc
	GROUP BY Semestr
	HAVING COUNT(Balls.NumSt)>1

--4.10. Выведите студентов, сдавших более одного предмета.
SELECT FIO FROM Students, Balls
	WHERE Students.NumSt=Balls.NumSt
	GROUP BY FIO
	HAVING COUNT(FIO)>1





-- NEW---------------------------------------------------------
SELECT Students.FIO, Balls.Ball
	FROM Students, Balls
	WHERE Students.NumSt=
		(
			SELECT Balls.NumSt
				FROM Balls
				WHERE Balls.Ball=
				(
					SELECT MIN(Balls.Ball) FROM Balls
				)
		)
		AND Balls.Ball=(SELECT MIN(Balls.Ball) FROM Balls)


--4.8. Выведите ФИО студентов, получивших за время обучения общее количество баллов по всем предметам более 9.
SELECT FIO, SUM(Ball) AS 'Ball'
	FROM Balls, Students
	WHERE Balls.NumSt=Students.NumSt
	GROUP BY FIO
	HAVING SUM(Ball)>9

-- Вывести всех, кто получил оценку по физике. ФИО и оценку
SELECT Students.FIO, Students.NumGr
	FROM Students
	WHERE Students.NumSt IN
	(
		SELECT Balls.NumSt
			FROM Balls
			WHERE Balls.IdDisc IN
			(
				SELECT DISTINCT Uplans.IdDisc
				FROM Uplans
				WHERE Uplans.NumDisc=
					(SELECT Disciplines.NumDisc FROM Disciplines WHERE Disciplines.[Name]='Физика')
			)
	)

SELECT Students.FIO, Students.NumGr
	FROM Students
	WHERE Students.NumSt IN
	(
		SELECT Balls.NumSt
			FROM Balls
			WHERE Balls.IdDisc IN
			(
				SELECT DISTINCT Uplans.IdDisc
				FROM Uplans
				WHERE Uplans.NumDisc=
					(SELECT Disciplines.NumDisc FROM Disciplines WHERE Disciplines.[Name]='Физика')
			)
	)


-- 2. Вывести FIO и Номер группы и направление, студентов, которые получили оценку
SELECT DISTINCT Balls.NumSt	FROM Balls

SELECT Students.FIO, Students.NumGr
	FROM Students
	WHERE Students.NumSt IN (SELECT DISTINCT Balls.NumSt FROM Balls)

SELECT Groups.NumDir
	FROM Groups
	WHERE Groups.NumGr IN
	(
		SELECT Students.NumGr
			FROM Students
			WHERE Students.NumSt IN 
			(
				SELECT DISTINCT Balls.NumSt FROM Balls
			)
	)
		


-- 2. Вывести FIO и Номер группы и направление, студентов, которые получили оценку
SELECT DISTINCT Balls.NumSt	FROM Balls

use LAB4_2
SELECT DISTINCT Students.FIO, Students.NumGr, Directions.title
	FROM Students, Balls, Directions, Groups
	WHERE Students.NumSt=Balls.NumSt 
		AND Students.NumGr=Groups.NumGr
		AND Directions.NumDir=Groups.NumDir
