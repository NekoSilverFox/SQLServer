-- ������
CREATE TRIGGER ����������
	ON ����
	AFTER INSERT, DELETE, UPDATE	-- ��������
AS
BEGIN
	SET NOCOUNT ON;	-- ָ��
	
	-- =======================
	-- ����������SQL���
	-- =======================

END
GO

use CZSchool
-- �� post �д�����������������ظ���ֵ�ͻع�������֮ǰ 
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
		PRINT '���ܲ����ظ�ֵ����'
		ROLLBACK TRANSACTION
	END
END;

INSERT [User] VALUES('a5sd', '44444456', 'asdass@asd.cn', '4646846')



-- ��������ֹ�޸�
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
		PRINT '�����޸ģ���'
		ROLLBACK TRANSACTION
	END
END;

UPDATE [User] SET UserName='tt2' WHERE UserName='tt'

UPDATE [User] SET Email='tt2.DDD' WHERE UserName='tt'



-- ��������ֹɾ���û� tt 
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
		PRINT '����ɾ���û�tt'
		ROLLBACK TRANSACTION
	END
END