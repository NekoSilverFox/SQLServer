-- 100 - CASE�÷�

-- 1. ��������������ֶΡ�ֵ���滻
-- 2. ��������
-- 3. �൱�� switch...case �� if..else



-- ��1��ʹ�õķ�����
-- CASE ���ʽ/�ֶ�
-- WHEN ֵ THEN �Զ���ֵ
-- ....
-- ELSE �������� WHEN ������������� ELSE
-- END

use CZSchool
select StudentNo, Studentname, Sex, ClassId from Student

-- ��� CASE ����ӱ��ʽ�����ֶΣ���ô���ֽṹ��ֻ������ֵ�жϡ�
select StudentNo, Studentname, Sex,
		CASE ClassId
			WHEN 1 THEN 'һ��'
			WHEN 2 THEN '����'
			WHEN 3 THEN '����'
			ELSE '�Ҳ�����'
		END AS '�༶����'
	FROM Student


-- ��2��ʹ�õķ�����
-- CASE ��� CASE ����û�нӱ��ʽ����ֵ����ô�൱��IF ELSE��ֻ���������жϿ�ֵ
-- WHEN ֵ THEN �Զ���ֵ
-- ....
-- ELSE �������� WHEN ������������� ELSE
-- END

SELECT StudentNo, StudentName,
		CASE  -- ���������ƥ��
			WHEN BornDate > '2000-1-1' then 'С��̫'
			WHEN BornDate > '1990-1-1' then 'С����'
			WHEN BornDate > '1980-1-1' THEN '����'
			WHEN BornDate IS NULL THEN '�ǿ�ֵ������'
			-- WHEN Sex='��' then '�����е�'
			ELSE '������'
		END AS '��������'
	FROM Student
