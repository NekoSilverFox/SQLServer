-- 032 - �ֲ�����
-- �﷨��
-- declare @������ ���������͡�=Ĭ��ֵ��
declare @name nvarchar(50)='sdafasasdf'

print @name + '123'
select @name
select @name, 1, 'asdas'
go



-- ����ֵ��set �� select
declare @name nvarchar(50)
set @name='123'
select @name='456'
-- set �� select ������
--		- ����������������Ӳ�ѯ����ô����û������������
--		- select ���԰��Ӳ�ѯ�е� select ʡ��
--		- set һ��ֻ��Ϊһ��������ֵ���� select ��Ϊ���
--		- ���ʡ���Ӳ�ѯ��selectʹ��select���Եõ����һ��������ģ���Ϊԭ���ǲ�һ�θ�ֵһ��
--		- ��������Ӳ�ѯ��select�����ţ�ȥ��ѯһ�������ڵļ�¼���õ�����һ�����ַ����������� NULL��
		--		���=���ұߵĲ�ѯû�з����κ�ֵ����ôselcet�ᱣ��ԭʼӵ�е�Ĭ��ֵ�������ʹ���Ӳ�ѯ��select�����ΪĬ��ֵ����)

-- ��ѯ���������ѧԺ��Ϣ
use CZSchool
declare @time datetime
select @time=(select BornDate from Student where StudentName='����')
set @time=(select BornDate from Student where StudentName='����')
select * from Student where @time>BornDate




-- set һ��ֻ��Ϊһ��������ֵ���� select ��Ϊ���
go 
declare @name nvarchar(10), @age int=20
--set @name='aa', @age=20		-- ERROR set һ��ֻ��Ϊһ��������ֵ
select @name='aa', @age=20


-- ���ʡ���Ӳ�ѯ��selectʹ��select���Եõ����һ��������ģ���Ϊԭ���ǲ�һ�θ�ֵһ��
go
declare @name nvarchar(10), @age int=20
--set @name=(select StudentName from Student)		�Ӳ�ѯ���ص�ֵ��ֹһ�������Ӳ�ѯ������ =��!=��<��<=��>��>= ֮�󣬻��Ӳ�ѯ�������ʽʱ����������ǲ�����ġ�
--select @name=(select StudentName from Student)		�Ӳ�ѯ���ص�ֵ��ֹһ�������Ӳ�ѯ������ =��!=��<��<=��>��>= ֮�󣬻��Ӳ�ѯ�������ʽʱ����������ǲ�����ġ�
select @name=StudentName from Student		-- ʡ�� select �����ţ��õ����һ��
print @name


--		- ��������Ӳ�ѯ��select�����ţ�ȥ��ѯһ�������ڵļ�¼���õ�����һ�����ַ����������� NULL��
		--		���=���ұߵĲ�ѯû�з����κ�ֵ����ôselcet�ᱣ��ԭʼӵ�е�Ĭ��ֵ�������ʹ���Ӳ�ѯ��select�����ΪĬ��ֵ����)
GO
declare @name nvarchar(10)='aaaaaaa'
set @name=(select StudentName from Student where StudentNo=100)
print @name		-- ���ַ���

GO
declare @name nvarchar(10)='aaaaaaa'
select @name=(select StudentName from Student where StudentNo=100)
print @name		-- ���ַ���

GO
declare @name nvarchar(10)='aaaaaaa'
select @name=StudentName from Student where StudentNo=100
print @name		-- Ĭ��ֵ aaaaaaa





go
-- ��ѯ���һ�� office ���Գɼ�����߷ֺ���ͷ�
declare @subjectName nvarchar(50)='office'		-- ��Ŀ����
declare @subjectID int							-- ��ĿID
declare @examTime datetime						-- ���һ�ο���ʱ��
set @subjectID=(select SubjectId from Subject where SubjectName=@subjectName)	-- ��ȡ��ĿID
select @examTime=max(ExamDate) from Result where SubjectId=@subjectID			-- ��ȡ���һ�ο�������
select MAX(StudentResult), MIN(StudentResult) from Result where SubjectId=@subjectID and ExamDate=@examTime





