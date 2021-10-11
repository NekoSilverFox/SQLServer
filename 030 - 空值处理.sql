-- 查询没有电子邮箱的学员信息
select * from Student where Email is null

update Student set Email=null where StudentNo=9

select * from Student where Email is not null

-- 【ISNULL】ISNULL如果发现对应值是NULL值，则以指定文本进行替换【只是做一个结果集的替换，并没有修改源数据】
select StudentNo, StudentName, ISNULL(Email, '没有填写') from Student