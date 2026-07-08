-- 1.delete删除数据，表结构在，数据被清理【可回滚】
-- 创建表
CREATE TABLE myemp AS SELECT * FROM emp;

-- 查询表
SELECT * FROM myemp;

-- 删除员工编号7896的数据
DELETE FROM myemp WHERE empno = 7369;

-- 删除表中的所有数据
DELETE FROM myemp;

-- 回滚数据
ROLLBACK;

-- 2.truncate 截断表【不可回滚】
TRUNCATE TABLE myemp;

INSERT INTO myemp SELECT * FROM emp;

MERGE INTO myemp USING emp ON (myemp.empno=emp.empno)
WHEN MATCHED THEN
       UPDATE SET myemp.comm=500
       WHEN NOT MATCHED THEN
           INSERT(empno,ename,job,mgr,hiredate,sal,comm,deptno) VALUES(emp.empno,emp.ename,emp.job,emp.mgr,emp.hiredate,emp.sal,emp.comm,emp.deptno);

-- 3.delete和truncate删除数据的区别
/*
    1.Truncate删除大量数据比较快
    2.Truncate数据不能回滚，但是delete能够回滚
*/

-- 4.事务提交：commit
--   事务回滚：rollback
-- 注意1：事务操作只对DML操作有效(insert,delete,update)
-- 注意2：数据一旦事务提交commit，则无法回滚
-- 注意3：客户端意外事务连接中断，在没有事务提交commit，则会自动事务回滚rollback
-- 注意4：客户端暂时断开连接exit|quit，再去连接客户端，会自动提交事务commit
-- 注意5：执行create、alter等语句，会自动提交事务commit

-- 事务提交与事务回滚的作用：
-- 1.commit，任何客服端看到的数据都是一致的
-- 2.rollback，回退到提交之前的所有原始数据状态
