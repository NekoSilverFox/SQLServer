-- 联合(union) 和 连接（join)不一样

use master
use CZSchool

-- 查询男女生总人数
select '男生人数', COUNT(*) from Student where Sex='男'
select '女生人数', COUNT(*) from Student where Sex='女'

-- union:是用来联合多个结果集的
-- 1. 要求联合的多个结果集有相同数量的字段
-- 2. 要求联合的多个结果集对应的列的类型需要一致：所谓的类型一致是指他们可以互相转换
-- union 默认是去除重复的，效率低，是因为需要为你做是否重复的判断
-- union all 就是不去除重复
select '男生人数', COUNT(*) from Student where Sex='男'
union
select '女生人数', COUNT(*) from Student where Sex='女'

select '男生人数', COUNT(*) from Student where Sex='男'
union all
select '男生人数', COUNT(*) from Student where Sex='男'



-- 使用union，一次性插入多条数据
-- union 还是可以去除重复记录，只有当全部都使用 union all 才不考虑重复值
insert into Admin
select 'fox', 'fox' union all
select 'fox', 'fox' union
select 'fox2', 'fox2'


-- select into from：可以将 from 数据源表中 select 指定的列的数据 into 到新表中，新表是系统自动生成的，不能人为先创建，也就是之前不能存在
select * into newtable from Student
delete from newtable

-- insert into 表 selete from：可以将select查询语句中获取的数据into到指定表，【表需要先存在】
insert into newtable select Studentname,Loginpwd, sex, classid, phone, address, borndate, email, isDel from Student

