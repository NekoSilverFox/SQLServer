-- ��ʱ��
-- ��ʱ�������Ǵ��������ݿ��У���tempdbϵͳ���ݿ��е�`��ʱ��`��

-- �ֲ���ʱ��ֻ���ڴ�����ǰ�Ļػ���ʹ�ã������ǰ�ػ��رվͻ���ʧ��
CREATE TABLE #temp
(
	-- �ֶ��б�
	cid int,
	cname nvarchar(50)
)

-- Ҳ������ô������ʱ��
select * into #tempGrade from grade

select * from #tempGrade

-- ������ʱ�����ñ��
use CZSchool
select * into #tempGrade from grade
truncate table grade
insert into grade select classname from #tempGrade


--���ص㡿ȫ����ʱ��������رյ�ǰ�Ļػ��������ĻỰ��Ҳ����ʹ�ã������ǰ�ػ��ر�Ҳ����ʧ����
CREATE TABLE ##temp2
(
	-- �ֶ��б�
	cid int,
	cname nvarchar(50)
)

-- ������ʱ�����ñ��
insert into ##temp2 select * from grade
select * from ##temp2
truncate table grade
insert into grade select cname from ##temp2