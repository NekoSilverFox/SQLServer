-- ��ѯû�е��������ѧԱ��Ϣ
select * from Student where Email is null

update Student set Email=null where StudentNo=9

select * from Student where Email is not null

-- ��ISNULL��ISNULL������ֶ�Ӧֵ��NULLֵ������ָ���ı������滻��ֻ����һ����������滻����û���޸�Դ���ݡ�
select StudentNo, StudentName, ISNULL(Email, 'û����д') from Student