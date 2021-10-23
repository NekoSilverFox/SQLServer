-- 相关子查询：子查询中引用了父查询的结果
USE CZSchool
	SELECT * FROM Student WHERE StudentNo=
	(
		SELECT DISTINCT StudentNo FROM Result WHERE StudentNo=Student.StudentNo
	)