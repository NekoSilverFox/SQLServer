-- 视图
-- 视图就是一张虚拟表，根据用户的查询创建的命令。使用视图就像使用表一样！
select * from 视图

-- 使用代码创建视图：
CREATE VIEW vw_视图名称
AS
	你需要查询的命令
GO

use CZSchool
if exists(select * from sysobjects where name='vw_getStudentBySex')
	drop view vw_getStudentBySex
go
create view vw_getStudentBySex	-- 这个创建语句必须是批处理语句的第一句（GO 后的第一句）
as
	select * from Student where sex='男'
	-- select * from Student order by StudentNo	【重点】视图中不能使用 ORDER BY ，除非使用了 TOP，可以用 TOP 100 Percent 取全部结果，但是排序会失效
	-- select * from grade	【重点】视图中只能创建一个 select 查询
	-- update grade			【重点】不能在视图创建中使用 UPDATE DELETE 和 INSERT
go


-- 使用视图
-- 对视图【一般】不会去执行删除和修改操作，但是一定要注意的是：
--	对视图的这些操作会影响到原始的物理表
--	如果对视图做增删改，确保这些操作仅仅是对一个表的，如果涉及到多表连接的视图，会失败
select * from vw_getStudentBySex
update vw_getStudentBySex set phone='123456789' where StudentNo=1 -- OK

select * from vw_getinfo
update vw_getinfo set phone='97685', classid=2 where StudentNo=1 -- ERROR