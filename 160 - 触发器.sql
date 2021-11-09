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
	AFTER INSERT
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

INSERT [User] VALUES('a5sd', '44444456', 'asdass@asd.cn', '4646846')



-- 触发器禁止修改
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