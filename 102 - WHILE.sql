-- WHILE
--����Ƕ��
--û�� {}��ʹ�� BEGIN END
--����ʹ�� true false��ֻ��ʹ���������ʽ
--�������ֻ��һ��Ϳ��Բ�ʹ�� BEGIN END ����
--����ʹ�� CONTIUNE/BREAKE 

-- ��� office ���������������һ�루��̫���ˣ����͸�ÿ�˼�2�֣�ѭ���ӣ�ֱ�������������С��������һ��
go
declare @subName nvarchar(50)='office'	-- ��Ŀ����
declare @subID int=(select SubjectId from Subject where SubjectName=@subName)	-- ��ĿID
declare @classid int =(select ClassId from Subject where SubjectName=@subName)	-- ��һ��Ŀ�����İ༶ID
declare @totalNum int	-- ��һ��Ŀ����������
set @totalNum=(select COUNT(*) from Student where ClassId=@classid)
declare @unpassNum int=(select COUNT(*) from Result where SubjectId=@subID and StudentResult<60)	-- δͨ��������
while(@unpassNum > @totalNum/2)
	begin
		update Result set StudentResult += 2 where SubjectId=@subID and StudentResult<98	-- ���ܳ��� 100�֣�Ϊ�˲�Υ��CHECKԼ��
		set @unpassNum=(select COUNT(*) from Result where SubjectId=@subID and StudentResult<60)	-- ���¼���δͨ��������
	
	end



-- �ڶ�������
go
declare @subName nvarchar(50)='office'	-- ��Ŀ����
declare @subID int=(select SubjectId from Subject where SubjectName=@subName)	-- ��ĿID
declare @classid int =(select ClassId from Subject where SubjectName=@subName)	-- ��һ��Ŀ�����İ༶ID
declare @totalNum int	-- ��һ��Ŀ����������
set @totalNum=(select COUNT(*) from Student where ClassId=@classid)
-- declare @unpassNum int=(select COUNT(*) from Result where SubjectId=@subID and StudentResult<60)	-- δͨ��������

while (1=1)
begin
	if((select COUNT(*) from Result where SubjectId=@subID and StudentResult<60) > @totalNum/2)
		update Result set StudentResult += 2 where SubjectId=@subID and StudentResult<98	-- ���ܳ��� 100�֣�Ϊ�˲�Υ��CHECKԼ��
	else
		break

end