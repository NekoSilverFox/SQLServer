-- 数据插入
-- 语法：类似于C中的方法调用，顺序、数量和类型一一对应

-- insert [into] 表名(字段列表) values(值列表)
-- 说明：标识列值不管什么时候都不能插入值，同时插入的值与要满足表的所有完整性约束

-- 1. 为表的字段插入值，如果不指定字段列表，那么就默认要为所有字段插入值
use TestSchool
insert into Teacher values('Tom1', 1, 1, 20, 5000, '1999-8-9')

-- 2. 值不能违反表的约束
insert into Teacher values('Tom2', 1, 1, 200, 5000, '1999-8-9')	-- ERROR：INSERT 语句与 CHECK 约束"CK_Teacher_Age"冲突

-- 3. 也可以只指定为那些列插入值
insert into Teacher(Name, Gender, Class, Birthday) values('Tom3', 0, 2, '2021-2-1')

-- 4. 非空字段一定要插入值，除非他有默认值
insert into Teacher(Name, Class) values('Tom4', 4)				-- 可以看到 not null 的 Birthday 被自动设为了默认值

-- 5. 如果一个字段可以为 null 或有默认值，那么在插入的时候也可以：为空字段赋值 null，默认值字段赋值 default
insert into Teacher values('Tom5', null, null, null, null, default)

-- 6. 所有的值都可以使用 '单引号' 包含：如果字段类型是数字，那么系统会自动做隐式类型转换
insert into Teacher values('Tom6', '1', '1', '69', '6666', '1999-8-9')

-- 7. 如果字符类型的字段没有使用 '单引号' 包含，那么：如果是非字符（ERROR），如果用纯数字（OK）
insert into Teacher values(7, '3', '0', '77', '6777', '1999-8-9')

-- 8. 如果日期值没有使用 '单引号' 包含，那么就会得到系统默认日期
insert into Teacher values(8, '3', '0', '77', '6777', 1999-8-9)	-- Birthday 被设置成了系统默认值（1905-06-06）