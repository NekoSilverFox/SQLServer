-- 事务
update bank set cmoney-=1000 where name='aa'
update bank set cmoney+=1000 where name='aa'
-- 上面这种情况要求我们需要使用某一种方式进行处理，这种方式就是事务
-- 事务：就是指这些语句要么都能成功执行，要么都不执行
-- 事务只是一种处理机制。
-- 事务是对有可能对表数据进行更改的操作而言--增加删除和修改。【对查询没用】
-- 事务的特点：CUID
-- 1.原子性：事务不可以再分，事务必须是原子工作单元；对于其数据修改，要么全都执行，要么全都不执行
-- 2.一致性：事务处理前后。，数据需要保持某种程度的一致
-- 3.隔离性：每一个事务是独立的，不受其它事务影响
-- 4.持久性：事务一旦提交，对数据的修改永久保留
-- 如何使用事务：将你执行的增加删除和修改命令包含在事务的【开启】和【提交】或者【开启】和【回滚】之间。

事务的开始：BEGIN transaction
事务的提交：commit transaction
事务的回滚：rollback transaction

-- 使用事务进行转账
declare @errorNum int=0		-- 记录执行语句过程中可能出现的错误号
BEGIN transaction
	update bank set cmoney-=1000 where name='aa'
	set @errorNum+=@@ERROR	-- 在可能出现错误的地方做错误号的记录
	-- if (@@ERROR <> 0)	-- 说明这一句出现错误, `<>` 是不等于的意思
		-- rollback transaction	-- 不可能某一句出现了错误就立马进行提交或者回滚！！
	update bank set cmoney+=1000 where name='aa'
	set @errorNum+=@@ERROR	-- 在可能出现错误的地方做错误号的记录
	if (@errorNum <> 0)	-- 整体执行完再进行判断有没有错误！
		rollback transaction
	else
		commit transaction
