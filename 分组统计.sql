-- 数据分组-统计信息
select 字段列表 from 表列表 where 筛选条件 group by 分组字段列表 order by 排序字段列表

-- 查询男女生人数
select COUNT(*) from Student
select COUNT(*) from Student where sex='男'

select COUNT(*) from Student group by sex