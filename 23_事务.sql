-- 1.savepoint：事务保存点，一般结合rollback使用
/*
    savapoint  保存点名1
    DML语句。。。。。
    savapoint  保存点名2
    DML语句。。。。。
    savapoint  保存点名3
    DML语句。。。。。
    
    
    rollback to 保存点名N
*/

-- 案例
SELECT * FROM myemp;

SAVEPOINT s1;
INSERT INTO myemp SELECT * FROM emp;
SAVEPOINT s2;
UPDATE myemp SET deptno = 50;
SAVEPOINT s3;
DELETE FROM myemp WHERE sal >2000;

SELECT * FROM myemp;

TRUNCATE TABLE myemp;
