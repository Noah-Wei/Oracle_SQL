-- 1.主键约束:primary key
-- 创建表
CREATE TABLE Person(
--    pid VARCHAR2(18) PRIMARY KEY,  -- 方式1
    pid VARCHAR2(18),
    NAME VARCHAR2(30),
    age NUMBER(3),
    birthdate DATE,
    sex VARCHAR2(6) DEFAULT '男',
    
    CONSTRAINT person_pid_pk PRIMARY KEY(pid) -- 方式2
);

-- 查看表
SELECT * FROM Person;

-- 重命名表
RENAME  Person TO aa;

-- 删除表
DROP TABLE Person;



-- 测试约束规范
-- INSERT INTO person(pid) VALUES(NULL);
-- INSERT INTO person(pid) VALUES('');
INSERT INTO person(pid) VALUES('001');
INSERT INTO person(pid) VALUES('001');


-- 添加约束
ALTER TABLE Person ADD CONSTRAINT person_age_UNIQUE  UNIQUE (age);


-- 2.查看表的字段约束信息
SELECT * FROM user_cons_columns WHERE table_name = 'PERSON';

-- 3.非空约束:not null
-- 创建表
-- 方式一
CREATE TABLE Person(
    pid VARCHAR2(18),
    NAME VARCHAR2(30) NOT NULL, -- 方式1
    age NUMBER(3),
    birthdate DATE,
    sex VARCHAR2(6) DEFAULT '男'
);
-- 方式二
ALTER TABLE Person MODIFY  (NAME NOT NULL);

-- 删除表
DROP TABLE person;


-- 4.唯一约束 unique：
-- 创建表
-- 方式一
CREATE TABLE Person(
    pid VARCHAR2(18) NOT NULL UNIQUE,
    NAME VARCHAR2(30) , 
    age NUMBER(3),
    birthdate DATE,
    sex VARCHAR2(6) DEFAULT '男'
);

-- 查看表的字段约束信息
SELECT * FROM user_cons_columns WHERE table_name = 'PERSON';

-- 删除表
DROP TABLE person;
