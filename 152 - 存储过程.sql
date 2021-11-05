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