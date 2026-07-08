/*
1.普通视图：
    ①.简单视图：单表、多表关联等
                可以DML更新
    ②.复杂视图：distinct、rownum、group by、分组函数、聚合函数、集合操作
                无法DML更新语句（insert、update、delete）
    ③.只读视图：视图子查询后面添加 with read only
                     无法DML更新语句（insert、update、delete），只能查
    ④.检查约束视图：视图子查询 + with check option
                   必须要满足视图子查询where条件，才可以DML更新
                   注意：视图子查询+ where，不然失去约束的意义
    
2.表连接/关联查询的视图，属于复杂 视图。能修改部分的视图，带着修改基表

3.视图优点：屏蔽基表的结构，数据安全（针对复杂视图）

4.内联视图：in-line view
*/
-- 查询当前用户下的所有表
SELECT * FROM USER_TABLES;
-- 删除表
DROP TABLE PERF_TEST;

-- 案例：查询当前用户下的所有视图
SELECT VIEW_NAME FROM USER_VIEWS;

-- 删除表
DROP VIEW V_EMP_DE20;

-- 验证表连接/关联查询的视图，是简单还是复杂视图
CREATE OR REPLACE VIEW MYVIEW AS
    SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
    FROM EMP E
    JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO;

-- 查看视图
SELECT * FROM MYVIEW;

-- 更新数据
UPDATE MYVIEW SET ENAME = '张三' WHERE EMPNO = 7369;

-- 查询原表（基表）
SELECT * FROM EMP;

ROLLBACK;

-- 验证2：只读视图
CREATE OR REPLACE VIEW MYVIEW AS
    SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
    FROM EMP E
    JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO WITH READ ONLY;

-- 验证更新数据
UPDATE MYVIEW SET ENAME = '张三1' WHERE EMPNO = 7369;

-- 检查约束视图
CREATE OR REPLACE VIEW MYVIEW AS
    SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE SAL > 2000
          AND DEPTNO = 20 WITH CHECK OPTION;

-- 查询视图
SELECT * FROM MYVIEW;

DELETE FROM MYVIEW WHERE EMPNO = '7499';

ROLLBACK;

INSERT INTO MYVIEW VALUES (1000, '张三', 999, 40);
SELECT * FROM EMP;

UPDATE MYVIEW SET SAL = 1500 WHERE EMPNO = 7902;

SELECT * FROM USER_TABLES;



