-- �ۺϺ���
-- MAX(���ֵ)��MIN(��Сֵ)��AVG(ƽ��ֵ)��SUM(��)��COUNT(��������¼������)
-- SUM��AVGֻ�ܲ�����ֵ���ͣ��������ڡ��ַ�����������ͻ�ƽ��ֵ��
-- ��Щ���������Զ�����null��


select MAX(BornDate) from Student			-- ��ѯ������С��ѧԱ
select MIN(BornDate) from Student			-- ��ѯ������С��ѧԱ

select MIN(StudentName) from Student		-- ������ַ����������ֵ��򣬵õ�������С
select MAX(StudentName) from Student

select SUM(StudentResult) from Result where StudentNo=10	-- ��ѯѧ����10ѧ�����ܷ�
select AVG(StudentResult) from Result where StudentNo=10	-- ��ѯѧ����10ѧ�����ܷ�

select SUM(StudentResult) from Result where StudentNo=10	-- ��ѯѧ����10ѧ�����ܷ�
select AVG(StudentResult) from Result where StudentNo=10	-- ��ѯѧ����10ѧ�����ܷ�

-- COUNT �õ����������ļ�¼�������Զ�����null
select COUNT(StudentName) from Student		-- ѧ��������

