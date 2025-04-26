﻿-- 1.  在emp表中查询出所有记录的姓名、部门编号、薪水，并且列名要显示为中文。
SELECT ename AS 姓名,deptno AS 部门编号, sal AS 薪水 FROM emp;

-- 2.  在emp表中查询出薪水大于1500的记录，并且按照薪水的降序排列。
SELECT sal FROM emp WHERE sal >1500 ORDER BY sal DESC;

-- 3.  在emp表中查询出comm字段为空值的记录。
SELECT * FROM emp WHERE comm IS NULL;

-- 4.  查询出emp表中含有几个部门的记录。（用DISTINCT去除重复记录）
SELECT DISTINCT deptno FROM emp;

-- 5.  在emp表中查询出部门编号为10或20的记录（请分别使用OR和IN关键字）
-- 方式1：or
SELECT * FROM emp WHERE deptno = 10 OR deptno = 20;
-- 方式2：in
SELECT * FROM emp WHERE deptno IN( 10 ,20);

-- 6.  在emp表中查询出姓名的第二个字母为A的记录。
-- 方式1：
SELECT * FROM emp WHERE SUBSTR(ename,2,1)='A';
-- 方式2：
SELECT * FROM emp WHERE ename LIKE '_A%';

-- 7.  查询emp表中1981年雇用的所有员工，或者是1987年5月雇用的员工。
SELECT * FROM EMP WHERE to_char(hiredate,'yyyy')='1981' OR to_char(hiredate,'yyyy-mm')='1987-05';

-- 8.  选择部门30的所有员工。
SELECT ename,deptno FROM emp WHERE deptno =30;

-- 9.  列出所有办事员（CLERK）的姓名，编号和部门编号。
SELECT ENAME,EMPNO,DEPTNO FROM emp WHERE job = 'CLERK'; 

-- 10.  找出佣金高于薪金的所有员工。
SELECT ENAME FROM EMP WHERE COMM > SAL;

-- 11.  找出佣金高于薪金30%的所有员工。
SELECT ENAME FROM EMP WHERE COMM > SAL * 0.3;

-- 12.  找出部门10中所有经理（MANAGER）和部门20中所有办事员（CLERK）的详细资料。
-- 方式1：
SELECT * FROM EMP WHERE (JOB ='MANAGER' AND DEPTNO =10) OR (JOB ='CLERK' AND DEPTNO =20);
-- 方式2：利用并集union 
SELECT * FROM EMP WHERE JOB ='MANAGER' AND DEPTNO = 10
UNION
SELECT * FROM EMP WHERE JOB ='CLERK' AND DEPTNO = 20;

-- 13.  找出部门10中所有经理（MANAGER），部门20 中所有办事员（CLERK）,既不是经理又不是办事员（CLERK）
--      但其薪金大于或等于2000的所有员工的详细资料。
-- 方式1：
SELECT * FROM EMP WHERE (JOB ='MANAGER' AND DEPTNO =10) OR (JOB ='CLERK' AND DEPTNO =20) 
       OR (JOB NOT IN ('MANAGER','CLERK') AND sal >= 2000);
-- 方式2：利用并集union
SELECT * FROM EMP WHERE JOB ='MANAGER' AND DEPTNO =10
UNION
SELECT * FROM EMP WHERE JOB ='CLERK' AND DEPTNO =20
UNION
SELECT * FROM EMP WHERE JOB NOT IN ('MANAGER','CLERK') AND sal >= 2000;

-- 14.  找出收取佣金的员工的不同的工作。
SELECT DISTINCT job FROM emp WHERE comm IS NOT NULL;

-- 15.  找出不收取佣金或收取佣金少于100的员工。
SELECT ename FROM emp WHERE comm < 100 OR comm IS NULL;

-- 16.  显示姓名不带有R的员工的姓名。
-- 方式1：
SELECT ename FROM emp WHERE REPLACE(ename,'R')<>ename;
-- 方式2：
SELECT ENAME FROM EMP WHERE ENAME NOT LIKE '%R%';

-- 17.  显示员工的详细资料，按姓名排序。
SELECT * FROM emp ORDER BY ename ASC;

-- 18.  显示员工的姓名和受雇日期，根据服务年限，将最老的员工排在最前面。
SELECT ENAME,HIRADATE FROM EMP ORDER BY HIREDATE;

-- 19.  显示所有员工的姓名，工作和薪金，按工作降序排序，若工作相同则按薪金排序。
SELECT ENAME,JOB,SAL FROM EMP ORDER BY JOB ASC,SAL;

-- 20.  显示姓名字段的任何位置包含A的所有员工的姓名。
-- 方式1：
SELECT ENAME FROM emp WHERE REPLACE(ENAME,'A')<>ename;
-- 方式2：
SELECT ENAME FROM EMP WHERE ENAME LIKE '%A%';

-- 21.  找出各月倒数第三天受雇的所有员工。
SELECT * FROM emp WHERE last_day(hiredate)-hiredate =2;

-- 22.  找出早于28年前受雇的所有员工。
SELECT ename FROM emp WHERE to_char(SYSDATE,'yyyy') - to_char(hiredate,'yyyy') >=28;

-- 23.  以首字大写的方式显示所有员工的姓名。
SELECT INITCAP(ename) FROM emp ;

-- 24.  显示员工姓名正好为5个字符的员工。
-- 方式1：
SELECT ename FROM emp WHERE LENGTH(ename)=5;
-- 方式2
SELECT ename FROM emp WHERE ename LIKE '_____';

