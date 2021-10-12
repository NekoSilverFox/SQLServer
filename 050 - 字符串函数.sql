-- 字符串函数
-- charindex --indexof：查询指定字符在源字符串中出现的起始位置，位置从1开始计算，如果找不到就返回0
-- 参数1：需要查询的字符串	参数2：源字符串	参数3：指定查询的起始位置
select CHARINDEX('冰糖', '一只神奇的冰糖雪狸', 4)

-- Len（） 得到指定字符串长度
select LEN('一只神奇的冰糖雪狸')

-- upper() 全部转大写
-- lower() 全部转小写
select upper('лллииисссааа')

-- Ltrim() 去除左空格
-- Rtrim() 去除右空格
select LTRIM('         一只神奇的冰糖雪狸          ') + '123'
select rtrim('         一只神奇的冰糖雪狸          ') + '123'
select ltrim(RTRIM('         一只神奇的冰糖雪狸          ')) + '123'

-- right() 可以从指定的字符串右边开始返回指定数目的字符串。数量可以指定任意正值，但不能是负值
select RIGHT('一只神奇的冰糖雪狸', 4)
select LEFT('一只神奇的冰糖雪狸', 2)

-- substring('字符串', n, m) 从索引n开始，匹配m个字符
select SUBSTRING('一只神奇的冰糖雪狸', CHARINDEX('神奇', '一只神奇的冰糖雪狸'), 5)


-- replace() 替换
select REPLACE('一只神奇的冰糖雪狸', '冰糖雪狸', 'silverfox')

-- stuff('源字符串', 起始位置n, m个字符, '替换为我')  
select STUFF('一只神奇的冰糖雪狸', 3, 2, 'Magical')
