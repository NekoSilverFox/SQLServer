select * from Student

-- 【Top】使用 Top 只返回结果集的前 n 条
select top 5 * from Student

-- 【Top】使用 Top 只返回结果集的前 n% 条，不是四舍五入的，而是取 Ceiling（向上取整）
select top 10 percent * from Student


-- 【distinct】去除重复，作用与原始数据表的记录无关，只与当前结果集有关系
select distinct sex, Address from Student
