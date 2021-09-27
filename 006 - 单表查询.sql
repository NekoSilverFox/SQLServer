-- 单表查询数据索引
-- 语法：
-- select 字段列表或* from 表列表 where 条件

-- 查询所有信息
select * from Teacher

-- 查询指定列
select Id, Name, Salary, Class from Teacher

-- 指定查询条件：查询女老师
select * from Teacher where Gender=0 and Age<30

-- 为列指定中文别名，只改变结果集的显示，不会修改原始的表结构
select Id as 工号, Name 姓名, 工资=Salary, 公司='雪狸' from Teacher where Gender=0 and age<50

-- Select 可以输出，只不过输出的是以【表的形式】输出结果集
select 1+1, 2, 3, 4, 5