USE LAB4;
GO

------------------> ��ͼ���� ����ڧާ֧�� ���٧էѧߧڧ� �� �ڧ���ݧ�٧�ӧѧߧڧ� ���֧է��ѧӧݧ֧ߧڧ�


--1.	����ڧާ֧� ���٧էѧߧڧ� �� �ڧ���ݧ�٧�ӧѧߧڧ� ���֧է��ѧӧݧ֧ߧڧ� �էݧ� �ӧ�ҧ��ܧ�  �ߧѧ٧ӧѧߧڧ� �էڧ��ڧ�ݧڧ�, 
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
