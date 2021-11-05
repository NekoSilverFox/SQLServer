-- 032 - 局部变量
-- 语法：
-- declare @变量名 变量的类型【=默认值】
declare @name nvarchar(50)='sdafasasdf'

print @name + '123'
select @name
select @name, 1, 'asdas'
go



-- 【赋值】set 和 select
declare @name nvarchar(50)
set @name='123'
select @name='456'
-- set 与 select 的区别
--		- 如果后面是完整的子查询，那么两者没有完整的区别
--		- select 可以把子查询中的 select 省略
--		- set 一次只能为一个变量赋值，而 select 能为多个
--		- 如果省略子查询的select使用select可以得到最后一个结果集的，因为原理是查一次赋值一次
--		- 如果保留子查询的select和括号，去查询一个不存在的记录，得到的是一个空字符串，而不是 NULL！
		--		如果=号右边的查询没有返回任何值，那么selcet会保留原始拥有的默认值（如果不使用子查询的select，结果为默认值！！)

-- 查询比刘健大的学院信息
use CZSchool
declare @time datetime
select @time=(select BornDate from Student where StudentName='刘健')
set @time=(select BornDate from Student where StudentName='刘健')
select * from Student where @time>BornDate




-- set 一次只能为一个变量赋值，而 select 能为多个
go 
declare @name nvarchar(10), @age int=20
--set @name='aa', @age=20		-- ERROR set 一次只能为一个变量赋值
select @name='aa', @age=20


-- 如果省略子查询的select使用select可以得到最后一个结果集的，因为原理是查一次赋值一次
go
declare @name nvarchar(10), @age int=20
--set @name=(select StudentName from Student)		子查询返回的值不止一个。当子查询跟随在 =、!=、<、<=、>、>= 之后，或子查询用作表达式时，这种情况是不允许的。
--select @name=(select StudentName from Student)		子查询返回的值不止一个。当子查询跟随在 =、!=、<、<=、>、>= 之后，或子查询用作表达式时，这种情况是不允许的。
select @name=StudentName from Student		-- 省略 select 和括号，得到最后一个
print @name


--		- 如果保留子查询的select和括号，去查询一个不存在的记录，得到的是一个空字符串，而不是 NULL！
		--		如果=号右边的查询没有返回任何值，那么selcet会保留原始拥有的默认值（如果不使用子查询的select，结果为默认值！！)
GO
declare @name nvarchar(10)='aaaaaaa'
set @name=(select StudentName from Student where StudentNo=100)
print @name		-- 空字符串

GO
declare @name nvarchar(10)='aaaaaaa'
select @name=(select StudentName from Student where StudentNo=100)
print @name		-- 空字符串

GO
declare @name nvarchar(10)='aaaaaaa'
select @name=StudentName from Student where StudentNo=100
print @name		-- 默认值 aaaaaaa





go
-- 查询最近一次 office 考试成绩的最高分和最低分
declare @subjectName nvarchar(50)='office'		-- 科目名称
declare @subjectID int							-- 科目ID
declare @examTime datetime						-- 最近一次考试时间
set @subjectID=(select SubjectId from Subject where SubjectName=@subjectName)	-- 获取科目ID
select @examTime=max(ExamDate) from Result where SubjectId=@subjectID			-- 获取最近一次考试日期
select MAX(StudentResult), MIN(StudentResult) from Result where SubjectId=@subjectID and ExamDate=@examTime





