-- ����Ӳ�ѯ���Ӳ�ѯ�������˸���ѯ�Ľ��
USE CZSchool
	SELECT * FROM Student WHERE StudentNo=
	(
		SELECT DISTINCT StudentNo FROM Result WHERE StudentNo=Student.StudentNo
	)