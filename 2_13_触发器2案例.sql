-- 实战1:
-- 创建触发器，使得当部门被修改，对修改前的部门数据做备份，备份时要记录操作类型，和操作时间
-- 创建表
CREATE TABLE dept_bak AS SELECT * FROM dept WHERE 1= 2;
ALTER TABLE dept_bak ADD(
      bak_type VARCHAR2(100),
      bak_time TIMESTAMP
);



SELECT * FROM dept_bak;


-- 创建触发器
CREATE OR REPLACE TRIGGER BE_DEPT
    BEFORE UPDATE OR DELETE OR INSERT ON DEPT
    FOR EACH ROW
DECLARE

BEGIN
    INSERT INTO DEPT_BAK
        (DEPTNO, DNAME, LOC, BAK_TYPE, BAK_TIME)
    VALUES
        (:OLD.DEPTNO, :OLD.DNAME, :OLD.LOC, 'UPDATE', SYSTIMESTAMP);
END;

-- 验证触发器
UPDATE dept SET dname = '张三' WHERE deptno = 10;

ROLLBACK;

SELECT * FROM dept;






