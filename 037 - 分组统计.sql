-- 数据分组-统计信息
select top/distinct 字段列表 from 表列表 where 源数据筛选条件 group by 分组字段列表 having 对分组之后得到的结果集做筛选 order by 排序字段列表

-- 查询男女生人数
select COUNT(*) from Student
select COUNT(*) from Student where sex='男'

select COUNT(*) from Student group by sex
select sex,COUNT(*) from Student group by Sex

-- 查询每一个班级的总人数
-- 【重点】与聚合函数一起出现在select后面一起查询的列，只有两种可能性：被聚合 被分组
select Classid, COUNT(*) from student group by ClassId

-- 查询每一个班的男女生总人数
select classid, sex, COUNT(*) from student group by ClassId, sex order by ClassId, sex

-- 查询每一个班级男女生的人数，同时只显示人数数量超过3人的记录
--  5   7                                    1             2                       3                    4                    6
select top 2 ClassId, sex, COUNT(*) as cnt from student where email is not null group by ClassId, sex having count(*)>3 order by Classid

-- 查询每个班的总学时数，并按照升序排列
select classid, sum(classhour) as 总学时 from subject group by classid order by sum(classhour)
-- 查询参加考试学员的平均分
select studentno, AVG(studentResult) from result group by StudentNo
-- 查询每门课程的平均分，并按照降序排列
select (select subjectname from subject where subject.SubjectId=Result.SubjectId) as 科目名
		, AVG(StudentResult) as 平均分 from Result group by SubjectID order by SubjectID