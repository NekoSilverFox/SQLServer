# SQLServer

## SQL Server 主要特性

- SQL Server 是一个**关系型数据库管理系统**
- 高性能设计，可充分利用 WindowsNT 的优势
- 系统管理先进，支持 Windows 图形化管理工具，支持本地和远程的系统管理和配置
- 强壮的事务处理功能，采用各种方法保证数据的完整性（事务：完成一个操作，所需要的完整步骤。比如 A 向 B 转账 1000人民币，操作是：A 扣除1000，B再增加1000.但如果A处理的时候宕机了，强壮的事务处理功能会回滚）
- 支持对称多处理器结构、存储过程、ODBC，并具有自主的 SQL 语言。SQLServer 以其内置的数据赋值功能、强大的管理工具、与 Internet 的紧密集成和开放的系统结构为广大的用户、开发人员和系统集成商提供了一个出众的数据库管理平台

## 语言运用

SQL语句可以用来执行各种各样的操作，例如更新数据库中的数据，从数据库中提取数据等。目前，绝大多数流行的关系型数据库管理系统，如 Oracle，Sybase，Microsoft SQL Server，Access 等都采用了 SQL 语言标准。虽然很多数据库都对SQL语句进行了再开发和扩展，但是包括 Select、Insert、Update、Delete、Create，以及 Drop 在内的标准的 SQL 命令仍然可以被用来完成几乎所有的数据库操作

## SLQ 语句入门

```sql
-- 在 SQL 中没有双引号 `" "`，所有的字符都使用单引号 `' '` 包含
print '1'						-- 输出：1
select 1						-- 

-- 任何类型的值都可以使用【单引号】包含
-- 首先 `+` 是一个算数运算符，只有 `+` 两边都是字符串时 `+` 才是一个连接符
-- 如果有一边是数值类型，那么系统就会做隐式类型转换，将可以转为数字的字符转数字，如果转不了就报错
print '1' + '2'					-- 输出：12
print 0 + '1' + '2'				-- 输出：3
print '2' + 3					-- 输出：5
print 'a' + 1					-- 报错，因为 `a` 转换不成字符（不会转为10，因为这里没有ASCII的概念）

-- 不区分大小写
print 'aaa'						-- 输出：aaa
pRint 'aaa'						-- 输出：aaa
Select * from Admin where name='a'-- 会把表中name为 a 和 A 的都一起输出

-- 没有 `==`，赋值和逻辑相等都是使用 `=`
if (1 = 1)
	print 'yes!'				-- 输出：yes!
```

- SQL 主要分 DDL、DML、DCL
  - DDL：数据定义语言，包括建表、建库等语句。
    - Create Table、Drop Table、Alter Table
  - DML：数据库操作语言。
    - Select、Insert、Update、Delete
  - DCL：数据库控制语言
    - Grant 授权、Revoke 取消授权



## 数据库的创建

创建模板：

```SQL
create database 数据库名称
on primary			-- 在哪个文件组上创建。默认在主文件组上创建（创建为主数据文件）并且 primary 可省略
(
-- 【逗号问题】什么时候末尾加逗号：当它不是一句可以单独执行的SQL命令 或 是一个结构中的某一句时
    name='逻辑名称_data',	-- 逻辑名称一般会有一个后缀，数据文件是`data`、日志文件是`log`
    filename='全路径',		-- 最后一句不加逗号；扩展名：`.mdf`
    size=初始大小,			-- 数值不应该包含在 '单引号' 之内
    maxsize=最大容量,
    fileGrowth=增长方式	-- 也不应该包含在 '单引号' 之内
)

log on
(
    name='逻辑名称_log',	-- 逻辑名称一般会有一个后缀，数据文件是`data`、日志文件是`log`
    filename='全路径',		-- 最后一句不加逗号；扩展名：`.ldf`
    size=初始大小,			-- 数值不应该包含在 '单引号' 之内
    maxsize=最大容量,
    fileGrowth=增长方式		-- 也不应该包含在 '单引号' 之内
)
```

代码示例：

```sql
-- 先切换当前数据库
use master

-------------------------------------------------------------------------
-- 先判断数据库是否存在，如果存在就先删除
if exists(select * from sysdatabases where name='TestSchool')	-- 【exists()】就是判断括号中的语句是否返回值，如果有值就返回 true，没值就是 false
DROP database TestSchool

-------------------------------------------------------------------------
go	-- 批处理级数的标记，表示上面的已经做完了

-------------------------------------------------------------------------
-- 自动创建文件夹											-- 【提权语句】sp_configure 显示或更改当前服务器的全局配置设置，执行成功返回0，失败返回1
execute sp_configure 'show advanced options',1			--  先开启外围应用配置管理器；1 代表开启；0 代表关闭
Reconfigure												--  RECONFIGURE使前面的配置生效
execute sp_configure 'xp_cmdshell',1
Reconfigure
execute xp_cmdshell 'mkdir D:\SQLServer\DataBase'		-- 调用存储过程 xp_cmdshell，让其帮我们创建一个文件夹 

-------------------------------------------------------------------------
-- 创建数据库 TestSchool
create database TestSchool
on primary
(
	name='TestSchool_data',
	filename='D:\SQLServer\db001_TestSchool\TestSchool_data.mdf',
	size=3mb,
	filegrowth=1mb,
	maxsize=100mb
),														-- 如果同时创建多个数据库，括号后面加逗号、
filegroup userDataBase									-- 【可选】选择文件组
(
	name='TestSchool2_data',
	filename='D:\SQLServer\db001_TestSchool\TestSchool2_data.ndf',		-- 【.ndf】次数据文件
	size=1mb,
	filegrowth=1mb,
	maxsize=10mb
)
log on
(
	name='TestSchool_log',
	filename='D:\SQLServer\db001_TestSchool\TestSchool_data.log',
	size=1mb,
	filegrowth=1%
	-- maxsize=100mb 日志一般不限制最大容量
),														-- 日志文件也可以有多个
(
	name='TestSchool2_log',
	filename='D:\SQLServer\db001_TestSchool\TestSchool_data2.log',
	size=1mb,
	filegrowth=1%
	-- maxsize=100mb 日志一般不限制最大容量
)

```

## 创建数据表

模板：

```SQL
Create Table 表名
(
	字段名称 字段类型 字段属性(是否为空 标识列 默认值 主键 唯一键 check约束),
    字段名称 字段类型 字段属性(是否为空 标识列 默认值 主键 唯一键 check约束),
    字段名称 字段类型 字段属性(是否为空 标识列 默认值 主键 唯一键 check约束),
)
```

代码示例：

```sql
-------------------------------------------------------------------------
-- 创建数据表（Teacher）ID Name Gender Age Salary Birthday
use TestSchool											-- 首先要指明所属的数据库
if exists(select * from sysobjects where name='Teacher') -- 查询表要用 sysobjects 关键字
	Drop table Teacher
go
create table Teacher
(
	ID int identity(1,1) primary key,					--【设置标识列】identity(标识种子,标识增量)，标识列就是用来做主键的！
	Name nvarchar(50) not null,								--【not null】标记字段不能为空，char类型没指定长度默认为 1 ！
	Gender bit not null,
	Age smallint check(age>=0 and age<=100) not null,	--【check】设置check约束
	Salary money,										-- 当一个字段可以为null时，可以写 null，也可以不写
	Birthday datetime not null default('2000-1-1')		--【default()】默认值
)

```



## 数据完整性

- **实体完整性**：表的每一行数据就称为一个实体，实体完整性是指每一行的记录是唯一的，不重复的
  - **标识列**：系统自动生成，永远不会重复
  - **主键**：唯一 非空，并且一个表的主键只有一个（但可以有复合主键）
  - **唯一键**：可以有多个唯一键，但是每类唯一键的内容不能重复，唯一键可以为null，只能空一次（设置：右键一个键 --> 索引/键 --> 添加 --> 修改名称为UQ_开头 (unique) --> 修改类型为唯一键(Unique Key) --> 确定哪个字段为唯一列 Columns那里）

- **域完整性**：域就是指字段，域完整性就是为了保证字段的值是合理且准确的
  - 非空、类型、check约束、默认值、关系（主外键约束）
- 【重点】**引用完整性**：一个表的某个字段的值引用自另外一个表的某一个字段。**被引用的表**就称为**主表**，引用别的表的那个表*（**引用表**）*就是***从表***或者外键表（FK - Foreign Key）
  - 选择外键表去创建主外键关系
  - 建立主外键关系的字段类型和意义必须一致！！！
  - **主表中所被对应的字段必须是唯一的！！**（主键或者唯一键）
  - 添加数据的时候，**先**添加**主表**的数据，***再***添加***外键表***
  - 删除数据的时候，*先*删除*外键表*的数据，**再**删除**主表**的数据

---

**关系建立的表的级联操作：**

- **不执行任何操作**：该报错就报错，能删除就删除
- **级联**：删除主表记录，对应的从表记录也将被删除
- **set null**：删除主表，从表中对应记录的字段值=null。前提是这个字段可以设置为null，不然会报错
- **set default**：删除主表，从表对应记录的字段值=设置的默认值。前提是这个字段已经设置了默认值

## Transact-SQL 修改

- 数据库名称修改

  ```sql
  ALTER(改变) database testdb01
  MODIFY(修改) name=testdb02;
  ```

  

- 对数据库**文件属性**修改

  ```sql
  ALTER database testbd
  MODIFY FILE(
  	name=testdt,
  	size=20MB,
      maxsize=80MB,
      filegrowth=10MB
  );
  ```

  

- 数据库查看的帮助（不属于修改）

  借助这个命令可以查看是否修改成功

  ```sql
  EXEC SP_HELPDB TESTDB;
  ```

  

## Transact-SQL 删除

```sql
DROP(删除) datebase sales, newsales;
```

## 各种char的对比

首先创建表 CharTest（下表）

| char(10) | varchar(10) | nchar(10) | nvchar(10) |
| -------- | ----------- | --------- | ---------- |
| aa       | aa          | aa        | aa         |

借助指令查看大小及长度

```sql
-- 这是一行注释，以“--”开头
-- Len(参数) 可以查看字符串的字符数量
-- DataLength() 计算指定参数的所占据的字节长度。英文1字节，中文2字节

-- char 每个字符占1字节，当储存的字符数量小于指定的容量时，容量【不会】收缩；大于指定容量时会报错（截断二进制数据）
select Len(char) from chatTest			-- 输出：2
select DataLength(char) from charTest	-- 输出：10

-- varchar 每个字符占1字节，“var”代表可变的，说明分配的容量是一个可以动态变化的空间。当存储的字符数小于分配的容量时，多余的容量会自动回收；大会指定的容量还是会报错
select Len(varchar) from chatTest			-- 输出：2
select DataLength(varchar) from charTest	-- 输出：2

-- nchar 每个字符占【2】字节，因为其保存的是Unicode，其开头的n也代表了Unicode；容量不会自动收缩；大于会报错
select Len(varchar) from chatTest			-- 输出：2
select DataLength(varchar) from charTest	-- 输出：【20】

-- nvarchar 
select Len(nvarchar) from chatTest			-- 输出：2
select DataLength(nvarchar) from charTest	-- 输出：【4】收缩了，且一个字符2字节
```







