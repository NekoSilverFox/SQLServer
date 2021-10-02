-- 聚合函数
-- MAX(最大值)、MIN(最小值)、AVG(平均值)、SUM(和)、COUNT(数量：记录的数量)
-- SUM和AVG只能操作数值类型！比如日期、字符串不能做求和或平均值！
-- 这些函数都会自动过滤null！


select MAX(BornDate) from Student			-- 查询年龄最小的学员
select MIN(BornDate) from Student			-- 查询年龄最小的学员

select MIN(StudentName) from Student		-- 如果是字符串，按照字典序，得到最大或最小
select MAX(StudentName) from Student

select SUM(StudentResult) from Result where StudentNo=10	-- 查询学号是10学生的总分
select AVG(StudentResult) from Result where StudentNo=10	-- 查询学号是10学生的总分

select SUM(StudentResult) from Result where StudentNo=10	-- 查询学号是10学生的总分
select AVG(StudentResult) from Result where StudentNo=10	-- 查询学号是10学生的总分

-- COUNT 得到满足条件的记录数，会自动过滤null
select COUNT(StudentName) from Student		-- 学生总人数

