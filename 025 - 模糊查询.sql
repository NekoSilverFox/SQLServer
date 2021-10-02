-- 模糊查询
-- 【like '条件'】使用模糊查询匹配单引号里面的
-- 【not like '条件'】匹配除了单引号里面的


-- 通配符：
--【%】匹配任意多个任意字符
--【_】匹配任意一个字符
--【[]】代表一个具体的范围，能够匹配其中一个字符
--【^】取反值，只有在[]中才有意义！

use CZSchool
-- 查询姓“林”的同学
-- 【=】代表严格的字符串匹配，所以%只是一个字符而已，如果他是通配符必须使用【like】
select * from Student where StudentName='林%'
select * from Student where StudentName like '林%'
select * from Student where StudentName like '林__'

-- 查询【不】姓“林”的同学
select * from Student where StudentName not like '林%'

-- 查询学号为 11~15 的学生
select * from Student where StudentNo like '1[12345]'
select * from Student where StudentNo like '1[1-5]'
select * from Student where StudentNo like '[11-15]'	-- 【ERROR】系统会识别为 1 1-1 5，所以只会输出学号为1和5的，这里和正则一样，方括号里只能填0-9 a-z A-Z！
select * from Student where StudentNo like '1[^1-5]'	-- 输出学号为10、17~19的