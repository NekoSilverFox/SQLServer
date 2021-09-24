# SQLServer

## SQL Server 主要特性

- SQL Server 是一个**关系型数据库管理系统**
- 高性能设计，可充分利用 WindowsNT 的优势
- 系统管理先进，支持 Windows 图形化管理工具，支持本地和远程的系统管理和配置
- 强壮的事务处理功能，采用各种方法保证数据的完整性（事务：完成一个操作，所需要的完整步骤。比如 A 向 B 转账 1000人民币，操作是：A 扣除1000，B再增加1000.但如果A处理的时候宕机了，强壮的事务处理功能会回滚）
- 支持对称多处理器结构、存储过程、ODBC，并具有自主的 SQL 语言。SQLServer 以其内置的数据赋值功能、强大的管理工具、与 Internet 的紧密集成和开放的系统结构为广大的用户、开发人员和系统集成商提供了一个出众的数据库管理平台

## 语言运用

SQL语句可以用来执行各种各样的操作，例如更新数据库中的数据，从数据库中提取数据等。目前，绝大多数流行的关系型数据库管理系统，如 Oracle，Sybase，Microsoft SQL Server，Access 等都采用了 SQL 语言标准。虽然很多数据库都对SQL语句进行了再开发和扩展，但是包括 Select、Insert、Update、Delete、Create，以及 Drop 在内的标准的 SQL 命令仍然可以被用来完成几乎所有的数据库操作

## 数据库的创建

使用脚本：

```sql
create database test01
on primary (
name='test',
filename='D:\SQLServer\02 - 脚本创建测试\test.mdf',
size=5MB,   // 初始值大小
maxsize=10MB,
filegrowth=5MB
)

log on (
name='test01_log',
filename='D:\SQLServer\02 - 脚本创建测试\test.ldf',
size=5MB,
maxsize=10MB,
filegrowth=5MB
)
```



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

-- 
select Len(nvarchar) from chatTest			-- 输出：2
select DataLength(nvarchar) from charTest	-- 输出：【4】收缩了，且一个字符2字节
```





