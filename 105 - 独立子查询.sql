-- �Ӳ�ѯ��
--		��һ����ѯ�а�����һ����ѯ���������Ĳ�ѯ�ͱ���Ϊ�Ӳ�ѯ�������Ӳ�ѯ�Ĳ�ѯ�ͱ���Ϊ����ѯ

-- ��ѯ�ȷ볿��������ѧԱ��Ϣ
USE CZSchool
SELECT BornDate FROM Student WHERE StudentName='�볿��'
SELECT * FROM Student WHERE BORNDATE < (SELECT BornDate FROM Student WHERE StudentName='�볿��')

-- ��ѯ���ڰ��ѧԱ��Ϣ
SELECT * FROM STUDENT WHERE ClassId=
	(
		SELECT ClassId FROM grade WHERE classname='���ڰ�'
	)