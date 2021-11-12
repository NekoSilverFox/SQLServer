USE LAB4;
GO

------------------> ��ͼ���� ����ڧާ֧�� ���٧էѧߧڧ� �� �ڧ���ݧ�٧�ӧѧߧڧ� ���֧է��ѧӧݧ֧ߧڧ�

--1.	����ڧާ֧� ���٧էѧߧڧ� �� �ڧ���ݧ�٧�ӧѧߧڧ� �����֧է��ѧӧݧ֧ߧڧ� �էݧ� �ӧ�ҧ��ܧ�  �ߧѧ٧ӧѧߧڧ� �էڧ��ڧ�ݧڧ�, 
--	��� �ܧ������ ����� �ҧ� ��էߧڧ� ����է֧ߧ��� �ҧ�ݧ� ���ݧ��֧ߧ� ���֧ߧܧ� 
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


--2. ����ڧާ֧� ���٧էѧߧڧ� �������֧է��� c �ӧ��էߧ�� ��ѧ�ѧާ֧����. ����������������ġ��洢���̡�������
--����٧էѧ֧� �����֧է��� �էݧ� ���է��֧�Ѽ��� ����է֧ߧ���, ��էѧӧ�ڧ� ����� �ҧ� ��էڧ� ��ܧ٧ѧާ֧� �� �٧ѧէѧߧߧ��ĳһ����Ϊ���룩 ��֧ާ֧����
GO
CREATE PROCEDURE Count_Students_Sem
	@Count_sem AS INT
AS
	SELECT COUNT(Distinct NumSt)
	FROM Balls
	JOIN Uplans ON Uplans.IdDisc=Balls.IdDisc
	WHERE Semestr>=@Count_sem;
GO



--3. ����ڧާ֧� ���٧էѧߧڧ� �� �ڧ���ݧ�٧�ӧѧߧڧ� �����֧է��ѧӧݧ֧ߧڧ� �� �ڧ���ݧ�٧�ӧѧߧڧ֧� �ѧԧ�֧ԧѧ�ߧ�� ���ߧܧ�ڧۡ��ۺϺ�����, 
--	 �ԧ����ڧ��ӧܧڡ����顿 �� ���է٧ѧ������ �էݧ� �ӧ�ӧ�է� ����է֧ߧ���, �ܧ������ ��էѧݧ� �ӧ�� ��ܧ٧ѧާ֧ߧ� ��֧�ӧ�ԧ� ��֧ާ֧����
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


-- 4. ����ڧާ֧� ���٧էѧߧڧ� �� �ڧ���ݧ�٧�ӧѧߧڧ� ���֧է��ѧӧݧ֧ߧڧ� �� �ڧ���ݧ�٧�ӧѧߧڧ֧� ���֧էڧܧѧ�� NOT EXISTS
	-- �էݧ� �ӧ�ӧ�է� �ߧ�ާ֧��� ����է֧ߧ���, �ܧ������ ��էѧݧ� �ӧ�� ��ܧ٧ѧާ֧ߧ� ��ӧ�֧ԧ� �ܧ���� 
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


------------------> �洢�������� ����ڧާ֧�� ���٧էѧߧڧ� �� �٧ѧ���ܧ� ���ѧߧڧާ�� �����֧է��
-- 1. ����ڧާ֧� ���٧էѧߧڧ� �����֧է��� �ҧ֧� ��ѧ�ѧާ֧����.
-- ����٧էѧ֧� �����֧է��� �էݧ� ���է��֧�� ��ҧ�֧ԧ� �ܧ�ݧڧ�֧��ӧ� ����է֧ߧ���
GO
CREATE PROCEDURE Count_Students
AS
	SELECT COUNT(*) FROM Students
GO

EXEC Count_Students


-- 2. ����ڧާ֧� ���٧էѧߧڧ� �����֧է��� c �ӧ��էߧ�� ��ѧ�ѧާ֧����.
--		����٧էѧ֧� �����֧է��� �էݧ� ���է��֧�� ����է֧ߧ���, ��էѧӧ�ڧ� ����� �ҧ� ��էڧ� ��ܧ٧ѧާ֧� �� �٧ѧէѧߧߧ�� ��֧ާ֧����
GO
CREATE PROCEDURE Count_Students_Sem2
	@Count_sem AS INT
AS
	SELECT COUNT(Distinct NumSt) FROM Balls
		JOIN Uplans ON Uplans.IdDisc=Balls.IdDisc
	WHERE Semestr>=@Count_sem;
GO

EXEC Count_Students_Sem2 1
-- �ڧݧ� �� �ڧ���ݧ�٧�ӧѧߧڧ֧� ��֧�֧ާ֧ߧߧ��
DECLARE @kol int;
SET @kol=1;
EXEC Count_Students_Sem2 @kol;


-- 3.1. ����٧էѧ֧� �����֧է��� �էݧ� ���ݧ��֧ߧڧ� �����ڧ�ܧѡ� ����է֧ߧ��� ��ܧѧ٧ѧߧߧ�ԧ� �ߧѧ��ѧӧݧ֧ߧڧ�,
-- ��էѧӧ�ڧ� ��ܧ٧ѧާ֧� ��� ��ܧѧ٧ѧߧߧ�� �էڧ��ڧ�ݧڧߧ�
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

EXEC List_Students_Dir 230100, '���ڧ٧ڧܧ�'
-- �ڧݧ� �� �ڧ���ݧ�٧�ӧѧߧڧ֧� ��֧�֧ާ֧ߧߧ��
DECLARE @dir int, @title varchar(30);
SET @dir=230100;
SET @title ='���ڧ٧ڧܧ�';
EXEC List_Students_Dir @dir,@title;


-- 3.2. ����٧էѧ֧� �����֧է��� �էݧ� �ӧӧ�է� �ڧߧ���ާѧ�ڧ� �� �ߧ�ӧ�� ����է֧ߧ��

GO
CREATE PROCEDURE Enter_Students (@Fio AS VARCHAR(30), @Group AS VARCHAR(10))
AS
	INSERT INTO Students(FIO, NumGr) VALUES (@Fio, @Group);
GO

DECLARE @Stud VARCHAR(30), @Group varchar(10);
SET @Stud='����ӧѧ� ���ѧ�ѧݧ��';
SET @Group ='53504/3';
--INSERT Groups VALUES(@Group, 230400, 0, 15)
EXEC Enter_Students @Stud, @Group;



-- 4. ����ڧާ֧� ���٧էѧߧڧ� �����֧է��� �� �ӧ��էߧ�ާ� ��ѧ�ѧާ֧��ѧާ� �� �٧ߧѧ�֧ߧڧ�ާ� ��� ��ާ�ݧ�ѧߧڧ�.
--	����٧էѧ�� �����֧է��� �էݧ� ��֧�֧ӧ�է� ����է֧ߧ��� ��ܧѧ٧ѧߧߧ�� �ԧ����� �ߧ� ��ݧ֧է���ڧ� �ܧ���
GO
--����ҧѧӧ��� �� ��ѧҧݧڧ�� Groups �ߧ�ӧ�� �٧ѧ�ڧ�� �� �ԧ����ѧާ� 23504/3 �� 23504/1

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


-- !!! ���ѧ�ڧ�ڧ�� �����֧է���, �ܧ����ѧ� �ҧ�է֧� �ӧ�٧ӧ�ѧ�ѧ�� ���ѧ��� �ߧ�ާ֧�� �ԧ���� ��ҧ�ѧ�ߧ�
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


-- 5. ����ڧާ֧� ���٧էѧߧڧ� �����֧է��� �� �ӧ��էߧ�ާ� �� �ӧ���էߧ�ާ� ��ѧ�ѧާ֧��ѧާ�.
-- ����٧էѧ�� �����֧է��� �էݧ� ����֧է֧ݧ֧ߧڧ� �ܧ�ݧڧ�֧��ӧ� �ԧ���� ��� ��ܧѧ٧ѧߧߧ�ާ� �ߧѧ��ѧӧݧ֧ߧڧ�.
GO
CREATE PROCEDURE Number_Groups (@Dir AS int, @Number AS int OUTPUT)
AS
	SELECT @Number =COUNT(NumGr) FROM Groups WHERE NumDir=@Dir;
GO
-- ����ݧ��ڧ�� �� ����ާ���֧�� ��֧٧�ݧ��ѧ� �ާ�اߧ� ��ݧ֧է���ڧ� ��ҧ�ѧ٧��:
DECLARE @Group int;
	EXEC Number_Groups 230100, @Group OUTPUT;
SELECT @Group;
GO


-- 6. ����ڧާ֧� ���٧էѧߧڧ� �����֧է���, �ڧ���ݧ�٧���֧� �ӧݧ�ا֧ߧߧ�֡�Ƕ�ס� ���ѧߧڧާ�� �����֧է���.
-- ����٧էѧ�� ��ݧ���֧ߧߧ�� �����֧է��� �էݧ� ��֧�֧ӧ�է� ����է֧ߧ��� ��ܧѧ٧ѧߧߧ�� �ԧ����� �ߧ� ��ݧ֧է���ڧ� �ܧ���.
USE LAB4;
INSERT Students VALUES('�����է��ڧ� ���ѧӧ֧�', '63504/3')
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

-- ����٧էѧէڧ� ���ѧߧڧާ�� �����֧է��� �էݧ� �����ѧߧ֧ߧڧ� �էѧߧߧ�� �� �٧ѧܧ�ߧ�ڧӧ�ڧ� ��ҧ��֧ߧڧ� ����է֧ߧ�ѧ�
--	�� �ѧ��ڧӧ� �� ��էѧݧ֧ߧڧ� �ڧߧ���ާѧ�ڧ� �� �ߧڧ� �ڧ� ���ߧ�ӧߧ�� ��ѧҧݧڧ�� ����է֧ߧ���.
GO
CREATE PROCEDURE Delete_Students_Complete
AS
	INSERT INTO ArchiveStudents SELECT YEAR(GETDATE()), NumSt, FIO, NumGr  FROM Students  WHERE LEFT(NumGr,1)=6;
	DELETE FROM Students WHERE LEFT(NumGr,1)=6;
GO


-- ����٧էѧէڧ� ���ѧߧڧާ�� �����֧է��� �էݧ� ��֧�֧ӧ�է� ����է֧ߧ��� �ߧ� ��ݧ֧է���ڧ� �ܧ��� �� ��էѧݧ֧ߧڧ� �ڧ� �ҧѧ٧� �էѧߧߧ�� �ڧߧ���ާѧ�ڧ� �� �٧ѧܧ�ߧ�ڧӧ�ڧ� ��ҧ��֧ߧڧ� ����է֧ߧ�ѧ�.
CREATE PROCEDURE Next_Course_2 
AS
	EXEC Delete_Students_Complete;
	UPDATE Students SET NumGr=CONVERT(char(1),CONVERT(int, LEFT(NumGr,1))+1)+ SUBSTRING(NumGr,2,LEN(NumGr)-1)
	WHERE NumSt IN (SELECT NumSt FROM Students_complete_2);
GO
-- ���ݧ� ��ҧ�ѧ�֧ߧڧ� �� �����֧է��� �ާ�اߧ� �ڧ���ݧ�٧�ӧѧ�� �ܧ�ާѧߧէ�:
EXEC Next_Course_2;
 GO


-- ���ѧ�ڧ�ڧ�� ��ҧ�ѧ�ߧ�� �����֧է��� �ӧ����ѧߧ�ӧݧ֧ߧڧ� ����է֧ߧ��� �ڧ� �ѧ��ڧӧߧ�� ��ѧҧݧڧ�� �� ���ߧ�ӧߧ��
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






-- ����ӧ֧��� ���֧է��ѧӧݧ֧ߧڧ�: ������ ����է֧ߧ��, �ԧ����� ����է֧ߧ��, ���֧ߧܧ� ��� ��ڧ٧ڧܧ�
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
		WHERE Disciplines.[Name]='���ڧ٧ڧܧ�'
GO

SELECT * FROM vw_PhyExam



-- �����֧է��: ����ӧ֧��� ������ ����է֧ߧ��, �ԧ����� ����է֧ߧ��, �������������� ���֧ߧܧ� �ܧѧاէ�� ����է֧ߧ�
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