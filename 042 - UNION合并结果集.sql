-- ����(union) �� ���ӣ�join)��һ��

use master
use CZSchool

-- ��ѯ��Ů��������
select '��������', COUNT(*) from Student where Sex='��'
select 'Ů������', COUNT(*) from Student where Sex='Ů'

-- union:���������϶���������
-- 1. Ҫ�����ϵĶ�����������ͬ�������ֶ�
-- 2. Ҫ�����ϵĶ���������Ӧ���е�������Ҫһ�£���ν������һ����ָ���ǿ��Ի���ת��
-- union Ĭ����ȥ���ظ��ģ�Ч�ʵͣ�����Ϊ��ҪΪ�����Ƿ��ظ����ж�
-- union all ���ǲ�ȥ���ظ�
select '��������', COUNT(*) from Student where Sex='��'
union
select 'Ů������', COUNT(*) from Student where Sex='Ů'

select '��������', COUNT(*) from Student where Sex='��'
union all
select '��������', COUNT(*) from Student where Sex='��'



-- ʹ��union��һ���Բ����������
-- union ���ǿ���ȥ���ظ���¼��ֻ�е�ȫ����ʹ�� union all �Ų������ظ�ֵ
insert into Admin
select 'fox', 'fox' union all
select 'fox', 'fox' union
select 'fox2', 'fox2'


-- select into from�����Խ� from ����Դ���� select ָ�����е����� into ���±��У��±���ϵͳ�Զ����ɵģ�������Ϊ�ȴ�����Ҳ����֮ǰ���ܴ���
select * into newtable from Student
delete from newtable

-- insert into �� selete from�����Խ�select��ѯ����л�ȡ������into��ָ����������Ҫ�ȴ��ڡ�
insert into newtable select Studentname,Loginpwd, sex, classid, phone, address, borndate, email, isDel from Student

