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
	--AFTER INSERT
	FOR INSERT
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

INSERT [User] VALUES('a5sd1', '44444456', 'asdass@asd.cn', '4646846')



-- ��������ֹ�޸�
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
GO

DELETE [User] WHERE UserName='TT'




--����󴥷�����ѯ������ʱ��
if exists(select * from sysobjects where name='tr_grade_insert')
	drop trigger tr_grade_insert
go
create trigger tr_grade_insert
	on grade for insert --Ϊgrade�����������������grade����в�������󴥷�
as
	print 'inserted��洢����֮��� �뵱ǰ������ص����ݣ�����֮ǰ��������޹�'
	select * from inserted
	print 'deleted��洢����֮ǰ������'
	select * from deleted
go

insert into grade values('�װ�sdas��')


if exists(select * from sysobjects where name='tr_grade_delete')
	drop trigger tr_grade_delete
go
create trigger tr_grade_delete
	on grade after delete --Ϊgrade������ �����������grade����в�������� ��
as
	print 'inserted��洢����֮��� �뵱ǰ������ص����ݣ�����֮ǰ��������޹�'
	select * from inserted
	print 'deleted��洢����֮ǰ������'
	select * from deleted
go

delete from grade where ClassId>18



if exists(select * from sysobjects where name='tr_grade_update')
	drop trigger tr_grade_update
go
create trigger tr_grade_update
	on grade after update --Ϊgrade������ �����������grade����в�������� ��
as
	print 'inserted��洢����֮����뵱ǰ������ص����ݣ�����֮ǰ��������޹�'
	select * from inserted
	print 'deleted��洢����֮ǰ������'
	select * from deleted
go

update grade set classname='aaaaa' where ClassId>16




-- ʹ�ô�����ģ��Ψһ��Լ��
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
		PRINT 'classname�Ѵ���, ����ɾ��'
		DELETE FROM grade WHERE ClassId=@cid
	END
	ELSE
		PRINT '����ɹ�'
END

insert into grade values('newnewnew')