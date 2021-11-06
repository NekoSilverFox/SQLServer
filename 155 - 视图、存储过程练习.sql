USE LAB4;
GO

------------------> 视图例子 Примеры создания и использования представлений


--1.	Пример создания и использования представления для выборки  названий дисциплин, 
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
