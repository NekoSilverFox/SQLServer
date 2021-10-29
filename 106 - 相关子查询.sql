-- 相关子查询：子查询中引用了父查询的结果
USE CZSchool
	SELECT * FROM Student WHERE StudentNo=
	( --												↓ 是 Result 的
		SELECT DISTINCT StudentNo FROM Result WHERE StudentNo=Student.StudentNo
	)

-- 子查询的使用：
-- 1. 作为条件：当查询需要一个外部的值作为条件的时候，可以使用一个独立的查询先得到这个值，再进行条件的判断
-- 注意：
--		- 【=】使用子查询作为子条件的时候只能返回一个字段的值！！
SELECT * FROM Student WHERE BornDate < (SELECT * FROM Student WHERE StudentName='冯晨旭')	-- ERROR：当没有用 EXISTS 引入子查询时，在选择列表中只能指定一个表达式

--		- 【IN】使用子查询返回的值不止一个时。子查询返回的值不止一个。当子查询跟随在 =、!=、<、<=、>、>= 之后，或子查询用作表达式时，这种情况是不允许的。
SELECT * FROM Student WHERE BornDate IN (SELECT BornDate FROM Student)

--		  【EXISTS】如果返回多列值，只能使用 EXISTS
IF EXISTS(SELECT * FROM SYSDATABASES)
	PRINT 'T'

-- 2. 作为结果集：但一定要为子查询获取的结果集添加别名！！
-- 查询七期班的男生信息
SELECT * FROM Student WHERE ClassId=6 AND Sex='男'
SELECT * FROM Student WHERE ClassId=6 
SELECT * FROM (SELECT * FROM Student WHERE ClassId=6) temp WHERE temp.Sex='男'

-- 3. 作为列的值
SELECT (SELECT StudentName FROM Student WHERE StudentNo=Result.StudentNo), StudentResult FROM Result

-- 使用子查询分页
SELECT TOP 5 * FROM Student
-- 第二页
SELECT TOP 5 * FROM Student WHERE StudentNo NOT IN (SELECT TOP 5 StudentNo FROM Student)

-- 使用专门的分页函数
SELECT ROW_NUMBER() OVER(ORDER BY StudentNo), * FROM Student
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY StudentNo) SNO, * FROM Student) temp WHERE SNO > 0 AND  SNO < 5	-- 第一页
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY StudentNo) SNO, * FROM Student) temp WHERE SNO > 6 AND  SNO < 10	-- 第二页