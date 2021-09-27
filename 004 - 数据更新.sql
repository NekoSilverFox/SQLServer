-- 数据更新
-- 语法：
-- update 表名 set 字段=值或表达式, 字段=值或表达式 where 条件(一般是能够做条件的是主键，唯一键，标识列)

-- 修改 Tom1 的班级为 3
-- update Teacher set Class=3 注意一定要加【where 条件】限定，不然会把表中所有的值都给改变！！
update Teacher set Class=3 where name='Tom1'

-- 修改 Tom6 的性别为女，并扣100工资
update Teacher set Gender=0, Salary-=1000 where name='Tom6'

-- 【多条件】判断多条件 not and or 性别是男 同时 是3班的，工资加666
update Teacher set Salary+=666 where Gender=1 and Class=3