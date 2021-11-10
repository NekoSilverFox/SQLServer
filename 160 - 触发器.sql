-- 触发器
CREATE TRIGGER 触发器名称
	ON 表名
	AFTER INSERT, DELETE, UPDATE	-- 触发条件
AS
BEGIN
	SET NOCOUNT ON;	-- 指令
	
	-- =======================
	-- 里面填任意SQL语句
	-- =======================

END
GO



use CZSchool
-- 在 post 中创建触发器，如果有重复的值就回滚到插入之前 
GO
DROP TRIGGER trig_addUser
GO

CREATE TRIGGER trig_addUser
	ON [User]
	--AFTER INSERT
	FOR INSERT
AS
BEGIN
	DECLARE @nameuser char(20)
	SELECT @nameuser=Username FROM inserted

	IF EXISTS(SELECT UserName FROM [User] WHERE [User].UserName=@nameuser)
	BEGIN
		PRINT '不能插入重复值！！'
		ROLLBACK TRANSACTION
	END
END;

INSERT [User] VALUES('a5sd1', '44444456', 'asdass@asd.cn', '4646846')



-- 触发器禁止修改
use CZSchool
GO
DROP TRIGGER trig_changeUser
GO

CREATE TRIGGER trig_changeUser
	ON [User]
	AFTER UPDATE
AS
BEGIN
	IF UPDATE(UserName)
	BEGIN
		PRINT '不能修改！！'
		ROLLBACK TRANSACTION
	END
END;

UPDATE [User] SET UserName='tt2' WHERE UserName='tt'

UPDATE [User] SET Email='tt2.DDD' WHERE UserName='tt'



-- 触发器禁止删除用户 tt 
GO
	DROP TRIGGER trig_deleUsertt
GO
CREATE TRIGGER trig_deleUsertt
	ON [User]
	AFTER DELETE
AS
BEGIN
	IF EXISTS(SELECT * FROM deleted WHERE UserName='tt')
	BEGIN
		PRINT '不能删除用户tt'
		ROLLBACK TRANSACTION
	END
END
GO

DELETE [User] WHERE UserName='TT'




--插入后触发器查询两个临时表
if exists(select * from sysobjects where name='tr_grade_insert')
	drop trigger tr_grade_insert
go
create trigger tr_grade_insert
	on grade for insert --为grade表创建触发器，在你对grade表进行插入操作后触发
as
	print 'inserted表存储操作之后的 与当前操作相关的数据，而与之前表的数据无关'
	select * from inserted
	print 'deleted表存储操作之前的数据'
	select * from deleted
go

insert into grade values('亲爱sdas的')


if exists(select * from sysobjects where name='tr_grade_delete')
	drop trigger tr_grade_delete
go
create trigger tr_grade_delete
	on grade after delete --为grade表创建触 发器，在你对grade表进行插入操作后触 发
as
	print 'inserted表存储操作之后的 与当前操作相关的数据，而与之前表的数据无关'
	select * from inserted
	print 'deleted表存储操作之前的数据'
	select * from deleted
go

delete from grade where ClassId>18



if exists(select * from sysobjects where name='tr_grade_update')
	drop trigger tr_grade_update
go
create trigger tr_grade_update
	on grade after update --为grade表创建触 发器，在你对grade表进行插入操作后触 发
as
	print 'inserted表存储操作之后的与当前操作相关的数据，而与之前表的数据无关'
	select * from inserted
	print 'deleted表存储操作之前的数据'
	select * from deleted
go

update grade set classname='aaaaa' where ClassId>16




-- 使用触发器模拟唯一键约束
use CZSchool
GO
CREATE TRIGGER tr_GradeUnpiueClassname
	ON grade
	AFTER INSERT
AS
BEGIN
	DECLARE @cid int, @cname nvarchar(50)
	SELECT @cid=ClassId, @cname=classname FROM inserted

	IF ((SELECT COUNT(*) FROM GRADE WHERE classname=@cname)>1)
	BEGIN
		PRINT 'classname已存在, 将被删除'
		DELETE FROM grade WHERE ClassId=@cid
	END
	ELSE
		PRINT '插入成功'
END

insert into grade values('newnewnew')