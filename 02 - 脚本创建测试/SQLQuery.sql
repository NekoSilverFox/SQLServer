create database test01
on primary (
name='test',
filename='D:\SQLServer\02 - �ű���������\test.mdf',
size=5MB,
maxsize=10MB,
filegrowth=5MB
)

log on (
name='test01_log',
filename='D:\SQLServer\02 - �ű���������\test.ldf',
size=5MB,
maxsize=10MB,
filegrowth=5MB
)