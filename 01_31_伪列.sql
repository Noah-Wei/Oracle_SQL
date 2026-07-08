SELECT ROWNUM, EMPNO, ENAME FROM EMP;

SELECT * FROM EMP;
-- 1.伪列：ROWNUM，表的数据逻辑行号
-- 案例：查询员工表前五行数据
SELECT * FROM EMP WHERE ROWNUM < 6;

/*
    2.ROWNUM原理：每次先从第一行开始计数为1，假如条件满足查询到第一行数据，继续查询第二行数据，计数为2；依次内推。。。
                    直到条件不满足，查询结束；
                    如果条件不满足查询到第一行数据，继续计数为1，再匹配条件查询，后续行不满足条件，一直计数为当前行号，所以无结果
*/

-- 案例：查询员工表10行之后的数据
SELECT * FROM (SELECT ROWNUM AS RID, EMP.* FROM EMP) WHERE RID > 10;

SELECT ROWNUM, EMP.*
FROM   EMP
MINUS
SELECT ROWNUM, EMP.*
FROM   EMP
WHERE  ROWNUM <= 10;

-- 
SELECT * FROM EMP WHERE ROWNUM <> 0; -- 全部数据
SELECT * FROM EMP WHERE ROWNUM = 1; -- 1行数据

SELECT * FROM EMP WHERE ROWNUM > 1; -- 无数据

SELECT * FROM EMP WHERE ROWNUM < 3; -- 2行数据

SELECT * FROM EMP WHERE ROWNUM = 2; -- 无数据

-- 案例：查询员工表最后3行数据
SELECT ROWNUM, EMP.*
FROM   EMP
MINUS
SELECT ROWNUM, EMP.*
FROM   EMP
WHERE  ROWNUM <= (SELECT COUNT(1) FROM EMP) - 3;

-- 方式2
SELECT *
FROM   (SELECT ROWNUM RN, EMP.* FROM EMP)
WHERE  RN > (SELECT COUNT(1) - 3 FROM EMP);

-- 案例：查询第6行到第10行之间的数据
SELECT *
FROM   (SELECT ROWNUM RN,
               EMPNO,
               ENAME,
               JOB,
               MGR,
               HIREDATE,
               SAL,
               COMM,
               DEPTNO
        FROM   EMP)
WHERE  RN BETWEEN 6 AND 10;

SELECT * FROM EMP;

-- 思考题：查询员工表工资排名6到10的员工
SELECT *
FROM   (SELECT ROWNUM RN,
               EMPNO,
               ENAME,
               JOB,
               MGR,
               HIREDATE,
               SAL,
               COMM,
               DEPTNO
        FROM   (SELECT * FROM EMP ORDER BY SAL DESC))
WHERE  RN BETWEEN 6 AND 10;
