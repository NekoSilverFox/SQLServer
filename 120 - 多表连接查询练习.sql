USE LAB4
--������ݧ�٧�ӧѧߧڧ� ��ѧ٧ݧڧ�ߧ�� �ӧڧէ�� ���֧�ѧ�ڧ� ���֧էڧߧ֧ߧڧ� ��JOIN��: 
---	�ӧ�ҧ�ѧ�� �ӧ�� �ߧѧ٧ӧѧߧڧ� �էڧ��ڧ�ݧڧ�, ��� �ܧ������ ����է֧ߧ�ѧާ� �ҧ�ݧ� ���ݧ��֧ߧ� ���֧ߧܧ�
SELECT Distinct Name
	FROM Disciplines
	INNER JOIN Uplans
		ON Disciplines.NumDisc=Uplans.NumDisc
	INNER JOIN Balls
		ON Uplans.IdDisc=Balls.IdDisc

---	�ӧ�ҧ�ѧ�� �ӧ�֧� ����է֧ߧ��� �� ����ܧѧ٧ѧߧڧ֧ޡ� ���֧ߧ��, �֧�ݧ� ��ߧ� �֧���
SELECT FIO, Ball
	FROM Students
	LEFT JOIN Balls
		ON Students.NumSt=Balls.NumSt

--������ݧ�٧�ӧѧߧڧ� ���֧�ѧ�ڧ� ���ӧ��ڧ�ѧߧڧ�, ����֧�֧�֧�֧ߧڧ� �� ����ҧ�֧էڧߧ֧ߧڧ�
---	�ӧ�ҧ�ѧ�� �ߧ�ާ֧�� ����է֧ߧ���, �� �ܧ������ ==�ߧ֧�== ���֧ߧ��
SELECT NumSt FROM Students
EXCEPT
Select NumSt FROM Balls

---	�ӧ�ҧ�ѧ�� �ߧ�ާ֧�� ����է֧ߧ���, �ܧ������ ��էѧݧ� ����� �ҧ� ��էڧ� ��ܧ٧ѧާ֧�
--SELECT NumSt FROM Students
--INTERSECT
--Select NumSt FROM Balls

---	�ӧ�ҧ�ѧ�� ����է֧ߧ���, �ܧ������ ���ݧ��ڧݧ� ==����֧�ܧ�== �� �ܧ������ �ӧ��ҧ�� �ߧڧ�֧ԧ� �ߧ� ��էѧݧ�
--(SELECT NumSt FROM Balls WHERE Ball=5)
--UNION
--(SELECT NumSt FROM Students EXCEPT Select NumSt FROM Balls)

--������ݧ�٧�ӧѧߧڧ� ���է٧ѧ������: �Ӳ�ѯ
---	�ӧ�ӧ֧��� ����է֧ߧ���, �ܧ������ ��էѧݧ� ==�ӧ��== ��ܧ٧ѧާ֧ߧ� ==��֧�ӧ�ԧ�== ��֧ާ֧����
SELECT NumSt, NumDir, COUNT(Ball) 
	FROM Balls
	JOIN Uplans
		ON Balls.IdDisc=Uplans.IdDisc
	WHERE Semestr=1
	GROUP BY NumSt, NumDir 
	HAVING Count(Ball)=(SELECT COUNT(*) FROM Uplans u WHERE Uplans.NumDir=u.NumDir and semestr=1)

---	�ӧ����� �ӧѧ�ڧѧߧ� ���ԧ� �ا� �٧ѧ����� �� �ڧ���ݧ�٧�ӧѧߧڧ֧� NOT EXISTS
--SELECT NumSt
--FROM Students
--	JOIN Groups ON Groups.NumGr=Students.NumGr 
--	WHERE NOT EXISTS
--	(	SELECT * FROM Uplans  WHERE Semestr=1
--		AND Students.NumDir=Uplans.NumDir
--		AND NOT EXISTS
--		(SELECT * FROM Balls WHERE Balls.IdDisc=Uplans.IdDisc and Students.NumSt=Balls.NumSt)
--	)


--------------------------------- ���ݧѧ� ��ѧҧ��� ---------------------------------
--	3.1. ����ҧ֧�ڧ�� �ߧѧ��ѧӧݧ֧ߧڧ�, �� �ܧ������ �֧��� ����է֧ߧ��, �ܧ������ ��էѧݧ� ��ܧ٧ѧާ֧ߧ� 
USE LAB4
SELECT Distinct Directions.Title
	FROM Directions
	INNER JOIN Uplans
		ON Directions.NumDir=Uplans.NumDir
	INNER JOIN Balls
		ON Uplans.IdDisc=Balls.IdDisc

--	3.2. ����ҧ֧�ڧ�� ���ߧѧڧާ֧ߧ�ӧѧߧڧ� �էڧ��ڧ�ݧڧߡ� ��֧�ӧ�ԧ� ��֧ާ֧���� ѡ���һѧ�ڵġ�ѧ�����ơ�
SELECT Distinct Directions.NumDir, Directions.Title
	FROM Directions
	INNER JOIN Uplans
		ON Directions.NumDir=Uplans.NumDir
	WHERE Semestr=1


--	3.3. ����ҧ֧�ڧ�� �ߧ�ާ֧�� �ԧ����, �� �ܧ������ �֧��� ����է֧ߧ��, ��էѧӧ�ڧ� ����� �ҧ� ��էڧ� ��ܧ٧ѧާ֧�
SELECT Distinct Students.NumGr
	FROM Students
	LEFT JOIN Balls
		ON Balls.NumSt=Students.NumSt


--	3.4. ����ӧ֧էڧ�� �ߧѧڧާ֧ߧ�ӧѧߧڧ� �էڧ��ڧ�ݧڧ� �� ��ܧѧ٧ѧߧڧ֧� �ڧէ֧ߧ�ڧ�ڧܧѧ���� ����է֧ߧ��, �֧�ݧ� ��� ��էѧ� ��ܧ٧ѧާ֧� ���ѧ��ͨ�����ԣ�������γ����ƺ�ѧ�����
SELECT Students.NumSt, Students.FIO, Disciplines.Name
	FROM Students
	RIGHT JOIN Balls
		ON Balls.NumSt=Students.NumSt
	INNER JOIN Uplans
		ON Balls.IdDisc=Uplans.IdDisc
	INNER JOIN Disciplines
		ON Uplans.NumDisc=Disciplines.NumDisc
	WHERE Balls.Ball>=3


--	3.5. ����ҧ֧�ڧ�� �ߧ�ާ֧�� �ԧ����, �� �ܧ������ �֧��� ��ӧ�ҧ�էߧ�� �ާ֧���.
SELECT COUNT(*)
	FROM Groups
	INNER JOIN Students
		ON Students.NumGr=Groups.NumGr
	GROUP BY Groups.NumGr
	ORDER BY Groups.NumGr


SELECT Groups.NumGr, COUNT(*) AS NumStudentsNow, Groups.Quantity
	FROM Groups
	INNER JOIN Students
		ON Groups.NumGr=Students.NumGr
	GROUP BY Groups.NumGr, Groups.Quantity
	HAVING COUNT(*)<Groups.Quantity
	ORDER BY Groups.NumGr		-- ������û�У��������

--	3.6. ����ҧ֧�ڧ�� �ߧ�ާ֧�� �ԧ����, �� �ܧ������ �֧��� ����է֧ߧ��, ��էѧӧ�ڧ� �ҧ�ݧ��� ��էߧ�ԧ� ��ܧ٧ѧާ֧ߧ�,
-- �է�ҧѧӧڧ� �� �ߧڧ� �ߧ�ާ֧�� �ԧ����, �� �ܧ������ �֧��� ����է֧ߧ��, �ܧ������ �ߧڧ�֧ԧ� �ߧ� ��էѧݧ�. 
-- �����Ӧ�õ���ÿ��ѧ����������ֻ�ǰ༶��
SELECT Students.NumGr, Students.NumSt, COUNT(*) AS '����ݧڧ�֧��ӧ� ��ܧ�', '���� ����է֧ߧ�, ��էѧӧ�ڧ� �ҧ�ݧ��� ��էߧ�ԧ� ��ܧ٧ѧާ֧ߧ�' AS 'Info'
	FROM Students
	RIGHT JOIN Balls
		ON Students.NumSt=Balls.NumSt
	GROUP BY Students.NumGr, Students.NumSt
	HAVING COUNT(*)>1
UNION
SELECT Students.NumGr, Students.NumSt, 0 AS '����ݧڧ�֧��ӧ� ��ܧ�', '���� ����է֧ߧ� �ߧڧ�֧ԧ� �ߧ� ��էѧݧ�' AS 'Info'
	FROM Students
	FULL JOIN Balls
		ON Students.NumSt=Balls.NumSt
	WHERE Ball IS NULL
	GROUP BY Students.NumGr, Students.NumSt
	ORDER BY 'Info'



SELECT Students.NumGr, '�֧��� ����է֧ߧ��, ��էѧӧ�ڧ� �ҧ�ݧ��� ��էߧ�ԧ� ��ܧ٧ѧާ֧ߧ�' AS '�ߧ�ާ֧�� �ԧ����, �� �ܧ������'
	FROM Students
	RIGHT JOIN Balls
		ON Students.NumSt=Balls.NumSt
	GROUP BY Students.NumGr, Students.NumSt
	HAVING COUNT(*)>1
UNION
SELECT Students.NumGr, '�֧��� ����է֧ߧ��, �ܧ������ �ߧڧ�֧ԧ� �ߧ� ��էѧݧ�' AS '�ߧ�ާ֧�� �ԧ����, �� �ܧ������'
	FROM Students
	FULL JOIN Balls
		ON Students.NumSt=Balls.NumSt
	WHERE Ball IS NULL
	GROUP BY Students.NumGr, Students.NumSt
	ORDER BY '�ߧ�ާ֧�� �ԧ����, �� �ܧ������'


--	3.7. ����ҧ֧�ڧ�� �էڧ��ڧ�ݧڧߧ�, �ܧ������ �֧��� �� �� ��֧�ӧ�� �� �ӧ� �ӧ����� ��֧ާ֧����



--	3.8. ����ڧէ�ާѧۧ�� �٧ѧ����, �ܧ������ �ڧ���ݧ�٧�֧� ���֧�ѧ�ڧ� ���֧էڧߧ֧ߧڧ� ��� �ߧ֧�ѧӧ֧ߧ��ӧ�
--	3.9. ����ڧէ�ާѧۧ�� �٧ѧ����, �ܧ������ �ڧ���ݧ�٧�֧� ���֧�ѧ�ڧ� �ӧߧ֧�ߧ֧ԧ� ���֧էڧߧ֧ߧڧ� ����ѧӧ�, ���֧էӧѧ�ڧ�֧ݧ�ߧ� ���էԧ���ӧڧ� ��֧���ӧ�� �էѧߧߧ��.
--	3.10. ����ڧէ�ާѧۧ�� �٧ѧ���� �� �ԧ����ڧ��ӧܧ�� �� ���֧էڧߧ֧ߧڧ֧� �ߧ֧�ܧ�ݧ�ܧڧ� ��ѧҧݧڧ�.
--4. ������ѧӧ��� �٧ѧ����� �� �ڧ���ݧ�٧�ӧѧߧڧ֧� ���է٧ѧ������, �� ���� ��ڧ�ݧ� �� ���֧էڧܧѧ�ѧާ� EXISTS ��  NOT EXISTS
--	4.1. ����ҧ֧�ڧ�� ����է֧ߧ���, �ܧ������ ��էѧݧ� ���ݧ�ܧ� ��էߧ� �էڧ��ڧ�ݧڧߧ�
--	4.2. ����ҧ�ѧ�� ����է֧ߧ���, �ܧ������ �ߧ� ��էѧݧ� �ߧ� ��էߧ�ԧ� ��ܧ٧ѧާ֧ߧ�
--	4.3. ����ҧ֧�ڧ�� �ԧ�����, �� �ܧ������ �֧��� ����է֧ߧ��, ��էѧӧ�ڧ� �ӧ�� ��ܧ٧ѧާ֧ߧ� 1 ��֧ާ֧����
--	4.4. ����ҧ֧�ڧ�� �ԧ�����, �� �ܧ������ �֧��� ����է֧ߧ��, �ܧ������ �ߧ� ��էѧݧ� �ߧ� ��էߧ�� �էڧ��ڧ�ݧڧߧ�
--	4.5. ����ҧ�ѧ�� �էڧ��ڧ�ݧڧߧ�, �ܧ������ �ߧ� ����ѧݧ� �� ���֧ҧߧ�� ��ݧѧ� �ߧѧ��ѧӧݧ֧ߧڧ� 231000
--	4.6. ����ҧ�ѧ�� �էڧ��ڧ�ݧڧߧ�, �ܧ������ �ߧ� ��էѧݧ� �ӧ�� ����է֧ߧ�� �ߧѧ��ѧӧݧ֧ߧڧ� 231000
--	4.7. ����ҧ�ѧ�� �ԧ�����, �� �ܧ������ �ӧ�� ����է֧ߧ�� ��էѧݧ� ��ڧ٧ڧܧ�
--	4.8. ����ҧ�ѧ�� �ԧ�����, �� �ܧ������ �ӧ�� ����է֧ߧ�� ��էѧݧ� �ӧ�� �էڧ��ڧ�ݧڧߧ� 1 ��֧ާ֧����
--	4.9. ����ҧ�ѧ�� ����է֧ߧ���, �ܧ������ ��էѧݧ� �ӧ�� ��ܧ٧ѧާ֧ߧ� �ߧ� ������� �� ���ݧڧ�ߧ�.
--	4.10. ����ҧ�ѧ�� ����է֧ߧ���, �ܧ������ ��էѧݧ� �ߧѧڧҧ�ݧ��֧� �ܧ�ݧڧ�֧��ӧ� ��ܧ٧ѧާ֧ߧ��
