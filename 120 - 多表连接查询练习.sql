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



--	3.8. Придумайте запрос, который использует операцию соединения по неравенству
--	3.9. Придумайте запрос, который использует операцию внешнего соединения справа, предварительно подготовив тестовые данные.
--	3.10. Придумайте запрос с группировкой и соединением нескольких таблиц.
--4. Составьте запросы с использованием подзапросов, в том числе с предикатами EXISTS и  NOT EXISTS
--	4.1. Выберите студентов, которые сдали только одну дисциплину
--	4.2. Выбрать студентов, которые не сдали ни одного экзамена
--	4.3. Выберите группы, в которых есть студенты, сдавшие все экзамены 1 семестра
--	4.4. Выберите группы, в которых есть студенты, которые не сдали ни одной дисциплины
--	4.5. Выбрать дисциплины, которые не попали в учебный план направления 231000
--	4.6. Выбрать дисциплины, которые не сдали все студенты направления 231000
--	4.7. Выбрать группы, в которых все студенты сдали физику
--	4.8. Выбрать группы, в которых все студенты сдали все дисциплины 1 семестра
--	4.9. Выбрать студентов, которые сдали все экзамены на хорошо и отлично.
--	4.10. Выбрать студентов, которые сдали наибольшее количество экзаменов
