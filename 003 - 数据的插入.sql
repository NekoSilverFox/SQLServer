-- ���ݲ���
-- �﷨��������C�еķ������ã�˳������������һһ��Ӧ

-- insert [into] ����(�ֶ��б�) values(ֵ�б�)
-- ˵������ʶ��ֵ����ʲôʱ�򶼲��ܲ���ֵ��ͬʱ�����ֵ��Ҫ����������������Լ��

-- 1. Ϊ����ֶβ���ֵ�������ָ���ֶ��б���ô��Ĭ��ҪΪ�����ֶβ���ֵ
use TestSchool
insert into Teacher values('Tom1', 1, 1, 20, 5000, '1999-8-9')

-- 2. ֵ����Υ�����Լ��
insert into Teacher values('Tom2', 1, 1, 200, 5000, '1999-8-9')	-- ERROR��INSERT ����� CHECK Լ��"CK_Teacher_Age"��ͻ

-- 3. Ҳ����ָֻ��Ϊ��Щ�в���ֵ
insert into Teacher(Name, Gender, Class, Birthday) values('Tom3', 0, 2, '2021-2-1')

-- 4. �ǿ��ֶ�һ��Ҫ����ֵ����������Ĭ��ֵ
insert into Teacher(Name, Class) values('Tom4', 4)				-- ���Կ��� not null �� Birthday ���Զ���Ϊ��Ĭ��ֵ

-- 5. ���һ���ֶο���Ϊ null ����Ĭ��ֵ����ô�ڲ����ʱ��Ҳ���ԣ�Ϊ���ֶθ�ֵ null��Ĭ��ֵ�ֶθ�ֵ default
insert into Teacher values('Tom5', null, null, null, null, default)

-- 6. ���е�ֵ������ʹ�� '������' ����������ֶ����������֣���ôϵͳ���Զ�����ʽ����ת��
insert into Teacher values('Tom6', '1', '1', '69', '6666', '1999-8-9')

-- 7. ����ַ����͵��ֶ�û��ʹ�� '������' ��������ô������Ƿ��ַ���ERROR��������ô����֣�OK��
insert into Teacher values(7, '3', '0', '77', '6777', '1999-8-9')

-- 8. �������ֵû��ʹ�� '������' ��������ô�ͻ�õ�ϵͳĬ������
insert into Teacher values(8, '3', '0', '77', '6777', 1999-8-9)	-- Birthday �����ó���ϵͳĬ��ֵ��1905-06-06��