-- 替代触发器
CREATE OR REPLACE VIEW myview
AS
SELECT empno,ename,e.deptno,d.dname  FROM emp e LEFT JOIN dept d  ON  e.deptno = d.deptno;
--
SELECT * FROM myview;

--
CREATE OR REPLACE TRIGGER mytri
INSTEAD OF UPDATE ON  myview
FOR EACH ROW
DECLARE

BEGIN
    UPDATE emp SET deptno = :new.deptno WHERE deptno = :old.deptno;
    UPDATE dept SET deptno = :new.deptno WHERE deptno = :old.deptno;
END;


UPDATE dept SET deptno = 80 WHERE deptno = 10;

SELECT * FROM dept;

