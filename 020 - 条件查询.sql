-- ��where���������Ĳ�ѯ
select * from Student where Sex='Ů'



-- ��ѯ������ 15-20֮���Ů��
select * from Student where Sex='Ů' and BornDate>'1995-1-1' and BornDate<'1999-1-1'

-- ��between ... and ...�����ڵ���ǰ���ֵ��С�ڵ��ں���
select * from Student where Sex='Ů' and BornDate between'1995-1-1' and '1999-1-1'



-- ��ѯ1~4���ѧԱ��Ϣ
select * from Student where ClassID=1 or ClassID=2 or ClassID= 3 or ClassID=4

--��in������ָ��һ������ķ�Χ��������ȡ���������ֵ
select * from Student where ClassId in (1,2,3,4)