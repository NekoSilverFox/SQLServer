-- ���ݸ���
-- �﷨��
-- update ���� set �ֶ�=ֵ����ʽ, �ֶ�=ֵ����ʽ where ����(һ�����ܹ�����������������Ψһ������ʶ��)

-- �޸� Tom1 �İ༶Ϊ 3
-- update Teacher set Class=3 ע��һ��Ҫ�ӡ�where �������޶�����Ȼ��ѱ������е�ֵ�����ı䣡��
update Teacher set Class=3 where name='Tom1'

-- �޸� Tom6 ���Ա�ΪŮ������100����
update Teacher set Gender=0, Salary-=1000 where name='Tom6'

-- �����������ж϶����� not and or �Ա����� ͬʱ ��3��ģ����ʼ�666
update Teacher set Salary+=666 where Gender=1 and Class=3