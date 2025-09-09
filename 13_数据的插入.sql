-- 1. 创建副本表（备份表）
-- 创建 EMP 表的副表 my_emp
CREATE TABLE my_emp 
AS 
SELECT * FROM EMP;

-- 查询副表数据
SELECT * FROM MY_EMP;

-- 2. 插入数据（INSERT 操作）
-- 案例1：单行插入（指定 3 列）
INSERT INTO MY_EMP (EMPNO, ENAME, DEPTNO) 
VALUES (8001, '张三', 40);

-- 案例2：单行插入（所有字段）
INSERT INTO MY_EMP
    (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES
    (8002, '李四', '测试部', 8001, 
     TO_DATE('2021-07-01', 'YYYY-MM-DD'), 
     9000, 500, 20);

-- 案例3：单行插入（部分字段，含 NULL 值）
INSERT INTO MY_EMP
VALUES
    (8003, '王五', '公关部', 8001, 
     TO_DATE('2019-10-22', 'YYYY-MM-DD'), 
     1000, NULL, NULL);

-- 删除特定数据
DELETE FROM MY_EMP WHERE EMPNO = 8004;

-- 3. 批量插入数据（第一种方式）
-- 创建表 E（基于部门编号=10 的员工数据）
CREATE TABLE E AS
    SELECT 
        E.ENAME AS 员工姓名,
        E.SAL AS 员工工资,
        E.DEPTNO AS 部门编号,
        D.DNAME AS 部门名称
    FROM EMP E
    JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    WHERE E.DEPTNO = 10;

-- 查询表 E 的数据
SELECT * FROM E;

-- 批量插入案例1：插入所有员工数据（默认部门为"未知部门"）
INSERT INTO E
    SELECT ENAME, SAL, DEPTNO, '未知部门' FROM EMP;

-- 批量插入案例2：插入部门编号=20 的员工数据
INSERT INTO E
    SELECT ENAME, SAL, DEPTNO, '未知部门' FROM EMP 
    WHERE DEPTNO = 20;

-- 批量插入案例3：仅插入姓名和部门编号（其他字段为 NULL）
INSERT INTO E (员工姓名, 部门编号)
    SELECT ENAME, DEPTNO FROM EMP 
    WHERE DEPTNO = 20;

-- 批量插入案例4：显式指定 NULL 值
INSERT INTO E
    SELECT ENAME, NULL, DEPTNO, NULL FROM EMP 
    WHERE DEPTNO = 20;

-- 批量插入案例5：使用 WITH 子句插入自定义数据
INSERT INTO E (员工姓名, 部门编号)
WITH 
    V1 AS (SELECT '胡一刀' AS 姓名, 50 AS 编号 FROM DUAL),
    V2 AS (SELECT '苗人凤' AS 姓名, 60 AS 编号 FROM DUAL)
SELECT 姓名, 编号 FROM V1 
UNION ALL 
SELECT 姓名, 编号 FROM V2;

-- 4. 清理环境：删除表 E
DROP TABLE E;
