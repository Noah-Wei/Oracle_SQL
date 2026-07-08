-- 创建测试表
CREATE TABLE t_emp (
    empno   NUMBER,
    ename   VARCHAR2(20),
    deptno  NUMBER,
    sal     NUMBER
);

-- 插入数据（故意制造重复）
INSERT INTO t_emp VALUES (1001, 'ALICE',  10, 3000);
INSERT INTO t_emp VALUES (1002, 'BOB',    20, 4000);
INSERT INTO t_emp VALUES (1001, 'ALICE',  10, 3000);  -- 与第1行完全重复
INSERT INTO t_emp VALUES (1003, 'CHARLIE',10, 5000);
INSERT INTO t_emp VALUES (1002, 'BOB',    20, 4500);  -- empno+ename重复，sal不同
INSERT INTO t_emp VALUES (1001, 'ALICE',  10, 3000);  -- 再次与第1行完全重复

COMMIT;

-- 查看原始数据（6行）
SELECT ROWID, e.* FROM t_emp e ORDER BY empno;

-- 先预览将被删除的行
SELECT * FROM t_emp e
WHERE ROWID > (
    SELECT MIN(ROWID) FROM t_emp
    WHERE empno = e.empno AND ename = e.ename
);


-- 执行删除
DELETE FROM t_emp e
WHERE ROWID > (
    SELECT MIN(ROWID) FROM t_emp
    WHERE empno = e.empno AND ename = e.ename
);

COMMIT;

-- 验证结果（应剩3行）
SELECT * FROM t_emp ORDER BY empno;

DROP TABLE t_emp PURGE;
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
SELECT empno, ename, deptno, sal
FROM (
    SELECT e.*,
           ROW_NUMBER() OVER (PARTITION BY empno, ename ORDER BY sal DESC) AS rn
    FROM t_emp e
)
WHERE rn = 1;
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
DELETE FROM t_emp
WHERE ROWID IN (
    SELECT rid FROM (
        SELECT ROWID AS rid,
               ROW_NUMBER() OVER (PARTITION BY empno, ename ORDER BY sal DESC) AS rn
        FROM t_emp
    )
    WHERE rn > 1
);

COMMIT;

-- 验证
SELECT * FROM t_emp ORDER BY empno;


DELETE FROM t_emp
WHERE ROWID IN(
      SELECT rid FROM (
          SELECT ROWID AS rid,row_number() OVER (PARTITION BY empno,ename ORDER BY sal) AS rn
          FROM t_emp)
      WHERE rn >1
)
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
CREATE TABLE tt
AS
SELECT empno,ename,deptno,sal FROM (
    SELECT t_emp.*,
           row_number() OVER (PARTITION BY empno,ename ORDER BY sal) AS rn
    FROM t_emp) t
WHERE t.rn =1;
       
TRUNCATE  TABLE t_emp;

SELECT * FROM t_emp;

INSERT INTO t_emp
SELECT * FROM tt;
