-- 1.关联更新
-- 案例1：
CREATE TABLE myemp AS SELECT * FROM emp WHERE deptno = 30;


CREATE TABLE mydept AS SELECT * FROM dept;

-- 查询表
SELECT * FROM myemp;

SELECT * FROM mydept;

-- 更新
UPDATE myemp e SET
    (deptno,ename) = (SELECT d.deptno,'张三' FROM mydept d WHERE d.deptno = e.deptno)
    WHERE EXISTS(
        SELECT 1 FROM mydept d WHERE d.deptno = e.deptno
    );
    
--
UPDATE myemp e SET
    (deptno,ename) = (SELECT d.deptno,'张三' FROM mydept d WHERE d.deptno = e.deptno)
;

-- 回滚
ROLLBACK;

-- 
INSERT INTO myemp(sal,eNAME) VALUES(3000,'李四');

INSERT INTO mydept(dname) VALUES('北京');


-- in的方式
UPDATE myemp e SET
    (deptno,ename) = (SELECT d.deptno,'张三' FROM mydept d WHERE d.deptno = e.deptno)
    WHERE deptno IN(
        SELECT d.deptno FROM mydept d WHERE d.deptno = e.deptno
    );
    
    
-- 练习：
-- 创建表
CREATE TABLE student(
    ID NUMBER,
    NAME VARCHAR2(15),
    gender VARCHAR2(3)
);
-- 学生表数据
INSERT ALL 
    into student VALUES(1,'张三','男')
    into student VALUES(2,'李四','女')
    into student VALUES(3,'王五','男')
    into student VALUES(4,'赵六','男')
    into student VALUES(5,'琪琪','女')
    SELECT 1 FROM dual;

CREATE TABLE boy(
    ID NUMBER,
    NAME VARCHAR2(15)
);

INSERT ALL
    INTO boy VALUES(1,'zhangsan')
    INTO boy VALUES(3,'wangwu')
    SELECT 1 FROM dual;

-- 要求：关联更新实现，boy表的英文名字去更新student表的中文名字
-- 查询表
SELECT * FROM student;

SELECT * FROM boy;

-- 更新表
UPDATE STUDENT S
SET    S.NAME =
       (SELECT B.NAME FROM BOY B WHERE S.ID = B.ID)
WHERE EXISTS(
        SELECT 1 FROM  BOY B WHERE S.ID = B.ID
);
