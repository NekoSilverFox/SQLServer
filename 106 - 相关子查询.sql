-- ����Ӳ�ѯ���Ӳ�ѯ�������˸���ѯ�Ľ��
USE CZSchool
	SELECT * FROM Student WHERE StudentNo=
	( --												�� �� Result ��
		SELECT DISTINCT StudentNo FROM Result WHERE StudentNo=Student.StudentNo
	)

-- �Ӳ�ѯ��ʹ�ã�
-- 1. ��Ϊ����������ѯ��Ҫһ���ⲿ��ֵ��Ϊ������ʱ�򣬿���ʹ��һ�������Ĳ�ѯ�ȵõ����ֵ���ٽ����������ж�
-- ע�⣺
--		- ��=��ʹ���Ӳ�ѯ��Ϊ��������ʱ��ֻ�ܷ���һ���ֶε�ֵ����
SELECT * FROM Student WHERE BornDate < (SELECT * FROM Student WHERE StudentName='�볿��')	-- ERROR����û���� EXISTS �����Ӳ�ѯʱ����ѡ���б���ֻ��ָ��һ�����ʽ

--		- ��IN��ʹ���Ӳ�ѯ���ص�ֵ��ֹһ��ʱ���Ӳ�ѯ���ص�ֵ��ֹһ�������Ӳ�ѯ������ =��!=��<��<=��>��>= ֮�󣬻��Ӳ�ѯ�������ʽʱ����������ǲ�����ġ�
SELECT * FROM Student WHERE BornDate IN (SELECT BornDate FROM Student)

--		  ��EXISTS��������ض���ֵ��ֻ��ʹ�� EXISTS
IF EXISTS(SELECT * FROM SYSDATABASES)
	PRINT 'T'

-- 2. ��Ϊ���������һ��ҪΪ�Ӳ�ѯ��ȡ�Ľ������ӱ�������
-- ��ѯ���ڰ��������Ϣ
SELECT * FROM Student WHERE ClassId=6 AND Sex='��'
SELECT * FROM Student WHERE ClassId=6 
SELECT * FROM (SELECT * FROM Student WHERE ClassId=6) temp WHERE temp.Sex='��'

-- 3. ��Ϊ�е�ֵ
SELECT (SELECT StudentName FROM Student WHERE StudentNo=Result.StudentNo), StudentResult FROM Result

-- ʹ���Ӳ�ѯ��ҳ
SELECT TOP 5 * FROM Student
-- �ڶ�ҳ
SELECT TOP 5 * FROM Student WHERE StudentNo NOT IN (SELECT TOP 5 StudentNo FROM Student)

-- ʹ��ר�ŵķ�ҳ����
SELECT ROW_NUMBER() OVER(ORDER BY StudentNo), * FROM Student
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY StudentNo) SNO, * FROM Student) temp WHERE SNO > 0 AND  SNO < 5	-- ��һҳ
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY StudentNo) SNO, * FROM Student) temp WHERE SNO > 6 AND  SNO < 10	-- �ڶ�ҳ