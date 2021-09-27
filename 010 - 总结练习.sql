------------------------------------------------------------
-- 自动创建文件夹 xp - extend procedure
exec xp_cmdshell 'mkdir D:\SQLServer\DataBase\mySchool'
go
------------------------------------------------------------

-------------------- 使用ddl语言创建数据库mySchool --------------------
-- 创建的时候必须判断文件是否存在，如果存在就先删除再执行创建操作
use master
if exists(select * from sysdatabases where name='mySchool')
	Drop database mySchool
go		-- 【批处理结束的标记】 SQL Server 是解释语言，go就是把【上面的一堆语句打包成一个语块】一般我们把相同功能的语句包含在一个语块中


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
-- 使用ddl语言创建表：创建的时候必须判断文件是否存在，如果存在就先删除再执行创建操作
use mySchool		-- 切换为当前的数据库
if exists(select * from sysobjects where name='grade')	-- sysobjects 存储了这一数据库的所有约束、所有表、存储过程、视图
	Drop table grade
create table grade
(
	GradeId int identity(1, 1),		-- 不要在创建的时候添加约束！！！！因为是系统生成的guide值，之后无法通过名字删除
	GradeName nvarchar(50) not null
)
------------------------------------------------------------


------------------------------------------------------------
-- sysobjects 存储了这一数据库的所有约束、所有表、存储过程、视图
if exists(select * from sysobjects where name='PK_Grade_GradeId')
	Alter table grade Drop constraint PK_Grade_GradeId
Alter table grade
Add constraint PK_Grade_GradeId primary key(GradeId)

-- 请为Grade表插入三条默认记录，方便后期的主外键关系的创建
use mySchool	-- 注意这里是数据库的名字（为表插入数据）
insert into grade values('一班')
insert into grade values('二班')
insert into grade values('三班')
------------------------------------------------------------


------------------------------------------------------------
-- 创建 student 表
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
-- sysobjects 存储了这一数据库的所有约束、所有表、存储过程、视图
Alter table student
Add constraint PK_Student_StudentNO primary key(StudentNo),			-- studentNo学号是标识列
	constraint CK_Student_LoginPwd check(len(LoginPwd)>6),			-- 密码loginPwd的长度大于等于6位
	constraint CK_Student_Gender check(Gender=1 or Gender=0),		-- Gender性别只能取1和0，1代表男，0代表女
	constraint FK_Student_GradeId foreign key(GradeId) references Grade(GradeId),		-- GradeId是grade表的外键
	--	on delete set null,
	constraint DF_Student_Address default('未填写') for [Address],	-- Address有默认值：“未填写”
	constraint DF_Student_Email default('匿名@未知.com') for Email;	-- Email:默认值 匿名@未知.com
------------------------------------------------------------


------------------------------------------------------------
-- 分别为两个表添加三条以上的测试数据
insert into student values('g43gfhd', 'TomCat', '1', '1', null, '纽约', '2000-9-8', default)
insert into student values('hjdr551', 'Jerry', '1', '2', '4895479646', '东京', '2050-1-7', 'fff@aaa.com')
insert into student values('hjdr551', 'Juddy', '0', '3', '286489654', '西伯利亚', '2008-7-5', 'gedaw@qs.ru')
------------------------------------------------------------


------------------------------------------------------------
-- 修改电子邮箱为“匿名@未知.com”的学员信息的email值为default@126.com
update student set Email='default@126.com' where Email='匿名@未知.com'

-- 删除性别为  男  的学员记录
delete from student where Gender='1'