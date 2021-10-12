-- 类型转换函数 --
print 1 + 'a'
print '我的分数是：' + 100

-- cast(原值 as 目标类型)
print '我的分数是：' + cast(100 as char(3))

-- convert(目标类型, 源数据, [格式]) <--格式是相对于【日期值】而言
print '我的分数是：' + convert(char(3), 100)

print '我的生日是：' + convert(char(20), getdate(), 101)