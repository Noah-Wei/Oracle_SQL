-- 案例：多对多的关系
-- 1.实体 学生表 student
CREATE TABLE student(
    SID VARCHAR2(10) PRIMARY KEY,
    sname VARCHAR2(30) NOT NULL,
    age VARCHAR2(10),
    gender VARCHAR2(30)
);

-- 2.实体 课程表 course
CREATE TABLE course(
    cid VARCHAR2(20) PRIMARY KEY,
    sname VARCHAR2(20) NOT NULL
);

-- 3.利用中间表，将多对多关系两张表建立主外键
CREATE TABLE student_course(
    ID NUMBER(10) PRIMARY KEY,
    SID VARCHAR2(10) REFERENCES student(SID),
    cid VARCHAR(20) REFERENCES course(cid)
);
