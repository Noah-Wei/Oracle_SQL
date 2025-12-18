-- 2.主外键约束：FOREIGN KEY
-- 注意：【父表】：主键的一方
--      【子表】：引用父表主键的而作为外键一方
-- CHAR1：普通外键约束
-- 1 对 N 的关系
/*
    实体：理解为现实世界存在的事务个体，对应数据库即是表
    属性：实体对象中包含不同的属性，对应数据库中表的字段/列
    数据库设计：ER图
*/
-- 创建表：PERSON表 父表
CREATE TABLE PERSON(
    PID VARCHAR2(18) ,
    NAME VARCHAR2(30) NOT NULL, 
    AGE NUMBER(3) NOT NULL ,
    BIRTHDATE DATE,
    SEX VARCHAR2(6) DEFAULT '男' CHECK(SEX IN('男','女')),
    
    CONSTRAINT PERSON_ID_PK PRIMARY KEY(PID),
    CONSTRAINT PERSON_NAME_UNIQUE UNIQUE(NAME),
    CONSTRAINT PERSON_AGE_CK CHECK(AGE BETWEEN 1 AND 150)
);

-- 查看表的约束
SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'PERSON';

-- 创建表：BOOK表 子表
CREATE TABLE BOOK(BID VARCHAR2(10),
                  BNAME VARCHAR2(30) NOT NULL,
                  BPRICE NUMBER(5, 2),
                  
                  -- 方式一
                  -- PID VARCHAR2(10) REFERENCES PERSON(PID)
                  
                  -- 方式二
                  -- PID VARCHAR2(10),
                  -- CONSTRAINT fk_person_book_pid FOREIGN KEY(pid) REFERENCES person(pid)
                  
                  -- 方式三
                  PID VARCHAR2(10));

-- 方式三
ALTER TABLE BOOK ADD CONSTRAINT FK_PERSON_BOOK_PID FOREIGN KEY(PID) REFERENCES PERSON(PID);

-- 查看表的约束
SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME = 'BOOK';

-- 添加数据
INSERT INTO PERSON VALUES (1, '张三', 22, SYSDATE, '男');
INSERT INTO PERSON VALUES (2, '李四', 20, SYSDATE, '女');
INSERT INTO PERSON VALUES (3, '王五', 25, SYSDATE, '男');
INSERT INTO PERSON VALUES (4, '赵六', 35, SYSDATE, '女');

SELECT * FROM PERSON;

INSERT INTO BOOK VALUES ('001', '水浒传', 118, 3);
INSERT INTO BOOK VALUES ('002', '三国演义', 100, 1);
INSERT INTO BOOK VALUES ('003', '西游记', 18.8, 2);
INSERT INTO BOOK VALUES ('004', '红楼梦', 58, 3);

SELECT * FROM BOOK;
-- 提交事务
COMMIT;

SELECT P.NAME, P.SEX, B.BNAME
FROM   BOOK B
RIGHT  JOIN PERSON P ON B.PID = P.PID;

-- 注意：删除表顺序，先删除子表，才能删除父表
-- 删除表
DROP TABLE BOOK;

-- 删除表中的数据
DELETE FROM PERSON WHERE PID = 1;

-- 置空外接约束：外键设置的后面 + on delete set null
-- 父表删除数据对子表引用的外键列设置为空值。
-- 创建表：BOOK表 子表
CREATE TABLE BOOK(BID VARCHAR2(10),
                  BNAME VARCHAR2(30) NOT NULL,
                  BPRICE NUMBER(5, 2),
                  PID VARCHAR2(10),
                  CONSTRAINT FK_PERSON_BOOK_PID FOREIGN KEY(PID) REFERENCES PERSON(PID) ON DELETE SET NULL 
                  );

SELECT * FROM book;

DELETE FROM person WHERE pid = 3;
