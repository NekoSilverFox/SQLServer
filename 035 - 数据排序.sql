-- 格式：select 字段列表 from 表列表 where 条件 order by (排序字段列表)对结果集进行记录重排
-- 排序不会修改结果集的数据，只是对结果集数据的重排
-- 【desc】降序，【asc】代表升序
select * from Student where sex='女' order by BornDate desc, StudentNo asc