-- �����ѯ��������
-- �﷨��
-- select �ֶ��б��* from ���б� where ����

-- ��ѯ������Ϣ
select * from Teacher

-- ��ѯָ����
select Id, Name, Salary, Class from Teacher

-- ָ����ѯ��������ѯŮ��ʦ
select * from Teacher where Gender=0 and Age<30

-- Ϊ��ָ�����ı�����ֻ�ı���������ʾ�������޸�ԭʼ�ı�ṹ
select Id as ����, Name ����, ����=Salary, ��˾='ѩ��' from Teacher where Gender=0 and age<50

-- Select ���������ֻ������������ԡ������ʽ����������
select 1+1, 2, 3, 4, 5