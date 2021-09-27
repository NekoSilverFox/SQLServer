------------------------------------------------------------
-- �Զ������ļ��� xp - extend procedure
exec xp_cmdshell 'mkdir D:\SQLServer\DataBase\mySchool'
go
------------------------------------------------------------

-------------------- ʹ��ddl���Դ������ݿ�mySchool --------------------
-- ������ʱ������ж��ļ��Ƿ���ڣ�������ھ���ɾ����ִ�д�������
use master
if exists(select * from sysdatabases where name='mySchool')
	Drop database mySchool
go		-- ������������ı�ǡ� SQL Server �ǽ������ԣ�go���ǰѡ������һ���������һ����顿һ�����ǰ���ͬ���ܵ���������һ�������


create database mySchool
on primary
(
	name='mySchool_data',
	size=5MB,
	filegrowth=15%,
	maxsize=100MB,
	filename='D:\SQLServer\DataBase\mySchool\mySchool_data.mdf'
)
log on
(
	name='mySchool_log',
	size=1MB,
	filegrowth=1%,
	-- maxsize=100MB,
	filename='D:\SQLServer\DataBase\mySchool\mySchool_log.ldf'
)
go
------------------------------------------------------------


------------------------------------------------------------
-- ʹ��ddl���Դ�����������ʱ������ж��ļ��Ƿ���ڣ�������ھ���ɾ����ִ�д�������
use mySchool		-- �л�Ϊ��ǰ�����ݿ�
if exists(select * from sysobjects where name='grade')	-- sysobjects �洢����һ���ݿ������Լ�������б��洢���̡���ͼ
	Drop table grade
create table grade
(
	GradeId int identity(1, 1),		-- ��Ҫ�ڴ�����ʱ�����Լ������������Ϊ��ϵͳ���ɵ�guideֵ��֮���޷�ͨ������ɾ��
	GradeName nvarchar(50) not null
)
------------------------------------------------------------


------------------------------------------------------------
-- sysobjects �洢����һ���ݿ������Լ�������б��洢���̡���ͼ
if exists(select * from sysobjects where name='PK_Grade_GradeId')
	Alter table grade Drop constraint PK_Grade_GradeId
Alter table grade
Add constraint PK_Grade_GradeId primary key(GradeId)

-- ��ΪGrade���������Ĭ�ϼ�¼��������ڵ��������ϵ�Ĵ���
use mySchool	-- ע�����������ݿ�����֣�Ϊ��������ݣ�
insert into grade values('һ��')
insert into grade values('����')
insert into grade values('����')
------------------------------------------------------------


------------------------------------------------------------
-- ���� student ��
if exists(select * from sysobjects where name='student')
	Drop table student
create table student
(
	StudentNo int identity(1,1) not null,
	LoginPwd nvarchar(50) not null,
	StudentName nvarchar(50) not null,
	Gender bit not null,
	GradeId int not null,
	Phone nvarchar(13),
	[Address] nvarchar(255),
	Birthday datetime not null,
	Email nvarchar(50)
)
------------------------------------------------------------


------------------------------------------------------------
-- sysobjects �洢����һ���ݿ������Լ�������б��洢���̡���ͼ
Alter table student
Add constraint PK_Student_StudentNO primary key(StudentNo),			-- studentNoѧ���Ǳ�ʶ��
	constraint CK_Student_LoginPwd check(len(LoginPwd)>6),			-- ����loginPwd�ĳ��ȴ��ڵ���6λ
	constraint CK_Student_Gender check(Gender=1 or Gender=0),		-- Gender�Ա�ֻ��ȡ1��0��1�����У�0����Ů
	constraint FK_Student_GradeId foreign key(GradeId) references Grade(GradeId),		-- GradeId��grade������
	--	on delete set null,
	constraint DF_Student_Address default('δ��д') for [Address],	-- Address��Ĭ��ֵ����δ��д��
	constraint DF_Student_Email default('����@δ֪.com') for Email;	-- Email:Ĭ��ֵ ����@δ֪.com
------------------------------------------------------------


------------------------------------------------------------
-- �ֱ�Ϊ����������������ϵĲ�������
insert into student values('g43gfhd', 'TomCat', '1', '1', null, 'ŦԼ', '2000-9-8', default)
insert into student values('hjdr551', 'Jerry', '1', '2', '4895479646', '����', '2050-1-7', 'fff@aaa.com')
insert into student values('hjdr551', 'Juddy', '0', '3', '286489654', '��������', '2008-7-5', 'gedaw@qs.ru')
------------------------------------------------------------


------------------------------------------------------------
-- �޸ĵ�������Ϊ������@δ֪.com����ѧԱ��Ϣ��emailֵΪdefault@126.com
update student set Email='default@126.com' where Email='����@δ֪.com'

-- ɾ���Ա�Ϊ  ��  ��ѧԱ��¼
delete from student where Gender='1'