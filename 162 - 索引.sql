-- ����
-- ��������һ�ű��ڱ��д洢�ˡ���ַ���������������и���Ч�Ĳ�ѯ
if exists(select * from sysindexes where name='IX_��_����')
	drop index IX_��_����
go
CREATE [CLUSTERED�ۼ�/nonCLUSTERED�Ǿۼ�] INDEX IX_��_����
	ON ��(����)
GO

-- ʹ��Student���name��Ϊ����
use CZSchool
create clustered index IX_Student_StudentName
	on Student(StudentName)

SELECT * FROM STUDENT