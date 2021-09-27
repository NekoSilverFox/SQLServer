-- 语法：
-- delete [from] 表 where 条件
-- 1. 删除时一条一条的删除，每一次删除都会将操作写入到日志文件（效率低）
-- 2. 标识列的值不会从种子重新计算
-- 3. 可以触发触发器

-- 删除姓名为 7 的人
delete from Teacher where Name='7'

-- 多条件删除
delete from Teacher where Class='3' and Age<25

-- 【delete】删除【所有】数据
delete from Teacher

-- 【truncate】删除【所有】数据
-- 1. 标识列从种子值重新计算
-- 2. 不可以触发触发器
-- 语法：
-- truncate table 表名（不能添加条件，因为他们不是一条一条的删除的，而是一次性删除所有记录，不关注删除的条数）
truncate table Teacher

-- 补充：公司里一般不回去直接去删除记录，而是用 update 做一个标记，标记此数据已经删除。但是其实没有删除