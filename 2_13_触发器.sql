
语法：
CREATE [OR REPLACE] TRIGGER trigger_name
-- ① 触发时机 + 事件类型
{BEFORE | AFTER | INSTEAD OF} 
{INSERT | UPDATE [OF column_list] | DELETE}
[OR {INSERT | UPDATE [OF column_list] | DELETE}] ...
-- ② 绑定对象
ON {table_name | view_name | DATABASE | SCHEMA}
-- ③ 触发级别与条件（可选）
[REFERENCING OLD AS old_name NEW AS new_name]
[FOR EACH ROW]
[WHEN (condition)]
-- ④ 执行体
{DECLARE ... BEGIN ... EXCEPTION ... END;}
| CALL procedure_name
/


/*创建一个触发器，该触发器实现当部门表中的部门编号发生变化时，
员工表中的部门编号也作相应更改。
例如当部门表中部门编号20被更改为80，则通过触发器把员工表中的所有部门编号为20也相应更改为80。*/
CREATE OR REPLACE TRIGGER tri_upd_emp1           -- 触发器名称
AFTER UPDATE ON dd                               -- 触发器条件
FOR EACH ROW                                     -- 行级触发器（影响每一行）
    WHEN (new.deptno = 80)                       -- 触发器限制
DECLARE                                          -- 触发器变量部分
BEGIN                                             -- 触发器的主体
    UPDATE ee SET deptno = :new.deptno WHERE deptno = :old.deptno;
END;

-- 验证触发器
UPDATE dd SET deptno = 60 WHERE deptno =20;

SELECT * FROM dd;

SELECT * FROM ee;

ROLLBACK;

DROP TABLE dd PURGE;
DROP TABLE ee PURGE;
CREATE TABLE dd AS SELECT * FROM dept;
CREATE TABLE ee AS SELECT * FROM emp;
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER tri_upd_emp2
AFTER UPDATE OF deptno,dname ON dept
FOR EACH ROW
    WHEN (new.deptno=80)
DECLARE
BEGIN
    UPDATE emp SET deptno = :new.deptno WHERE deptno = :old.deptno;
END;

-- 验证
UPDATE dept SET loc = 'sanli' WHERE deptno = 20;
