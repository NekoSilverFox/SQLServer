-- ģ����ѯ
-- ��like '����'��ʹ��ģ����ѯƥ�䵥���������
-- ��not like '����'��ƥ����˵����������


-- ͨ�����
--��%��ƥ�������������ַ�
--��_��ƥ������һ���ַ�
--��[]������һ������ķ�Χ���ܹ�ƥ������һ���ַ�
--��^��ȡ��ֵ��ֻ����[]�в������壡

use CZSchool
-- ��ѯ�ա��֡���ͬѧ
-- ��=�������ϸ���ַ���ƥ�䣬����%ֻ��һ���ַ����ѣ��������ͨ�������ʹ�á�like��
select * from Student where StudentName='��%'
select * from Student where StudentName like '��%'
select * from Student where StudentName like '��__'

-- ��ѯ�������ա��֡���ͬѧ
select * from Student where StudentName not like '��%'

-- ��ѯѧ��Ϊ 11~15 ��ѧ��
select * from Student where StudentNo like '1[12345]'
select * from Student where StudentNo like '1[1-5]'
select * from Student where StudentNo like '[11-15]'	-- ��ERROR��ϵͳ��ʶ��Ϊ 1 1-1 5������ֻ�����ѧ��Ϊ1��5�ģ����������һ������������ֻ����0-9 a-z A-Z��
select * from Student where StudentNo like '1[^1-5]'	-- ���ѧ��Ϊ10��17~19��