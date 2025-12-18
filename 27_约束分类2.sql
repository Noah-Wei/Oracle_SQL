-- 1.检查约束(CHECK)
-- 创建表
CREATE TABLE Person(
    pid VARCHAR2(18) ,
    NAME VARCHAR2(30) NOT NULL, 
    age NUMBER(3) NOT NULL CHECK(age BETWEEN 1 AND 150),
    birthdate DATE,
    sex VARCHAR2(6) DEFAULT '男' CHECK(sex IN('男','女')),
    
    PRIMARY KEY(PID),
    UNIQUE(NAME)
);

-- 删除表
DROP TABLE person;

-- 检查表中的约束
SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'PERSON';

-- 插入数据
INSERT INTO PERSON
    (PID, NAME, AGE, BIRTHDATE, SEX)
VALUES
    (1, '张三', 45, TO_DATE('2021-05-06', 'YYYY-MM-DD'), '男');

INSERT INTO PERSON
    (PID, NAME, AGE, BIRTHDATE, SEX)
VALUES
    (2, '张三', 45, TO_DATE('2021-05-06', 'YYYY-MM-DD'), '中');
-- 查看表中数据
SELECT * FROM PERSON;


-- 2.主外键约束：foreign key
-- 注意：【父表】：主键的一方
--      【子表】：引用父表主键的而作为外键一方
-- 注意1：普通外键约束
-- 1 对 N 的案例
