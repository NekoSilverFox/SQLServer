-- JOIN ������

-- ��ѯ����ѧ�������������估���ڰ༶
USE CZSchool
SELECT Student.StudentName, Student.BornDate, GRADE.classname
	FROM Student, grade
	WHERE Student.ClassId=grade.ClassId



-- ���ӣ��ڡ����ҡ����桢ȫ����
-- JOIN ��Ҫ���ӵı� ...ON ����һ���ֶ�����ӹ����������������й�����
-- ��INNER JOIN�������ӣ�	�������������ֶ�ֵ��ȵļ�¼
-- ��LEFT JOIN�� �����ӣ�
SELECT Student.StudentName, Student.BornDate, GRADE.classname
	FROM Student
	INNER JOIN grade -- ���û����� INNER �ؼ��֣�Ĭ����������
	ON grade.ClassId=Student.ClassId


USE CZSchool
SELECT * FROM PHONE