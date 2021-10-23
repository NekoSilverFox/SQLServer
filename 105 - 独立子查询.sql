-- 子查询：
--		在一个查询中包含另一个查询，被包含的查询就被称为子查询；包含子查询的查询就被称为父查询

-- 查询比冯晨旭年龄大的学员信息
USE CZSchool
SELECT BornDate FROM Student WHERE StudentName='冯晨旭'
SELECT * FROM Student WHERE BORNDATE < (SELECT BornDate FROM Student WHERE StudentName='冯晨旭')

-- 查询七期班的学员信息
SELECT * FROM STUDENT WHERE ClassId=
	(
		SELECT ClassId FROM grade WHERE classname='七期班'
	)