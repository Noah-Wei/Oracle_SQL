SELECT COUNT(*) AS "人数",
       MAX(SAL) AS "最高工资",
       MIN(SAL) AS "最低工资",
       AVG(SAL) AS "平均工资",
       SUM(SAL) AS "总工资"
  FROM EMP;

SELECT * FROM EMP;

SELECT COUNT(1) AS "人数" FROM EMP;

-- 统计不同工作的员工
SELECT COUNT(DISTINCT JOB) FROM EMP;

-- 列函数：count(任何数字) 都是统计行数
-- sum(任何数字)每扫描表中的一行数据，累加一次 任何数字

--
SELECT COMM FROM EMP;
SELECT COUNT(COMM) FROM EMP;


-- count(1)不忽略空值，count(字段)会忽略空值
-- sum() 忽略空值
SELECT COUNT(COMM) AS "人数",
       SUM(COMM) AS "奖金总额",
       MAX(COMM) AS "最高奖金",
       MIN(COMM) AS "最低奖金",
       AVG(COMM) AS "平均奖金"
  FROM EMP;

-- 查询所有员工的年收入
SELECT SUM(sal+NVL(comm,0)) AS "所有员工年收入" FROM emp;
