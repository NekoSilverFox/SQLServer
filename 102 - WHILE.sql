-- WHILE
--可以嵌套
--没有 {}，使用 BEGIN END
--不能使用 true false，只能使用条件表达式
--如果里面只有一句就可以不使用 BEGIN END 包含
--可以使用 CONTIUNE/BREAKE 

-- 如果 office 不及格的人数超过一半（题太难了），就给每人加2分，循环加，直到不及格的人数小于人数的一半
go
declare @subName nvarchar(50)='office'	-- 科目名称
declare @subID int=(select SubjectId from Subject where SubjectName=@subName)	-- 科目ID
declare @classid int =(select ClassId from Subject where SubjectName=@subName)	-- 这一科目所属的班级ID
declare @totalNum int	-- 这一科目考试总人数
set @totalNum=(select COUNT(*) from Student where ClassId=@classid)
declare @unpassNum int=(select COUNT(*) from Result where SubjectId=@subID and StudentResult<60)	-- 未通过的人数
while(@unpassNum > @totalNum/2)
	begin
		update Result set StudentResult += 2 where SubjectId=@subID and StudentResult<98	-- 不能超过 100分，为了不违反CHECK约束
		set @unpassNum=(select COUNT(*) from Result where SubjectId=@subID and StudentResult<60)	-- 重新计算未通过的人数
	
	end



-- 第二种做法
go
declare @subName nvarchar(50)='office'	-- 科目名称
declare @subID int=(select SubjectId from Subject where SubjectName=@subName)	-- 科目ID
declare @classid int =(select ClassId from Subject where SubjectName=@subName)	-- 这一科目所属的班级ID
declare @totalNum int	-- 这一科目考试总人数
set @totalNum=(select COUNT(*) from Student where ClassId=@classid)
-- declare @unpassNum int=(select COUNT(*) from Result where SubjectId=@subID and StudentResult<60)	-- 未通过的人数

while (1=1)
begin
	if((select COUNT(*) from Result where SubjectId=@subID and StudentResult<60) > @totalNum/2)
		update Result set StudentResult += 2 where SubjectId=@subID and StudentResult<98	-- 不能超过 100分，为了不违反CHECK约束
	else
		break

end