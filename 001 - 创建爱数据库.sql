-- ���л���ǰ���ݿ�
use master

-------------------------------------------------------------------------
-- ���ж����ݿ��Ƿ���ڣ�������ھ���ɾ��
if exists(select * from sysdatabases where name='TestSchool')	-- ��exists()�������ж������е�����Ƿ񷵻�ֵ�������ֵ�ͷ��� true��ûֵ���� false
DROP database TestSchool

-------------------------------------------------------------------------
go	-- ���������ı�ǣ���ʾ������Ѿ�������

-------------------------------------------------------------------------
-- �Զ������ļ���											-- ����Ȩ��䡿sp_configure ��ʾ����ĵ�ǰ��������ȫ���������ã�ִ�гɹ�����0��ʧ�ܷ���1
execute sp_configure 'show advanced options',1			--  �ȿ�����ΧӦ�����ù�������1 ��������0 ����ر�
Reconfigure												--  RECONFIGUREʹǰ���������Ч
execute sp_configure 'xp_cmdshell',1
Reconfigure
execute xp_cmdshell 'mkdir D:\SQLServer\DataBase'		-- ���ô洢���� xp_cmdshell����������Ǵ���һ���ļ��� 

-------------------------------------------------------------------------
-- �������ݿ� TestSchool
create database TestSchool
on primary
(
	name='TestSchool_data',
	filename='D:\SQLServer\db001_TestSchool\TestSchool_data.mdf',
	size=3mb,
	filegrowth=1mb,
	maxsize=100mb
),														-- ���ͬʱ����������ݿ⣬���ź���Ӷ��š�
filegroup userDataBase									-- ����ѡ��ѡ���ļ���
(
	name='TestSchool2_data',
	filename='D:\SQLServer\db001_TestSchool\TestSchool2_data.ndf',		-- ��.ndf���������ļ�
	size=1mb,
	filegrowth=1mb,
	maxsize=10mb
)
log on
(
	name='TestSchool_log',
	filename='D:\SQLServer\db001_TestSchool\TestSchool_data.log',
	size=1mb,
	filegrowth=1%
	-- maxsize=100mb ��־һ�㲻�����������
),														-- ��־�ļ�Ҳ�����ж��
(
	name='TestSchool2_log',
	filename='D:\SQLServer\db001_TestSchool\TestSchool_data2.log',
	size=1mb,
	filegrowth=1%
	-- maxsize=100mb ��־һ�㲻�����������
)

-------------------------------------------------------------------------
-- �������ݱ�