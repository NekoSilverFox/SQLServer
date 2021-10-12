-- 数值函数
-- rand() 生成一个 [0, 1) 之间的随机数
select RAND()

-- abs() absolute 绝对值
select abs(-233)

-- ceiling() 向上取整，获取比当前数大的最小整数，通常用与分页功能
select CEILING(0.0001)	-- 1

-- floor() 向下取整，获取比当前数小的最大整数
select FLOOR(0.0001)	-- 0

-- round(数值， 尽到小数后几位) 
select ROUND(3.1415, 3)	-- 3.1420
select ROUND(4.5, 0)	-- 5.0
select ROUND(4.6444, 1)	-- 4.6000

-- sign() 正数输出1；负数输出-1；0输出0
select SIGN(233)	-- 1
select SIGN(-233)	-- -1

-- power() 平方
select POWER(2, 3)	-- 8

--sqrt() 开平方
select SQRT(8)		-- 2.82842712474619