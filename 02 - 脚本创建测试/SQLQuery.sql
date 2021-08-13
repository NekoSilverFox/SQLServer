create database test01
on primary (
name='test',
filename='D:\SQLServer\02 - 脚本创建测试\test.mdf',
size=5MB,
maxsize=10MB,
filegrowth=5MB
)

log on (
name='test01_log',
filename='D:\SQLServer\02 - 脚本创建测试\test.ldf',
size=5MB,
maxsize=10MB,
filegrowth=5MB
)