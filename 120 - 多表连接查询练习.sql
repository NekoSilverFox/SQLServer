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
SELECT Distinct Disciplines.[Name], Uplans.Semestr
	FROM Disciplines
	INNER JOIN Uplans
		ON Uplans.NumDisc=Disciplines.NumDisc
	WHERE Uplans.Semestr=1 OR Uplans.Semestr=2



--	3.8. ����ڧէ�ާѧۧ�� �٧ѧ����, �ܧ������ �ڧ���ݧ�٧�֧� ���֧�ѧ�ڧ� ���֧էڧߧ֧ߧڧ� ��� �ߧ֧�ѧӧ֧ߧ��ӧ�
-- ���2014.1.10��֮���Ե�ѧ��
-- �����է֧ߧ��, ��էѧ��ڧ� ��ܧ٧ѧާ֧ߧ� ����ݧ� 10.1.2014
SELECT Students.NumSt, Students.FIO, Students.NumGr, Balls.DateEx
	FROM Balls
		INNER JOIN Students
			ON Balls.NumSt=Students.NumSt
		WHERE Balls.DateEx > '2014.1.10'


--	3.9. ����ڧէ�ާѧۧ�� �٧ѧ����, �ܧ������ �ڧ���ݧ�٧�֧� ���֧�ѧ�ڧ� �ӧߧ֧�ߧ֧ԧ� ���֧էڧߧ֧ߧڧ� ����ѧӧ�, ���֧էӧѧ�ڧ�֧ݧ�ߧ� ���էԧ���ӧڧ� ��֧���ӧ�� �էѧߧߧ��.
-- �ĸ�רҵ��ѧ���μӵĿ��Դ������
-- ���ѧܧڧ� �էڧ��ڧ�ݧڧߧ� ��էѧ�� �ҧ�ݧ��� �ӧ�֧ԧ� ��ܧ٧ѧާ֧ߧ��
SELECT TOP 1 Uplans.NumDir
	FROM Uplans
	RIGHT JOIN Balls
		ON Balls.IdDisc=Uplans.IdDisc
	GROUP BY Uplans.NumDir
	ORDER BY Uplans.NumDir

--	3.10. ����ڧէ�ާѧۧ�� �٧ѧ���� �� �ԧ����ڧ��ӧܧ�� �� ���֧էڧߧ֧ߧڧ֧� �ߧ֧�ܧ�ݧ�ܧڧ� ��ѧҧݧڧ�.
-- ÿ���༶�ж����˲μ���������
-- ���ܧ�ݧ�ܧ� ����է֧ߧ��� ��էѧӧѧݧ� ��ܧ٧ѧާ֧� ��� ��ڧ٧ڧܧ� �� �ܧѧاէ�� �ԧ�����
SELECT Students.NumGr, COUNT(*) AS '����ݧڧ�֧��ӧ� ����է֧ߧ���'
	FROM Balls
		INNER JOIN Students
			ON Balls.NumSt=Students.NumSt
		INNER JOIN Uplans
			ON Balls.IdDisc=Uplans.IdDisc
	WHERE Uplans.NumDisc=1
	GROUP BY Students.NumGr
	ORDER BY Students.NumGr



--4. ������ѧӧ��� �٧ѧ����� �� �ڧ���ݧ�٧�ӧѧߧڧ֧� ���է٧ѧ������, �� ���� ��ڧ�ݧ� �� ���֧էڧܧѧ�ѧާ� EXISTS ��  NOT EXISTS
--	4.1. ����ҧ֧�ڧ�� ����է֧ߧ���, �ܧ������ ��էѧݧ� ���ݧ�ܧ� ��էߧ� �էڧ��ڧ�ݧڧߧ�
SELECT * 
	FROM Students AS tb_Stu
	WHERE EXISTS
		(
		SELECT * 
			FROM Balls 
			WHERE tb_Stu.NumSt=Balls.NumSt
			GROUP BY NumSt
			HAVING COUNT(NumSt)=1
		)

--	4.2. ����ҧ�ѧ�� ����է֧ߧ���, �ܧ������ �ߧ� ��էѧݧ� �ߧ� ��էߧ�ԧ� ��ܧ٧ѧާ֧ߧ�
SELECT * 
	FROM Students AS tb_Stu
	WHERE NOT EXISTS
		(SELECT * 
			FROM Balls 
			WHERE tb_Stu.NumSt=Balls.NumSt)

--	4.3. ����ҧ֧�ڧ�� �ԧ�����, �� �ܧ������ ���֧�� ����է֧ߧ��, ��էѧӧ�ڧ� ���ӧ�֡� ��ܧ٧ѧާ֧ߧ� 1 ��֧ާ֧����
-- �����һѧ����Ҫ���ԵĿ�ĿID�����ǵ�רҵ��
-- SELECT *
SELECT Uplans.IdDisc, Uplans.NumDir, Uplans.NumDisc
	FROM Uplans
	WHERE Uplans.Semestr=1

-- �� ���ÿ��רҵ��һѧ����Ҫ���ٸ����� 
SELECT Uplans.NumDir, COUNT(Uplans.NumDir) AS numExamInFirstSem
	FROM Uplans
	WHERE Uplans.Semestr=1
	GROUP BY Uplans.NumDir


-- �� Balls ��ȡ���μ��˵�һѧ�ڿ��Ե�ѧ��INFO
SELECT DISTINCT Students.NumSt, Students.FIO, Groups.NumDir,Balls.IdDisc
	FROM Balls, Groups, Students,
	(
		SELECT Uplans.IdDisc, Uplans.NumDir, Uplans.NumDisc
		FROM Uplans
		WHERE Uplans.Semestr=1
	) AS exam1Sem
	WHERE Balls.NumSt=Students.NumSt
		AND Balls.IdDisc=exam1Sem.IdDisc
		AND exam1Sem.NumDir=Groups.NumDir

-- �� �������ѧ�������ÿ�����˼�����
SELECT P1.NumSt, P1.NumDir, COUNT(P1.NumSt) AS numPassExamInFirstSem
	FROM 
	(
		SELECT DISTINCT Students.NumSt, Students.FIO, Groups.NumDir,Balls.IdDisc
		FROM Balls, Groups, Students,
		(
			SELECT Uplans.IdDisc, Uplans.NumDir, Uplans.NumDisc
			FROM Uplans
			WHERE Uplans.Semestr=1
		) AS exam1Sem
		WHERE Balls.NumSt=Students.NumSt
			AND Balls.IdDisc=exam1Sem.IdDisc
			AND exam1Sem.NumDir=Groups.NumDir
	) AS P1
	GROUP BY P1.NumSt, P1.NumDir
		
-- �õ�����Ҫ��İ༶
SELECT Distinct P3.NumGr --, P3.NumSt
	FROM
	(
		SELECT Uplans.NumDir, COUNT(Uplans.NumDir) AS numExamInFirstSem
			FROM Uplans
			WHERE Uplans.Semestr=1
			GROUP BY Uplans.NumDir
	) AS P2,
	(
		SELECT P1.NumSt, P1.NumDir, P1.NumGr, COUNT(P1.NumSt) AS numPassExamInFirstSem
		FROM 
		(
			SELECT DISTINCT Students.NumSt, Students.FIO, Groups.NumGr, Groups.NumDir,Balls.IdDisc
			FROM Balls, Groups, Students,
			(
				SELECT Uplans.IdDisc, Uplans.NumDir, Uplans.NumDisc
				FROM Uplans
				WHERE Uplans.Semestr=1
			) AS exam1Sem
			WHERE Balls.NumSt=Students.NumSt
				AND Balls.IdDisc=exam1Sem.IdDisc
				AND exam1Sem.NumDir=Groups.NumDir
		) AS P1
		GROUP BY P1.NumSt, P1.NumDir, P1.NumGr
	) AS P3
	WHERE P2.numExamInFirstSem=P3.numPassExamInFirstSem AND P2.NumDir=P3.NumDir

-- �ø�����ĿҪ��ķ�ʽ���
SELECT *
	FROM Groups
	WHERE EXISTS
	(
		SELECT Distinct P3.NumGr --, P3.NumSt
			FROM
			(
				SELECT Uplans.NumDir, COUNT(Uplans.NumDir) AS numExamInFirstSem
					FROM Uplans
					WHERE Uplans.Semestr=1
					GROUP BY Uplans.NumDir
			) AS P2,
			(
				SELECT P1.NumSt, P1.NumDir, P1.NumGr, COUNT(P1.NumSt) AS numPassExamInFirstSem
				FROM 
				(
					SELECT DISTINCT Students.NumSt, Students.FIO, Groups.NumGr, Groups.NumDir,Balls.IdDisc
					FROM Balls, Groups, Students,
					(
						SELECT Uplans.IdDisc, Uplans.NumDir, Uplans.NumDisc
						FROM Uplans
						WHERE Uplans.Semestr=1
					) AS exam1Sem
					WHERE Balls.NumSt=Students.NumSt
						AND Balls.IdDisc=exam1Sem.IdDisc
						AND exam1Sem.NumDir=Groups.NumDir
				) AS P1
				GROUP BY P1.NumSt, P1.NumDir, P1.NumGr
			) AS P3
			WHERE P2.numExamInFirstSem=P3.numPassExamInFirstSem AND P2.NumDir=P3.NumDir AND (Groups.NumGr=P3.NumGr)
	)

--	4.4. ����ҧ֧�ڧ�� �ԧ�����, �� �ܧ������ �֧��� ����է֧ߧ��, �ܧ������ ���ߧ֡� ��էѧݧ� ���ߧ� ��էߧ�ۡ� �էڧ��ڧ�ݧڧߧ�
SELECT Distinct NumGr FROM Students
	WHERE NOT EXISTS (SELECT NumSt FROM Balls WHERE Balls.NumSt=Students.NumSt)

--	4.5. ����ҧ�ѧ�� �էڧ��ڧ�ݧڧߧ�, �ܧ������ �ߧ� ����ѧݧ� �� ���֧ҧߧ�� ��ݧѧ� �ߧѧ��ѧӧݧ֧ߧڧ� 231000 ѡ������231000��ѧ��ٵ�ѧ��
SELECT [NAME] FROM Disciplines
	WHERE NOT EXISTS (SELECT NumDisc FROM Uplans WHERE Disciplines.NumDisc=Uplans.NumDisc AND Uplans.NumDir='231000')


--	4.6. ����ҧ�ѧ�� �էڧ��ڧ�ݧڧߧ�, �ܧ������ �ߧ� ��էѧݧ� �ӧ�� ����է֧ߧ�� �ߧѧ��ѧӧݧ֧ߧڧ� 231000 ѡ������231000��ѧ��û��ͨ���Ŀ�Ŀ
SELECT * 
	FROM Uplans
	INNER JOIN Balls
		ON Uplans.IdDisc=Balls.IdDisc
	INNER JOIN Students
		ON Students.NumSt=Balls.NumSt
	INNER JOIN Groups
		ON Groups.NumGr=Students.NumGr
	RIGHT JOIN Disciplines
		ON Disciplines.NumDisc=Uplans.NumDisc
	WHERE Groups.NumDir='231000'

SELECT DISTINCT Disciplines.[Name]
	FROM Uplans
	INNER JOIN Balls
		ON Uplans.IdDisc=Balls.IdDisc
	INNER JOIN Students
		ON Students.NumSt=Balls.NumSt
	INNER JOIN Groups
		ON Groups.NumGr=Students.NumGr
	RIGHT JOIN Disciplines
		ON Disciplines.NumDisc=Uplans.NumDisc
	WHERE Groups.NumDir='231000'


SELECT * FROM Disciplines
	WHERE NOT EXISTS
	(
		SELECT *
			FROM 
			(
				SELECT DISTINCT Disciplines.[Name]
					FROM Uplans
					INNER JOIN Balls
						ON Uplans.IdDisc=Balls.IdDisc
					INNER JOIN Students
						ON Students.NumSt=Balls.NumSt
					INNER JOIN Groups
						ON Groups.NumGr=Students.NumGr
					RIGHT JOIN Disciplines
						ON Disciplines.NumDisc=Uplans.NumDisc
					WHERE Groups.NumDir='231000'
			) temp
		WHERE temp.[Name]=Disciplines.[Name]
	)


--	4.7. ����ҧ�ѧ�� �ԧ�����, �� �ܧ������ �ӧ�� ����է֧ߧ�� ��էѧݧ� ��ڧ٧ڧܧ�
-- ���ҵ���������������ˣ�Ҳ�����ǵİ༶��������
SELECT * 
	FROM Balls
	INNER JOIN Uplans
		ON Balls.IdDisc=Uplans.IdDisc
	INNER JOIN Disciplines
		ON Uplans.NumDisc=Disciplines.NumDisc
	WHERE Disciplines.[Name]='���ڧ٧ڧܧ�'




SELECT Students.NumGr 
	FROM Students
	INNER JOIN Groups
		ON Groups.NumGr=Students.NumGr
	WHERE EXISTS
	(
		SELECT *
			FROM 
			(
				SELECT NumSt 
					FROM Balls
					INNER JOIN Uplans
						ON Balls.IdDisc=Uplans.IdDisc
					INNER JOIN Disciplines
						ON Uplans.NumDisc=Disciplines.NumDisc
					WHERE Disciplines.[Name]='���ڧ٧ڧܧ�'
			) temp
			WHERE temp.NumSt=Students.NumSt
	)
	GROUP BY Students.NumGr, Groups.Quantity
	HAVING COUNT(Students.NumGr)=Groups.Quantity

--	4.8. ����ҧ�ѧ�� �ԧ�����, �� �ܧ������ �ӧ�� ����է֧ߧ�� ��էѧݧ� �ӧ�� �էڧ��ڧ�ݧڧߧ� 1 ��֧ާ֧���� ѡ������ѧ���ڵ�һѧ��ͨ�����п�Ŀ��С��
-- �ҵ�һѧ�ڵĿ�Ŀ
SELECT * FROM Uplans WHERE Semestr='1' ORDER BY NumDir

-- �� �ҵ�һѧ�ڵĿ�ĿNumDir�������ǵĿ�������
SELECT NumDir, COUNT(NumDir) AS dirBallTimes FROM Uplans WHERE Semestr='1' GROUP BY NumDir

-- ͨ����һѧ�ڿ�Ŀ��ѧ��
SELECT * 
	FROM Balls,
		(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
	WHERE firstSem.IdDisc=Balls.IdDisc
	ORDER BY Balls.NumSt
	
--  ͨ����һѧ�ڿ�Ŀ��ѧ����ID���������ǽ��˶��ٴο��� 
SELECT Balls.NumSt, firstSem.NumDir, COUNT(Balls.NumSt) AS stuBallTimes
	FROM Balls,
		(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
	WHERE firstSem.IdDisc=Balls.IdDisc
	GROUP BY Balls.NumSt, firstSem.NumDir
	ORDER BY Balls.NumSt


-- ��� �����Ӹ��༶��
SELECT Balls.NumSt, Students.NumGr, firstSem.NumDir, COUNT(Balls.NumSt) AS stuBallTimes
	FROM Balls,
		Students,
		(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
	WHERE firstSem.IdDisc=Balls.IdDisc AND Balls.NumSt=Students.NumSt
	GROUP BY Balls.NumSt,Students.NumGr ,firstSem.NumDir
	--ORDER BY Balls.NumSt



-- ���� ������ʵİ༶
SELECT NumSt, NumGr, P2.NumDir
	FROM 
	(
		SELECT NumDir, COUNT(NumDir) AS dirBallTimes FROM Uplans WHERE Semestr='1' GROUP BY NumDir
	) AS P1,
	(
		SELECT Balls.NumSt, Students.NumGr, firstSem.NumDir, COUNT(Balls.NumSt) AS stuBallTimes
			FROM Balls,
				Students,
				(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
			WHERE firstSem.IdDisc=Balls.IdDisc AND Balls.NumSt=Students.NumSt
			GROUP BY Balls.NumSt,Students.NumGr ,firstSem.NumDir
	) AS P2
	WHERE P1.dirBallTimes=P2.stuBallTimes AND P1.NumDir=P2.NumDir


-- ����� ͳ��ÿ���������
SELECT NumGr, COUNT(NumGr) AS ballStuNumInEveryClass
	FROM 
	(
		SELECT NumDir, COUNT(NumDir) AS dirBallTimes FROM Uplans WHERE Semestr='1' GROUP BY NumDir
	) AS P1,
	(
		SELECT Balls.NumSt, Students.NumGr, firstSem.NumDir, COUNT(Balls.NumSt) AS stuBallTimes
			FROM Balls,
				Students,
				(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
			WHERE firstSem.IdDisc=Balls.IdDisc AND Balls.NumSt=Students.NumSt
			GROUP BY Balls.NumSt,Students.NumGr ,firstSem.NumDir
	) AS P2
	WHERE P1.dirBallTimes=P2.stuBallTimes AND P1.NumDir=P2.NumDir
	GROUP BY NumGr

-- ������ ���ÿ���༶������
SELECT Students.NumGr, COUNT(Students.NumGr) AS stuNumInEveryClass
	FROM Students
	GROUP BY Students.NumGr
	

-- �������յİ༶
SELECT DISTINCT P4.NumGr
	FROM
	(
		SELECT NumGr, COUNT(NumGr) AS ballStuNumInEveryClass
			FROM 
			(
				SELECT NumDir, COUNT(NumDir) AS dirBallTimes FROM Uplans WHERE Semestr='1' GROUP BY NumDir
			) AS P1,
			(
				SELECT Balls.NumSt, Students.NumGr, firstSem.NumDir, COUNT(Balls.NumSt) AS stuBallTimes
					FROM Balls,
						Students,
						(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
					WHERE firstSem.IdDisc=Balls.IdDisc AND Balls.NumSt=Students.NumSt
					GROUP BY Balls.NumSt,Students.NumGr ,firstSem.NumDir
			) AS P2
			WHERE P1.dirBallTimes=P2.stuBallTimes AND P1.NumDir=P2.NumDir
			GROUP BY NumGr
	) AS P4,
	(
		SELECT Students.NumGr, COUNT(Students.NumGr) AS stuNumInEveryClass
			FROM Students
			GROUP BY Students.NumGr
	) AS P5
	WHERE P4.ballStuNumInEveryClass=P5.stuNumInEveryClass

-- ʹ�� EXISTS �Ż�
SELECT * FROM Groups
	WHERE EXISTS
	(
	SELECT DISTINCT P4.NumGr
		FROM
		(
			SELECT NumGr, COUNT(NumGr) AS ballStuNumInEveryClass
				FROM 
				(
					SELECT NumDir, COUNT(NumDir) AS dirBallTimes FROM Uplans WHERE Semestr='1' GROUP BY NumDir
				) AS P1,
				(
					SELECT Balls.NumSt, Students.NumGr, firstSem.NumDir, COUNT(Balls.NumSt) AS stuBallTimes
						FROM Balls,
							Students,
							(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
						WHERE firstSem.IdDisc=Balls.IdDisc AND Balls.NumSt=Students.NumSt
						GROUP BY Balls.NumSt,Students.NumGr ,firstSem.NumDir
				) AS P2
				WHERE P1.dirBallTimes=P2.stuBallTimes AND P1.NumDir=P2.NumDir
				GROUP BY NumGr
		) AS P4,
		(
			SELECT Students.NumGr, COUNT(Students.NumGr) AS stuNumInEveryClass
				FROM Students
				GROUP BY Students.NumGr
		) AS P5
		WHERE P4.ballStuNumInEveryClass=P5.stuNumInEveryClass AND Groups.NumGr=P4.NumGr
	)


--	4.9. ����ҧ�ѧ�� ����է֧ߧ���, �ܧ������ ��էѧݧ� ���ӧ�֡� ��ܧ٧ѧާ֧ߧ� �ߧ� ������� �� ���ݧڧ�ߧ�.
-- �ҵ� 4 �ֺ� 5 �ֵ�ѧ�����������ǵ����ֺͷ����������
SELECT DISTINCT Students.NumSt, Students.FIO, Balls.IdDisc, Groups.NumGr, Groups.NumDir
	FROM Balls
		INNER JOIN Students
			ON Balls.NumSt=Students.NumSt
		INNER JOIN Groups
			ON Groups.NumGr=Students.NumGr
	WHERE Balls.Ball=4 OR Balls.Ball=5

-- �� ���������ѧ�����飬��ͳ�����ǽ��˵Ŀ�������
SELECT DISTINCT Students.NumSt, COUNT(Students.NumSt) AS numPassExamWith4or5, Groups.NumDir
	FROM Balls
		INNER JOIN Students
			ON Balls.NumSt=Students.NumSt
		INNER JOIN Groups
			ON Groups.NumGr=Students.NumGr
	WHERE Balls.Ball=4 OR Balls.Ball=5
	GROUP BY Students.NumSt, Groups.NumDir

-- ��� ͳ��ÿ��רҵ��Ҫ�����ٿ���
SELECT Uplans.NumDir, COUNT(Uplans.NumDir) numExamInEveryDir
	FROM Uplans
	GROUP BY Uplans.NumDir

-- �ҵ�ȫ���˵ģ�ѧ�� ID
-- SELECT *
SELECT P1.NumSt
	FROM
	(
		SELECT DISTINCT Students.NumSt, COUNT(Students.NumSt) AS numPassExamWith4or5, Groups.NumDir
			FROM Balls
				INNER JOIN Students
					ON Balls.NumSt=Students.NumSt
				INNER JOIN Groups
					ON Groups.NumGr=Students.NumGr
			WHERE Balls.Ball=4 OR Balls.Ball=5
			GROUP BY Students.NumSt, Groups.NumDir
	)  AS P1,
	(
		SELECT Uplans.NumDir, COUNT(Uplans.NumDir) numExamInEveryDir
		FROM Uplans
		GROUP BY Uplans.NumDir
	) AS P2
	WHERE P2.numExamInEveryDir=P1.numPassExamWith4or5

-- ���� ���ѧ����Ϣ
SELECT *
	FROM Students
	WHERE EXISTS
	(
		SELECT P1.NumSt
		FROM
		(
			SELECT DISTINCT Students.NumSt, COUNT(Students.NumSt) AS numPassExamWith4or5, Groups.NumDir
				FROM Balls
					INNER JOIN Students
						ON Balls.NumSt=Students.NumSt
					INNER JOIN Groups
						ON Groups.NumGr=Students.NumGr
				WHERE Balls.Ball=4 OR Balls.Ball=5
				GROUP BY Students.NumSt, Groups.NumDir
		)  AS P1,
		(
			SELECT Uplans.NumDir, COUNT(Uplans.NumDir) numExamInEveryDir
			FROM Uplans
			GROUP BY Uplans.NumDir
		) AS P2
		WHERE P2.numExamInEveryDir=P1.numPassExamWith4or5 AND Students.NumSt=P1.NumSt
	)

--	4.10. ����ҧ�ѧ�� ����է֧ߧ���, �ܧ������ ��էѧݧ� �ߧѧڧҧ�ݧ��֧� �ܧ�ݧڧ�֧��ӧ� ��ܧ٧ѧާ֧ߧ��
-- ��ͳ��ÿ��ѧ�����˶��ٴο���
SELECT NumSt, COUNT(NumSt) AS numExam
	FROM Balls
	GROUP BY NumSt

-- ���������࿼�ԵĴ���
SELECT MAX(P1.numExam) AS maxExamTimes
	FROM 
	(
		SELECT NumSt, COUNT(NumSt) AS numExam
			FROM Balls
			GROUP BY NumSt
	) AS P1


-- ���������࿼�Ե���λ���ɵ�ID
--SELECT *
SELECT P1.NumSt
	FROM
	(
		SELECT NumSt, COUNT(NumSt) AS numExam
		FROM Balls
		GROUP BY NumSt
	) AS P1,
	(
		SELECT MAX(P1.numExam) AS maxExamTimes
		FROM 
		(
			SELECT NumSt, COUNT(NumSt) AS numExam
				FROM Balls
				GROUP BY NumSt
		) AS P1
	) AS P2
	WHERE P1.numExam=P2.maxExamTimes
	
-- �������
SELECT *
	FROM Students
	WHERE EXISTS
	(
		SELECT P1.NumSt
		FROM
		(
			SELECT NumSt, COUNT(NumSt) AS numExam
			FROM Balls
			GROUP BY NumSt
		) AS P1,
		(
			SELECT MAX(P1.numExam) AS maxExamTimes
			FROM 
			(
				SELECT NumSt, COUNT(NumSt) AS numExam
					FROM Balls
					GROUP BY NumSt
			) AS P1
		) AS P2
		WHERE P1.numExam=P2.maxExamTimes AND (Students.NumSt=P1.NumSt)
	)