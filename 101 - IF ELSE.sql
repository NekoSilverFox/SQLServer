-- if else
--û�� boll ֵ��ֻ���������ʽ
--û�� {}�� ֻ�� BEGIN END
--���Զ��أ�����Ƕ��
--������������ֻ��һ������ôҲ���Բ�ʹ�� BEGIN END
--IF ELSE �� �����д�����䣬���û�оͱ���
IF 1=1
	print '1'
	print '2'

IF 1=2
	print '1'
	print '2'

IF 1=1
begin
	print '1'
	print '2'
end 


-- ����office��ƽ���ֲ���������ƽ���ֳ���60������ɼ���ߵ�����ѧ���ĳɼ������������������ѧ��
DECLARE @subjectName nvarchar(50)='office'		-- ��Ŀ����
DECLARE @subjectID int=(SELECT SubjectId FROM Subject WHERE SubjectName=@subjectName)	-- ��ĿID
DECLARE @avgSubMark int
SET @avgSubMark=(SELECT AVG(StudentResult) FROM Result WHERE SubjectId=@subjectID AND StudentResult IS NOT NULL)
PRINT @avgSubMark	

IF (@avgSubMark >= 60)
	BEGIN
		PRINT '���Ĳ���������'
		SELECT TOP 3 * FROM Result WHERE SubjectId=@subjectID ORDER BY StudentResult DESC
	END
ELSE
	BEGIN
		PRINT '����ɶ�������'
		SELECT TOP 3 * FROM Result WHERE SubjectId=@subjectID ORDER BY StudentResult
	END