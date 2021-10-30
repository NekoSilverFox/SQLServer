USE LAB4
--Использование различных видов операции соединения 【JOIN】: 
---	выбрать все названия дисциплин, по которым студентами были получены оценки
SELECT Distinct Name
	FROM Disciplines
	INNER JOIN Uplans
		ON Disciplines.NumDisc=Uplans.NumDisc
	INNER JOIN Balls
		ON Uplans.IdDisc=Balls.IdDisc

---	выбрать всех студентов с 【указанием】 оценок, если они есть
SELECT FIO, Ball
	FROM Students
	LEFT JOIN Balls
		ON Students.NumSt=Balls.NumSt

--Использование операций 【вычитания】, 【пересечения】 и 【объединения】
---	выбрать номера студентов, у которых ==нет== оценок
SELECT NumSt FROM Students
EXCEPT
Select NumSt FROM Balls

---	выбрать номера студентов, которые сдали хотя бы один экзамен
--SELECT NumSt FROM Students
--INTERSECT
--Select NumSt FROM Balls

---	выбрать студентов, которые получили ==пятерки== и которые вообще ничего не сдали
--(SELECT NumSt FROM Balls WHERE Ball=5)
--UNION
--(SELECT NumSt FROM Students EXCEPT Select NumSt FROM Balls)

--Использование подзапросов: 子查询
---	вывести студентов, которые сдали ==все== экзамены ==первого== семестра
SELECT NumSt, NumDir, COUNT(Ball) 
	FROM Balls
	JOIN Uplans
		ON Balls.IdDisc=Uplans.IdDisc
	WHERE Semestr=1
	GROUP BY NumSt, NumDir 
	HAVING Count(Ball)=(SELECT COUNT(*) FROM Uplans u WHERE Uplans.NumDir=u.NumDir and semestr=1)

---	второй вариант того же запроса с использованием NOT EXISTS
--SELECT NumSt
--FROM Students
--	JOIN Groups ON Groups.NumGr=Students.NumGr 
--	WHERE NOT EXISTS
--	(	SELECT * FROM Uplans  WHERE Semestr=1
--		AND Students.NumDir=Uplans.NumDir
--		AND NOT EXISTS
--		(SELECT * FROM Balls WHERE Balls.IdDisc=Uplans.IdDisc and Students.NumSt=Balls.NumSt)
--	)


--------------------------------- План работы ---------------------------------
--	3.1. Выберите направления, в которых есть студенты, которые сдали экзамены 
USE LAB4
SELECT Distinct Directions.Title
	FROM Directions
	INNER JOIN Uplans
		ON Directions.NumDir=Uplans.NumDir
	INNER JOIN Balls
		ON Uplans.IdDisc=Balls.IdDisc

--	3.2. Выберите 【наименования дисциплин】 первого семестра 选择第一学期的【学科名称】
SELECT Distinct Directions.NumDir, Directions.Title
	FROM Directions
	INNER JOIN Uplans
		ON Directions.NumDir=Uplans.NumDir
	WHERE Semestr=1


--	3.3. Выберите номера групп, в которых есть студенты, сдавшие хотя бы один экзамен
SELECT Distinct Students.NumGr
	FROM Students
	LEFT JOIN Balls
		ON Balls.NumSt=Students.NumSt


--	3.4. Выведите наименование дисциплин с указанием идентификатора студента, если он сдал экзамен 如果学生通过考试，则输出课程名称和学生编号
SELECT Students.NumSt, Students.FIO, Disciplines.Name
	FROM Students
	RIGHT JOIN Balls
		ON Balls.NumSt=Students.NumSt
	INNER JOIN Uplans
		ON Balls.IdDisc=Uplans.IdDisc
	INNER JOIN Disciplines
		ON Uplans.NumDisc=Disciplines.NumDisc
	WHERE Balls.Ball>=3


--	3.5. Выберите номера групп, в которых есть свободные места.
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
	ORDER BY Groups.NumGr		-- 这句可以没有，排序而已

--	3.6. Выберите номера групп, в которых есть студенты, сдавшие больше одного экзамена,
-- добавив к ним номера групп, в которых есть студенты, которые ничего не сдали. 
-- 输出了应该到的每个学生，而不是只是班级数
SELECT Students.NumGr, Students.NumSt, COUNT(*) AS 'Количество экз', 'это студент, сдавшие больше одного экзамена' AS 'Info'
	FROM Students
	RIGHT JOIN Balls
		ON Students.NumSt=Balls.NumSt
	GROUP BY Students.NumGr, Students.NumSt
	HAVING COUNT(*)>1
UNION
SELECT Students.NumGr, Students.NumSt, 0 AS 'Количество экз', 'это студент ничего не сдали' AS 'Info'
	FROM Students
	FULL JOIN Balls
		ON Students.NumSt=Balls.NumSt
	WHERE Ball IS NULL
	GROUP BY Students.NumGr, Students.NumSt
	ORDER BY 'Info'



SELECT Students.NumGr, 'есть студенты, сдавшие больше одного экзамена' AS 'номера групп, в которых'
	FROM Students
	RIGHT JOIN Balls
		ON Students.NumSt=Balls.NumSt
	GROUP BY Students.NumGr, Students.NumSt
	HAVING COUNT(*)>1
UNION
SELECT Students.NumGr, 'есть студенты, которые ничего не сдали' AS 'номера групп, в которых'
	FROM Students
	FULL JOIN Balls
		ON Students.NumSt=Balls.NumSt
	WHERE Ball IS NULL
	GROUP BY Students.NumGr, Students.NumSt
	ORDER BY 'номера групп, в которых'


--	3.7. Выберите дисциплины, которые есть и в первом и во втором семестре
SELECT Distinct Disciplines.[Name], Uplans.Semestr
	FROM Disciplines
	INNER JOIN Uplans
		ON Uplans.NumDisc=Disciplines.NumDisc
	WHERE Uplans.Semestr=1 OR Uplans.Semestr=2



--	3.8. Придумайте запрос, который использует операцию соединения по неравенству
-- 输出2014.1.10后之后考试的学生
-- Студенты, сдающие экзамены после 10.1.2014
SELECT Students.NumSt, Students.FIO, Students.NumGr, Balls.DateEx
	FROM Balls
		INNER JOIN Students
			ON Balls.NumSt=Students.NumSt
		WHERE Balls.DateEx > '2014.1.10'


--	3.9. Придумайте запрос, который использует операцию внешнего соединения справа, предварительно подготовив тестовые данные.
-- 哪个专业的学生参加的考试次数最多
-- Какие дисциплины сдают больше всего экзаменов
SELECT TOP 1 Uplans.NumDir
	FROM Uplans
	RIGHT JOIN Balls
		ON Balls.IdDisc=Uplans.IdDisc
	GROUP BY Uplans.NumDir
	ORDER BY Uplans.NumDir

--	3.10. Придумайте запрос с группировкой и соединением нескольких таблиц.
-- 每个班级有多少人参加了物理考试
-- Сколько студентов сдавали экзамен по физике в каждом группе
SELECT Students.NumGr, COUNT(*) AS 'Количество студентов'
	FROM Balls
		INNER JOIN Students
			ON Balls.NumSt=Students.NumSt
		INNER JOIN Uplans
			ON Balls.IdDisc=Uplans.IdDisc
	WHERE Uplans.NumDisc=1
	GROUP BY Students.NumGr
	ORDER BY Students.NumGr



--4. Составьте запросы с использованием подзапросов, в том числе с предикатами EXISTS и  NOT EXISTS
--	4.1. Выберите студентов, которые сдали только одну дисциплину
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

--	4.2. Выбрать студентов, которые не сдали ни одного экзамена
SELECT * 
	FROM Students AS tb_Stu
	WHERE NOT EXISTS
		(SELECT * 
			FROM Balls 
			WHERE tb_Stu.NumSt=Balls.NumSt)

--	4.3. Выберите группы, в которых 【есть】 студенты, сдавшие 【все】 экзамены 1 семестра
-- 输出第一学期需要考试的科目ID和他们的专业号
-- SELECT *
SELECT Uplans.IdDisc, Uplans.NumDir, Uplans.NumDisc
	FROM Uplans
	WHERE Uplans.Semestr=1

-- ★ 输出每个专业第一学期需要多少个考试 
SELECT Uplans.NumDir, COUNT(Uplans.NumDir) AS numExamInFirstSem
	FROM Uplans
	WHERE Uplans.Semestr=1
	GROUP BY Uplans.NumDir


-- 从 Balls 中取出参加了第一学期考试的学生INFO
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

-- ★ 从上面的学生中输出每个考了几次试
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
		
-- 得到符合要求的班级
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

-- 用复合题目要求的方式输出
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

--	4.4. Выберите группы, в которых есть студенты, которые 【не】 сдали 【ни одной】 дисциплины
SELECT Distinct NumGr FROM Students
	WHERE NOT EXISTS (SELECT NumSt FROM Balls WHERE Balls.NumSt=Students.NumSt)

--	4.5. Выбрать дисциплины, которые не попали в учебный план направления 231000 选择不属于231000教学大纲的学科
SELECT [NAME] FROM Disciplines
	WHERE NOT EXISTS (SELECT NumDisc FROM Uplans WHERE Disciplines.NumDisc=Uplans.NumDisc AND Uplans.NumDir='231000')


--	4.6. Выбрать дисциплины, которые не сдали все студенты направления 231000 选择所有231000名学生没有通过的科目
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


--	4.7. Выбрать группы, в которых все студенты сдали физику
-- 先找到交了物理的所有人，也和他们的班级关联起来
SELECT * 
	FROM Balls
	INNER JOIN Uplans
		ON Balls.IdDisc=Uplans.IdDisc
	INNER JOIN Disciplines
		ON Uplans.NumDisc=Disciplines.NumDisc
	WHERE Disciplines.[Name]='Физика'




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
					WHERE Disciplines.[Name]='Физика'
			) temp
			WHERE temp.NumSt=Students.NumSt
	)
	GROUP BY Students.NumGr, Groups.Quantity
	HAVING COUNT(Students.NumGr)=Groups.Quantity

--	4.8. Выбрать группы, в которых все студенты сдали все дисциплины 1 семестра 选择所有学生在第一学期通过所有科目的小组
-- 找第一学期的科目
SELECT * FROM Uplans WHERE Semestr='1' ORDER BY NumDir

-- ★ 找第一学期的科目NumDir，和他们的考试数量
SELECT NumDir, COUNT(NumDir) AS dirBallTimes FROM Uplans WHERE Semestr='1' GROUP BY NumDir

-- 通过第一学期科目的学生
SELECT * 
	FROM Balls,
		(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
	WHERE firstSem.IdDisc=Balls.IdDisc
	ORDER BY Balls.NumSt
	
--  通过第一学期科目的学生的ID，并且他们交了多少次考试 
SELECT Balls.NumSt, firstSem.NumDir, COUNT(Balls.NumSt) AS stuBallTimes
	FROM Balls,
		(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
	WHERE firstSem.IdDisc=Balls.IdDisc
	GROUP BY Balls.NumSt, firstSem.NumDir
	ORDER BY Balls.NumSt


-- ★★ 给他加个班级号
SELECT Balls.NumSt, Students.NumGr, firstSem.NumDir, COUNT(Balls.NumSt) AS stuBallTimes
	FROM Balls,
		Students,
		(SELECT * FROM Uplans WHERE Semestr='1') AS firstSem
	WHERE firstSem.IdDisc=Balls.IdDisc AND Balls.NumSt=Students.NumSt
	GROUP BY Balls.NumSt,Students.NumGr ,firstSem.NumDir
	--ORDER BY Balls.NumSt



-- ★★★ 输出合适的班级
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


-- ★★★★ 统计每个班的人数
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

-- ★★★★★ 输出每个班级的人数
SELECT Students.NumGr, COUNT(Students.NumGr) AS stuNumInEveryClass
	FROM Students
	GROUP BY Students.NumGr
	

-- 查找最终的班级
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

-- 使用 EXISTS 优化
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


--	4.9. Выбрать студентов, которые сдали 【все】 экзамены на хорошо и отлично.
-- 找到 4 分和 5 分的学生，并和他们的名字和方向关联起来
SELECT DISTINCT Students.NumSt, Students.FIO, Balls.IdDisc, Groups.NumGr, Groups.NumDir
	FROM Balls
		INNER JOIN Students
			ON Balls.NumSt=Students.NumSt
		INNER JOIN Groups
			ON Groups.NumGr=Students.NumGr
	WHERE Balls.Ball=4 OR Balls.Ball=5

-- ★ 按照上面的学生分组，并统计他们交了的考试数量
SELECT DISTINCT Students.NumSt, COUNT(Students.NumSt) AS numPassExamWith4or5, Groups.NumDir
	FROM Balls
		INNER JOIN Students
			ON Balls.NumSt=Students.NumSt
		INNER JOIN Groups
			ON Groups.NumGr=Students.NumGr
	WHERE Balls.Ball=4 OR Balls.Ball=5
	GROUP BY Students.NumSt, Groups.NumDir

-- ★★ 统计每个专业需要交多少考试
SELECT Uplans.NumDir, COUNT(Uplans.NumDir) numExamInEveryDir
	FROM Uplans
	GROUP BY Uplans.NumDir

-- 找到全交了的，学生 ID
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

-- ★★★ 输出学生信息
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

--	4.10. Выбрать студентов, которые сдали наибольшее количество экзаменов
-- 先统计每个学生交了多少次考试
SELECT NumSt, COUNT(NumSt) AS numExam
	FROM Balls
	GROUP BY NumSt

-- 输出交了最多考试的次数
SELECT MAX(P1.numExam) AS maxExamTimes
	FROM 
	(
		SELECT NumSt, COUNT(NumSt) AS numExam
			FROM Balls
			GROUP BY NumSt
	) AS P1


-- 输出交了最多考试的那位神仙的ID
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
	
-- 最终输出
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