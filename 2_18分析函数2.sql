SELECT empno,ename,sal
FROM emp
ORDER BY sal DESC;

-- 案例1：注意这里有两条记录是一样的。假如我们现在需要筛选排名前三的,并列的话算1个
-- 如果使用rownum会出现什么样的后果呢？ 无法处理并列的数据
SELECT t1.* FROM (
SELECT empno,ename,sal
FROM emp
ORDER BY sal DESC) t1
WHERE ROWNUM <4
;
-- rank()
SELECT * FROM (
SELECT empno,ename,sal,RANK() OVER(ORDER BY sal DESC) ra
FROM emp)
WHERE ra <=3;
-- dense_rank()
SELECT * FROM (
SELECT empno,ename,sal,dense_RANK() OVER(ORDER BY sal DESC) ra
FROM emp)
WHERE ra <=3;
-- row_number()
SELECT * FROM (
SELECT empno,ename,sal,row_number() OVER(ORDER BY sal DESC) ra
FROM emp)
WHERE ra <=3;

-- 
SELECT 
      empno,ename,sal,
      row_number() OVER(ORDER BY sal DESC) rn,
      dense_RANK() OVER(ORDER BY sal DESC) dr,
      RANK() OVER(ORDER BY sal DESC) ra
FROM emp;


-- 案例2：带空值的排序问题
SELECT ename,empno,comm,dense_rank() OVER(ORDER BY comm  NULLS LAST) FROM emp;


-- 案例3：取出工资排名第一与最后一名的员工
SELECT * FROM (SELECT ename,sal FROM emp ORDER BY sal) t WHERE ROWNUM = 1
UNION
SELECT * FROM (SELECT ename,sal FROM emp ORDER BY sal DESC) t WHERE ROWNUM = 1;

SELECT MIN(ename) KEEP(dense_rank FIRST ORDER BY sal DESC ) AS 第一名,sal
FROM emp;
