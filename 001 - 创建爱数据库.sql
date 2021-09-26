-- 先切换当前数据库
use master

-------------------------------------------------------------------------
-- 先判断数据库是否存在，如果存在就先删除
if exists(select * from sysdatabases where name='TestSchool')	-- 【exists()】就是判断括号中的语句是否返回值，如果有值就返回 true，没值就是 false
DROP database TestSchool

-------------------------------------------------------------------------
go	-- 批处理级数的标记，表示上面的已经做完了

-------------------------------------------------------------------------
-- 自动创建文件夹											-- 【提权语句】sp_configure 显示或更改当前服务器的全局配置设置，执行成功返回0，失败返回1
execute sp_configure 'show advanced options',1			--  先开启外围应用配置管理器；1 代表开启；0 代表关闭
Reconfigure												--  RECONFIGURE使前面的配置生效
execute sp_configure 'xp_cmdshell',1
Reconfigure
execute xp_cmdshell 'mkdir D:\SQLServer\DataBase'		-- 调用存储过程 xp_cmdshell，让其帮我们创建一个文件夹 

-------------------------------------------------------------------------
-- 创建数据库 TestSchool
create database TestSchool
on primary
(
	name='TestSchool_data',
	filename='D:\SQLServer\db001_TestSchool\TestSchool_data.mdf',
	size=3mb,
	filegrowth=1mb,
	maxsize=100mb
),														-- 如果同时创建多个数据库，括号后面加逗号、
filegroup userDataBase									-- 【可选】选择文件组
(
	name='TestSchool2_data',
	filename='D:\SQLServer\db001_TestSchool\TestSchool2_data.ndf',		-- 【.ndf】次数据文件
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
	-- maxsize=100mb 日志一般不限制最大容量
),														-- 日志文件也可以有多个
(
	name='TestSchool2_log',
	filename='D:\SQLServer\db001_TestSchool\TestSchool_data2.log',
	size=1mb,
	filegrowth=1%
	-- maxsize=100mb 日志一般不限制最大容量
)


-------------------------------------------------------------------------
-- 创建数据表（Teacher）ID Name Gender Age Salary Birthday
use TestSchool											-- 首先要指明所属的数据库
if exists(select * from sysobjects where name='Teacher') -- 查询表要用 sysobjects 关键字
	Drop table Teacher
go
create table Teacher
(
	ID int identity(1,1) primary key,					--【设置标识列】identity(标识种子,标识增量)，标识列就是用来做主键的！
	Name nvarchar not null,								--【not null】标记字段不能为空
	Gender bit not null,
	Age smallint check(age>=0 and age<=100) not null,	--【check】设置check约束
	Salary money,										-- 当一个字段可以为null时，可以写 null，也可以不写
	Birthday datetime not null default('2000-1-1')		--【default()】默认值
)
