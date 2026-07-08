--1.WITH短句的应用：
WITH 临时表1 AS
 (子查询),
临时表2 AS
 (子查询),
临时表3 AS
 (子查询),
.. .. 临时表N AS
 (子查询)

SELECT .. FROM 临时别名 .. .;

-- 案例1：
WITH MYEMP AS
 (SELECT EMPNO, ENAME, DEPTNO FROM EMP)
SELECT * FROM MYEMP;

-- 案例2：
WITH E AS
 (SELECT * FROM EMP WHERE DEPTNO = 10)
SELECT EMPNO, ENAME, DEPTNO FROM E;

-- 案例3：
WITH E AS
 (SELECT * FROM EMP WHERE DEPTNO = 20),
D AS
 (SELECT * FROM DEPT)
SELECT E.ENAME, D.DEPTNO, D.DNAME FROM E, D WHERE E.DEPTNO = D.DEPTNO;

-- 2.with短句好处
-- 一、子查询结果集都存于临时表（内存），一次执行可以多次引用临时表，效率高
-- 二、sql语句代码层次分明，可观赏性

-- 案例4：
WITH A AS
 (SELECT 123, 'zyx' FROM DUAL UNION ALL SELECT 456, 'mnq' FROM DUAL)
SELECT * FROM A
UNION ALL
SELECT 789,'sdad' FROM dual;
