-- DML触发器
-- 语句级触发器
CREATE OR REPLACE TRIGGER tri_update_emp
AFTER UPDATE ON emp
DECLARE
BEGIN
    -- UPDATE emp SET sal = 9999 WHERE deptno = 10;
    dbms_output.put_line('emp表同步更新成功');
END;
-- 测试
UPDATE emp SET sal =  1000 WHERE deptno = 10;

ROLLBACK;

SELECT * FROM dept;
SELECT * FROM emp ORDER BY deptno;


-- 行级触发器
CREATE OR REPLACE TRIGGER tri_update_emp
AFTER UPDATE ON emp
FOR EACH ROW
DECLARE
BEGIN
    -- UPDATE emp SET sal = 9999 WHERE deptno = 10;
    dbms_output.put_line('emp表同步更新成功');
END;
 

ROLLBACK;

SELECT * FROM dept;
SELECT * FROM emp ORDER BY deptno;

