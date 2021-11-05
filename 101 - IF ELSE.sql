-- if else
--没有 boll 值，只有条件表达式
--没有 {}， 只有 BEGIN END
--可以多重，可以嵌套
--如果包含的语句只有一条，那么也可以不使用 BEGIN END
--IF ELSE 中 必须有处理语句，如果没有就报错
IF 1=1
	print '1'
	print '2'

IF 1=2
	print '1'
	print '2'

IF 1=1
begin
	print '1'
	print '2'
end 


-- 计算office的平均分并输出，如果平均分超过60分输出成绩最高的三个学生的成绩，否则输出后三名的学生
DECLARE @subjectName nvarchar(50)='office'		-- 科目名称
DECLARE @subjectID int=(SELECT SubjectId FROM Subject WHERE SubjectName=@subjectName)	-- 科目ID
DECLARE @avgSubMark int
SET @avgSubMark=(SELECT AVG(StudentResult) FROM Result WHERE SubjectId=@subjectID AND StudentResult IS NOT NULL)
PRINT @avgSubMark	

IF (@avgSubMark >= 60)
	BEGIN
		PRINT '考的不错，及格了'
		SELECT TOP 3 * FROM Result WHERE SubjectId=@subjectID ORDER BY StudentResult DESC
	END
ELSE
	BEGIN
		PRINT '考的啥玩意儿？'
		SELECT TOP 3 * FROM Result WHERE SubjectId=@subjectID ORDER BY StudentResult
	END