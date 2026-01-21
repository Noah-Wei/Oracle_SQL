/*
1.视图：数据库对象
    封装/存储一张表或者多张表的连接、子查询、分组、集合操作符等等的操作集合
    本身是虚拟的表
2.视图特点：本身是虚拟的表，并不占用内存空间去存储数据
     视图查询的所有数据都来自于基表
3.基表：视图内查询结果集合的哪些原始的表
4.视图能不能更新数据
    复杂视图：distinct、分组函数、group by、rownum、表连接，无法DML（insert、update、delete）更新
    简单视图：可以 更新数据
5.视图作用：简化查询，屏蔽基表数据，防止任意的穿该，安全
*/
-- 当前用户下面所有可用的表
SELECT TABLE_NAME FROM USER_TABLES;

-- 第一个创建视图，需要授权(必须是sysdba身份登陆)
GRANT CREATE VIEW TO SCOTT;
-- view 称之为视图
CREATE OR REPLACE VIEW V_EMP AS 
    SELECT * FROM STU;

-- 查看视图
SELECT * FROM V_EMP;

-- 测试更改基表数据，视图数据也会随之更新
INSERT INTO STU VALUES (99, '22', 22);
-- 删除基表，视图不存在
DROP TABLE STU;
-- 基表创建回来，视图能够重新使用,结构得保值一致
CREATE TABLE STU(ID NUMBER, NAME VARCHAR2(20));
INSERT INTO STU VALUES (1, 'sss');

-- 删除视图
DROP VIEW V_EMP;

-- where条件视图
CREATE OR REPLACE VIEW V_EMP_DE20 AS
    SELECT ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO = 20;
    
-- 查看视图
SELECT * FROM V_EMP_DE20;


-- 
CREATE OR REPLACE VIEW vv
AS
SELECT e.empno,e.ename,e.deptno,d.dname FROM emp e JOIN dept d ON e.deptno=d.deptno WHERE d.deptno IN(20,30);

-- 查看表
SELECT * FROM vv;

-- 删除视图
DROP VIEW vv;

-- 视图能不能更新数据
-- 复杂视图：distinct、分组函数、group by、rownum、表连接，无法DML（insert、update、delete）更新
-- 简单视图：可以 更新数据
INSERT INTO vv VALUES(9999,'张三',20,'测试部');


-- 分组视图
CREATE OR REPLACE VIEW v_x
AS
SELECT deptno,COUNT(1) c FROM dept GROUP BY deptno;
-- 查看视图
SELECT * FROM v_x;
-- 修改视图
UPDATE v_x SET c=2 WHERE deptno= 20;

-- 简单视图
CREATE OR REPLACE VIEW v3 AS SELECT * FROM emp;

SELECT * FROM v3;

SELECT * FROM emp;

UPDATE v3 SET deptno=30 WHERE empno=7369;


-- 视图作用：简化查询，屏蔽基表数据，防止任意的穿该，安全
