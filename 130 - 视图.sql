-- ��ͼ
-- ��ͼ����һ������������û��Ĳ�ѯ���������ʹ����ͼ����ʹ�ñ�һ����
select * from ��ͼ

-- ʹ�ô��봴����ͼ��
CREATE VIEW vw_��ͼ����
AS
	����Ҫ��ѯ������
GO

use CZSchool
if exists(select * from sysobjects where name='vw_getStudentBySex')
	drop view vw_getStudentBySex
go
create view vw_getStudentBySex	-- ������������������������ĵ�һ�䣨GO ��ĵ�һ�䣩
as
	select * from Student where sex='��'
	-- select * from Student order by StudentNo	���ص㡿��ͼ�в���ʹ�� ORDER BY ������ʹ���� TOP�������� TOP 100 Percent ȡȫ����������������ʧЧ
	-- select * from grade	���ص㡿��ͼ��ֻ�ܴ���һ�� select ��ѯ
	-- update grade			���ص㡿��������ͼ������ʹ�� UPDATE DELETE �� INSERT
go


-- ʹ����ͼ
-- ����ͼ��һ�㡿����ȥִ��ɾ�����޸Ĳ���������һ��Ҫע����ǣ�
--	����ͼ����Щ������Ӱ�쵽ԭʼ�������
--	�������ͼ����ɾ�ģ�ȷ����Щ���������Ƕ�һ����ģ�����漰��������ӵ���ͼ����ʧ��
select * from vw_getStudentBySex
update vw_getStudentBySex set phone='123456789' where StudentNo=1 -- OK

select * from vw_getinfo
update vw_getinfo set phone='97685', classid=2 where StudentNo=1 -- ERROR