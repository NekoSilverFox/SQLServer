-- �洢����

-- ����˵����
GO
create procedure usp_�洢��������
(�β�)	���������ﶨ�����
as <-- �൱�� ������
	�Զ����߼�����
	�߼����
GO


-- 1. ��ѯ���е�ѧԱ��Ϣ
if exists(select * from sysobjects where name='usp_getAllStuInfo')
	drop proc usp_getAllStuInfo
GO
CREATE procedure usp_getAllStuInfo
as
	SELECT * FROM Student
GO

-- ���ô洢����
exec usp_getAllStuInfo




-- 2. ��ѯָ���Ա��ѧԱ��Ϣ
if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@sex char(2)		--���ص㡿�β�ֻ�����������Ƕ��壬���Բ���Ҫ declare
as
	SELECT * FROM Student WHERE Sex=@sex
GO
-- ���ô洢����
EXEC usp_getAllStuInfoBySex '��'




-- 3. ��ѯָ���Ա�Ͱ༶��ѧԱ��Ϣ
if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@sex char(2),		--���ص㡿�β�ֻ�����������Ƕ��壬���Բ���Ҫ declare
	@className nvarchar(50)
as
	declare @classid int -- ��ĿID
	set @classid=(select classid from grade where classname=@className)
	select * from Student where sex=@sex and ClassId=@classid
GO
-- ���ô洢����
EXEC usp_getAllStuInfoBySex '��', '���ڰ�'



--4. ��������Ĭ��ֵ�Ĵ洢����
 if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@sex char(2)='��',		--���ص㡿ʹ��Ĭ��ֵ����������ݾ�ʹ��Ĭ��ֵ
	@className nvarchar(50)
as
	declare @classid int -- ��ĿID
	set @classid=(select classid from grade where classname=@className)
	select * from Student where sex=@sex and ClassId=@classid
GO
-- ���ص㡿��������˳��Ҫһ������һ��ʵ��Ĭ�Ͼ��Ǵ��ݸ���һ���βΡ����Դ�����
EXEC usp_getAllStuInfoBySex default, '���ڰ�'	-- �����Ĭ��ֵ����ôʹ��defaultĬ��ֵ



-- 5. ��������Ĭ��ֵ�Ĵ洢���̡��ص㡿
-- ������������Ĭ��ֵ�Ĳ���д�ڲ����б����
 if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@className nvarchar(50),
	@sex char(2)='��'		--���ص㡿ʹ��Ĭ��ֵ����������ݾ�ʹ��Ĭ��ֵ
as
	declare @classid int -- ��ĿID
	set @classid=(select classid from grade where classname=@className)
	select * from Student where sex=@sex and ClassId=@classid
GO
-- ���ص㡿��������˳��Ҫһ������һ��ʵ��Ĭ�Ͼ��Ǵ��ݸ���һ���βΡ����Դ�����
EXEC usp_getAllStuInfoBySex '���ڰ�'	-- ����Ĭ��ֵ�Ĳ���д�ڲ����б���󣬾Ϳ�������ֱ�ӵ���


-- 6. ��������Ĭ��ֵ�Ĵ洢���̡��ص㡿
-- ������
 if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@sex char(2)='��',		--���ص㡿ʹ��Ĭ��ֵ����������ݾ�ʹ��Ĭ��ֵ
	@className nvarchar(50)
as
	declare @classid int -- ��ĿID
	set @classid=(select classid from grade where classname=@className)
	select * from Student where sex=@sex and ClassId=@classid
GO
EXEC usp_getAllStuInfoBySex @className='���ڰ�'	-- ��ָ�������ķ�ʽ����
-- �������ַ����и�ȱ�㣬���ʹ�ö�������������Ķ�Ҫָ������������
EXEC usp_getAllStuInfoBySex @className='���ڰ�', 'Ů'  ERROR ���봫�ݲ��� 2������ '@name = value' ����ʽ���ݺ����Ĳ�����һ��ʹ���� '@name = value' ��ʽ֮�����к����Ĳ����ͱ����� '@name = value' ����ʽ���ݡ�
EXEC usp_getAllStuInfoBySex @className='���ڰ�', @sex='Ů'
go



-- ��output����������������Ĵ洢���̣����ض��ֵ��ʱ��ֻ��ʹ�� output
-- ����һ���洢���̣�����༶���Ա�����༶�������͸��Ա������
if exists (select * from sysobjects where name='usp_getStuNumBySex')
	DROP proc usp_getStuNumBySex
go
create proc usp_getStuNumBySex
	@totalNum int output,	-- ���һ������ʹ����output���Σ���ô˵��������һ�����������˵�����������������󷵻����������ֵ�����ҷ�����Ҳ֪���˱�ʶ��output�Ĳ������Ժ���Ҫ����
	@sexNum int output,		-- ָ����ĳһ�Ա��������
	@classname varchar(50),	-- �������
	@sex char(2)='��'		-- ��ðѴ���Ĭ�ϲ����ķ������
as
	declare @classid int=(select classid from grade where classname=@classname)
	select * from Student where ClassId=@classid and Sex=@sex
	set @totalNum=(select count(*) from Student)
	set @sexNum=(select Count(*) from Student where ClassId=@classid and Sex=@sex)
go

-- ʹ�ô�����������ģ�
-- ���������û�����ֵ���û���Ҫ������Ӧ�ı���������
-- ������ output ˵�����������������󷵻����������ֵ����������Ҳ֪���˱�ʶ�� output �Ĳ������Ժ���Ҫ����
declare @stuNum int, @sexNum int
exec usp_getStuNumBySex @stuNum output, @sexNum output, '���ڰ�'	-- ���ص㡿ע����մ�ҲҪ���� output
exec usp_getStuNumBySex @classname='���ڰ�', @totalNum=@stuNum output, @sexNum=@sexNum output	--���ص㡿�����δ���ղ�������Ҫ��ô���գ���



-- ʹ�ô��С�����ֵ���Ĵ洢����
--���ص㡿ע�⣡������ֵֻ�ܷ��� int ���ͣ�����
if exists(select * from sysobjects where name='usp_getStuNum')
	drop proc usp_getStuNum
go
-- ���ݰ༶�ţ�����ָ������
create proc usp_getStuNum
	@cid int
as
	declare @stuNum int
	set @stuNum=(select count(*) from Student where ClassId=@cid)
	return @stuNum			--���ص㡿ע�⣡������ֵֻ�ܷ��� int ���ͣ�����
go

-- ���ô洢����
declare @count int
exec @count=usp_getStuNum 6		--���ص㡿ע����÷�ʽ������
print @count