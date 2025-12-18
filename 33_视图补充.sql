/*
1.普通视图：
    ①.简单视图：可以更新DML
    ②.复杂视图：distinct、rownum、group by、分组函数、聚合函数、集合操作
                无法更新DML语句（insert、update、delete）
    
2.表连接/关联查询的视图，属于简单 视图

*/

-- 案例：查询当前用户下的所有视图
SELECT view_name FROM user_views;

-- 删除表
DROP VIEW v_emp_de20 ;

-- 验证表连接/关联查询的视图，是简单还是复杂视图
CREATE OR REPLACE VIEW vv
AS
SELECT e.empno,e.ename,e.deptno,d.dname
FROM emp e JOIN  dept d ON e.deptno = d.deptno;



-- 查看视图
SELECT * FROM vv;

-- 更新数据
UPDATE vv SET ename = '张三' WHERE empno = 7369;
