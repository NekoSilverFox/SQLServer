-- JOIN 表连接

-- 查询所有学生的姓名、年龄及所在班级
USE CZSchool
SELECT Student.StudentName, Student.BornDate, GRADE.classname
	FROM Student, grade
	WHERE Student.ClassId=grade.ClassId



-- 连接：内、左、右、交叉、全连接
-- JOIN 需要连接的表 ...ON 在哪一个字段上添加关联（如果两个表进行关联）
-- 【INNER JOIN】内连接：	建立两个表中字段值相等的记录
-- 【LEFT JOIN】 外连接：
SELECT Student.StudentName, Student.BornDate, GRADE.classname
	FROM Student
	INNER JOIN grade -- 如果没有添加 INNER 关键字，默认是内连接
	ON grade.ClassId=Student.ClassId


USE CZSchool
SELECT * FROM PHONE