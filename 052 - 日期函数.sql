-- 日期函数

-- getdate() 获取当前系统日期
select GETDATE()

-- dateadd() 在指定的日期值上增加指定的日期值
select DATEADD(mm, 3, GETDATE())
select DATEADD(dd, 40, GETDATE())
select DATEADD(mm, -5, GETDATE()) -- 三个月之前是哪一天

-- datediff() 获取两个指定日期之间的日期值
select StudentName, DATEDIFF(yyyy, BornDate, GETDATE()) from student
-- 查询年龄在 14~29 之间的男生
select StudentName, Phone, Address from Student where DATEDIFF(yyyy, BornDate, GETDATE()) between 14 and 29 and sex='男'
select DATEDIFF(mm, '2019-9-1', GETDATE())

-- datename() 返回日期的【字符串】
select DATENAME(yyyy, getdate())
select DATENAME(ww, getdate())	-- 现在是今年的第几周
select DATENAME(WEEKDAY, GETDATE())	-- 今天是星期几

-- datepart() 得到日期指定部分
select DATEPART(yyyy, GETDATE())