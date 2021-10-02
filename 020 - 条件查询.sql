-- 【where】带条件的查询
select * from Student where Sex='女'



-- 查询年龄在 15-20之间的女性
select * from Student where Sex='女' and BornDate>'1995-1-1' and BornDate<'1999-1-1'

-- 【between ... and ...】大于等于前面的值，小于等于后面
select * from Student where Sex='女' and BornDate between'1995-1-1' and '1999-1-1'



-- 查询1~4班的学员信息
select * from Student where ClassID=1 or ClassID=2 or ClassID= 3 or ClassID=4

--【in】可以指定一个具体的范围，他可以取其中任意的值
select * from Student where ClassId in (1,2,3,4)