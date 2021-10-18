-- ���ں���

-- getdate() ��ȡ��ǰϵͳ����
select GETDATE()

-- dateadd() ��ָ��������ֵ������ָ��������ֵ
select DATEADD(mm, 3, GETDATE())
select DATEADD(dd, 40, GETDATE())
select DATEADD(mm, -5, GETDATE()) -- ������֮ǰ����һ��

-- datediff() ��ȡ����ָ������֮�������ֵ
select StudentName, DATEDIFF(yyyy, BornDate, GETDATE()) from student
-- ��ѯ������ 14~29 ֮�������
select StudentName, Phone, Address from Student where DATEDIFF(yyyy, BornDate, GETDATE()) between 14 and 29 and sex='��'
select DATEDIFF(mm, '2019-9-1', GETDATE())

-- datename() �������ڵġ��ַ�����
select DATENAME(yyyy, getdate())
select DATENAME(ww, getdate())	-- �����ǽ���ĵڼ���
select DATENAME(WEEKDAY, GETDATE())	-- ���������ڼ�

-- datepart() �õ�����ָ������
select DATEPART(yyyy, GETDATE())