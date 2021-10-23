-- 100 - CASE用法

-- 1. 用来做结果集【字段】值的替换
-- 2. 生成新列
-- 3. 相当于 switch...case 和 is..else



-- 第1种使用的方法：
-- CASE 表达式/字段
-- WHEN 值 THEN 自定义值
-- ....
-- ELSE 如果上面的 WHEN 都不满足就满足 ELSE
-- END

use CZSchool
select StudentNo, Studentname, Sex, ClassId from Student

-- 如果 CASE 后面接表达式或者字段，那么这种结构【只能做等值判断】
select StudentNo, Studentname, Sex,
		CASE ClassId
			WHEN 1 THEN '一班'
			WHEN 1 THEN '二班'
			WHEN 1 THEN '三班'
			ELSE '我不晓得'
		END AS '班级名称'
	FROM Student


-- 第2种使用的方法：
-- CASE 如果 CASE 后面没有接表达式或者值，那么相当于IF ELSE
-- WHEN 值 THEN 自定义值
-- ....
-- ELSE 如果上面的 WHEN 都不满足就满足 ELSE
-- END

SELECT StudentNo, StudentName,
		CASE  -- 会从上往下匹配
			WHEN BornDate > '2000-1-1' then '小正太'
			WHEN BornDate > '1990-1-1' then '小青年'
			WHEN BornDate > '1980-1-1' THEN '大叔'
			-- WHEN Sex='男' then '我是男的'
			ELSE '中老年'
		END
	FROM Student
