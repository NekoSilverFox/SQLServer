-- 存储过程

-- 创建说明：
GO
create procedure usp_存储过程名称
(形参)	可以在这里定义参数
as <-- 相当于 方法体
	自定义逻辑变量
	逻辑语句
GO


-- 1. 查询所有的学员信息
if exists(select * from sysobjects where name='usp_getAllStuInfo')
	drop proc usp_getAllStuInfo
GO
CREATE procedure usp_getAllStuInfo
as
	SELECT * FROM Student
GO

-- 调用存储过程
exec usp_getAllStuInfo




-- 2. 查询指定性别的学员信息
if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@sex char(2)		--【重点】形参只是声明，不是定义，所以不需要 declare
as
	SELECT * FROM Student WHERE Sex=@sex
GO
-- 调用存储过程
EXEC usp_getAllStuInfoBySex '男'




-- 3. 查询指定性别和班级的学员信息
if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@sex char(2),		--【重点】形参只是声明，不是定义，所以不需要 declare
	@className nvarchar(50)
as
	declare @classid int -- 科目ID
	set @classid=(select classid from grade where classname=@className)
	select * from Student where sex=@sex and ClassId=@classid
GO
-- 调用存储过程
EXEC usp_getAllStuInfoBySex '男', '二期班'



--4. 创建带有默认值的存储过程
 if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@sex char(2)='男',		--【重点】使用默认值，如果不传递就使用默认值
	@className nvarchar(50)
as
	declare @classid int -- 科目ID
	set @classid=(select classid from grade where classname=@className)
	select * from Student where sex=@sex and ClassId=@classid
GO
-- 【重点】参数传递顺序要一至！第一个实参默认就是传递给第一个形参。。以此类推
EXEC usp_getAllStuInfoBySex default, '二期班'	-- 如果有默认值，那么使用default默认值



-- 5. 创建带有默认值的存储过程【重点】
-- 方法二：将有默认值的参数写在参数列表最后
 if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@className nvarchar(50),
	@sex char(2)='男'		--【重点】使用默认值，如果不传递就使用默认值
as
	declare @classid int -- 科目ID
	set @classid=(select classid from grade where classname=@className)
	select * from Student where sex=@sex and ClassId=@classid
GO
-- 【重点】参数传递顺序要一至！第一个实参默认就是传递给第一个形参。。以此类推
EXEC usp_getAllStuInfoBySex '二期班'	-- 将有默认值的参数写在参数列表最后，就可以这样直接调用


-- 6. 创建带有默认值的存储过程【重点】
-- 方法三
 if exists(select * from sysobjects where name='usp_getAllStuInfoBySex')
	drop proc usp_getAllStuInfoBySex
GO
CREATE procedure usp_getAllStuInfoBySex
	@sex char(2)='男',		--【重点】使用默认值，如果不传递就使用默认值
	@className nvarchar(50)
as
	declare @classid int -- 科目ID
	set @classid=(select classid from grade where classname=@className)
	select * from Student where sex=@sex and ClassId=@classid
GO
EXEC usp_getAllStuInfoBySex @className='二期班'	-- 用指定参数的方式调用
-- 但是这种方法有个缺点，如果使用多个参数，后续的都要指定参数名！！
EXEC usp_getAllStuInfoBySex @className='二期班', '女'  ERROR 必须传递参数 2，并以 '@name = value' 的形式传递后续的参数。一旦使用了 '@name = value' 形式之后，所有后续的参数就必须以 '@name = value' 的形式传递。
EXEC usp_getAllStuInfoBySex @className='二期班', @sex='女'