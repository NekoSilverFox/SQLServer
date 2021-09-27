
-- �Զ������ļ��� xp - extend procedure
exec xp_cmdshell 'mkdir D:\SQLServer\DataBase\mySchool'
go

-- ʹ��ddl���Դ������ݿ�mySchool
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

-- ʹ��ddl���Դ�����������ʱ������ж��ļ��Ƿ���ڣ�������ھ���ɾ����ִ�д�������
use mySchool		-- �л�Ϊ��ǰ�����ݿ�
if exists(select * from sysobjects where name='grage')
	Drop table grage
create table grage
(
	GradeId int primary key identity(1, 1) not null,
	GradeName nvarchar(50) not null
)

-- ��ΪGrade���������Ĭ�ϼ�¼��������ڵ��������ϵ�Ĵ���
use mySchool	-- ע�����������ݿ�����֣�Ϊ��������ݣ�
insert into grage values(1, 'һ��')
insert into grage values(2, '����')
insert into grage values(3, '����')

-- ���� student ��
if exists(select * from sysobjects where name='student')
	Drop table student
create table student
(
	StudentNo int primary key identity(1,1) not null,						-- studentNoѧ���Ǳ�ʶ��
	LoginPwd nvarchar(50) check(len(LoginPwd)>6) not null,	-- ����loginPwd�ĳ��ȴ��ڵ���6λ
	StudentName nvarchar(50) not null,
	Gender char(1) check(Gender='1' or Gender='0') not null, -- Gender�Ա�ֻ��ȡ1��0��1�����У�0����Ů
	GradeId int, -- foreign key grade(GradeId) not null,				-- GradeId��grade������
	Phone nvarchar(255),
	Address nvarchar(255) default('δ��д'),					-- Address��Ĭ��ֵ����δ��д��
	Birthday datetime not null,
	Email nvarchar(50) default('����@δ֪.com')							-- Email:Ĭ��ֵ ����@δ֪.com
)

-- �ֱ�Ϊ����������������ϵĲ�������
insert into student values('g43gfhd', 'TomCat', '1', '1', null, 'ŦԼ', '2000-9-8', default)
insert into student values('hjdr551', 'Jerry', '1', '2', '4895479646', '����', '2050-1-7', 'fff@aaa.com')
insert into student values('hjdr551', 'Juddy', '0', '3', '286489654', '��������', '2008-7-5', 'gedaw@qs.ru')

-- �޸ĵ�������Ϊ������@δ֪.com����ѧԱ��Ϣ��emailֵΪdefault@126.com
update student set Email='default@126.com' where Email='����@δ֪.com'

-- ɾ���Ա�Ϊ  ��  ��ѧԱ��¼
delete from student where Gender='1'