-- 临时表
-- 临时表不在我们创建的数据库中，在tempdb系统数据库中的`临时表`中

-- 局部临时表（只能在创建当前的回话中使用，如果当前回话关闭就会消失）
CREATE TABLE #temp
(
	-- 字段列表
	cid int,
	cname nvarchar(50)
)

-- 也可以这么创建临时表
select * into #tempGrade from grade

select * from #tempGrade

-- 利用临时表重置编号
use CZSchool
select * into #tempGrade from grade
truncate table grade
insert into grade select classname from #tempGrade


--【重点】全局临时表（如果不关闭当前的回话，其他的会话中也可以使用，如果当前回话关闭也会消失！）
CREATE TABLE ##temp2
(
	-- 字段列表
	cid int,
	cname nvarchar(50)
)

-- 利用临时表重置编号
insert into ##temp2 select * from grade
select * from ##temp2
truncate table grade
insert into grade select cname from ##temp2