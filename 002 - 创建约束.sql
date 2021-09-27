-------------------- 使用代码创建主键约束 --------------------
-- 约束种类：主键约束（PK-Primary Key）、唯一键约束（UQ-Unique）
-- 检查约束（CK-Check）、默认值约束（DF-Default）、外键约束（FK-Foreign Key）



-- 创建约束的语法
-- Alter table 表名
-- Add constraint 以简写为前缀的约束名称 约束类型 约束说明(字段 或 表达式 或 值)


-- 1. 将 ID 设置为主键
Alter table Teacher
Add constraint PK_Teacher_ID primary key(ID)


-- 2. 设置 name 为唯一键
if exists(select * from sysobjects where name='UQ_Teacher_Name')
	Alter table teacher Drop constraint UQ_Teacher_Name
Alter table Teacher
Add constraint UQ_Teacher_Name unique(Name)


-- 3. 设置年龄为 0~100 之间
Alter table Teacher
Add constraint CK_Teacher_Age check(Age>0 and Age <=100)


-- 4. 为 birthday 添加默认约束值
Alter table Teacher
Add constraint DF_Teacher_Birthday default('1990-1-1') for Birthday		-- for 是说明为哪一个字段添加默认值


-- 5. 为 class 添加外键约束
Alter table Teacher			-- 从表的某一个字段		引用			主表的某一个字段
with nocheck				-- 不检查现有数据
Add constraint FK_Teacher_Class foreign key(Class) references class(IdClass)
on delete set null