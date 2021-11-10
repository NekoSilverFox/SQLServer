-- 索引
-- 索引就是一张表，在表中存储了【地址】所以排序后可以有更高效的查询
if exists(select * from sysindexes where name='IX_表_列名')
	drop index IX_表_列名
go
CREATE [CLUSTERED聚集/nonCLUSTERED非聚集] INDEX IX_表_列名
	ON 表(列名)
GO

-- 使用Student表的name作为索引
use CZSchool
create clustered index IX_Student_StudentName
	on Student(StudentName)

SELECT * FROM STUDENT