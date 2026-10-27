-- 分析函数
-- OLAP系统，对实时响应要求不高，以查询、统计操作为主
-- 案例
-- 查询出员工的姓名、工资、所在部门的平均工资，要求显示出来的是工资大于部门平均工资的员工
-- 传统写法
WITH avg_sal AS
(
SELECT AVG(sal) AS dept_sal,deptno FROM emp GROUP BY deptno
)
SELECT ename,sal,dept_sal,emp.deptno FROM emp LEFT JOIN avg_sal ON emp.deptno = avg_sal.deptno
WHERE sal > dept_sal
;

-- 部门平均工资
SELECT AVG(sal) AS dept_sal,deptno FROM emp GROUP BY deptno;

--分析函数处理写法
-- over（）分析函数中的窗口函数|开窗函数
SELECT * FROM (
SELECT ename,sal,deptno,AVG(sal) OVER(PARTITION BY deptno) avg_sal FROM emp) t1
WHERE t1.sal > t1.avg_sal

;

-- 案例2
-- 窗口函数，sum(sal)，按照同一部门分区，然后当前行数据滚动累加
SELECT ename,deptno,sal,SUM(sal) OVER(PARTITION BY deptno ORDER BY sal) FROM emp;
-- 窗口函数，sum(sal) 从第一行加到行尾，总累加结果
SELECT ename,deptno,sal,SUM(sal) OVER(PARTITION BY deptno ORDER BY sal ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) FROM emp;

-- 窗口函数，sum(sal),over()中不包含分组关键字，默认从第一行加到行尾，总累加结果
SELECT ename,deptno,sal,SUM(sal) OVER(PARTITION BY deptno ) FROM emp;

-- 案例3
-- 求工资与奖金之和占本部门每月所有员工工资与奖金之和的20%以上的员工,并且显示出所占的比例
SELECT t1.*,
t1.dept_sal*0.2 AS "20%dept_sal",
ROUND(t1.money/t1.dept_sal * 100,2)||'%' AS "百分比"
FROM
(
SELECT ename,deptno,(sal+NVL(comm,0)) money,SUM(sal+NVL(COMM,0)) OVER(PARTITION BY deptno)  dept_sal FROM emp
) t1
WHERE t1.money > t1.dept_sal * 0.2
;
