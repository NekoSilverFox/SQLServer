-- ���ݷ���-ͳ����Ϣ
select top/distinct �ֶ��б� from ���б� where Դ����ɸѡ���� group by �����ֶ��б� having �Է���֮��õ��Ľ������ɸѡ order by �����ֶ��б�

-- ��ѯ��Ů������
select COUNT(*) from Student
select COUNT(*) from Student where sex='��'

select COUNT(*) from Student group by sex
select sex,COUNT(*) from Student group by Sex

-- ��ѯÿһ���༶��������
-- ���ص㡿��ۺϺ���һ�������select����һ���ѯ���У�ֻ�����ֿ����ԣ����ۺ� ������
select Classid, COUNT(*) from student group by ClassId

-- ��ѯÿһ�������Ů��������
select classid, sex, COUNT(*) from student group by ClassId, sex order by ClassId, sex

-- ��ѯÿһ���༶��Ů����������ͬʱֻ��ʾ������������3�˵ļ�¼
--  5   7                                    1             2                       3                    4                    6
select top 2 ClassId, sex, COUNT(*) as cnt from student where email is not null group by ClassId, sex having count(*)>3 order by Classid

-- ��ѯÿ�������ѧʱ������������������
select classid, sum(classhour) as ��ѧʱ from subject group by classid order by sum(classhour)
-- ��ѯ�μӿ���ѧԱ��ƽ����
select studentno, AVG(studentResult) from result group by StudentNo
-- ��ѯÿ�ſγ̵�ƽ���֣������ս�������
select (select subjectname from subject where subject.SubjectId=Result.SubjectId) as ��Ŀ��
		, AVG(StudentResult) as ƽ���� from Result group by SubjectID order by SubjectID