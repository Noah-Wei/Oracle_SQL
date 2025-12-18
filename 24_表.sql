-- 1.表：table,数据库的对象，结构性（字段|列）

-- 2.字段的数据类型
-- 2.1 char、varchar、varchar2区别？（面试题重点）
        char：是固定字节长度，效率更高
        varchar：可变字节长度，标准编码
        VARCHAR2：Oracle独有的字段类型，也是可变字节，更节约空间。
        oracle10g往后，VARCHAR 会自动变成 varchar2。
        CHAR 和 VARCHAR2 涉及隐士转换，CHAR 中'a ' 和 'a' 一致， VARCHAR2 中两个不同;
-- 2.2 time 和 timestamp 区别


-- 3.创建表
CREATE TABLE myemp AS SELECT * FROM emp;
-- 复制表结构，不需要表内数据
CREATE TABLE myemp AS SELECT * FROM emp WHERE 1>2;
-- 查询表
SELECT * FROM myemp;

-- 删除表
DROP TABLE myemp;

-- 案例：个人信息表
-- 创建表
CREATE TABLE person(
    pid     VARCHAR2(18),
    NAME    VARCHAR2(30),
    age     NUMBER(3),
    birthdate   DATE,
    sex     VARCHAR2(6) DEFAULT '男'
);

-- 查询表
SELECT * FROM person;

-- 删除表
DROP TABLE person;

-- 往表中添加数据
INSERT INTO person(pid,NAME,age,birthdate) VALUES(1,'xx',18,SYSDATE);
INSERT INTO person(pid,NAME,age,birthdate) VALUES(2,'王小二',22,SYSDATE);

-- length函数：获取字符单位的长度
-- lengthb函数：获取字节单位的长度

-- 中文字符占用的字节数，在不同的编码环境中不同
--      BGK编码：一个中文2个字节
--      utf-8编码：一个中文3个字节
-- 获取字符单位的长度
SELECT NAME,LENGTH(NAME),LENGTHB(NAME) FROM person;

-- 提交事务
COMMIT;

-- 4.查询本地Oracle服务端的编码方式：
SELECT USERENV('language') FROM dual;

-- 验证某个字符串中是否包含中文字符
SELECT NAME,
       CASE
           WHEN LENGTH(NAME) = LENGTHB(NAME) THEN
            '不包含'
           ELSE
            '包含'
       END 是否有中文
FROM   PERSON;

-- 5.表与列|字段添加注释说明
-- 给表加注释
COMMENT ON TABLE person IS '个人信息表';
-- 查看表的注释
select * from user_tab_comments where table_name = 'PERSON';
-- 给字段加注释
COMMENT ON COLUMN person.pid IS '个人编号';
COMMENT ON COLUMN person.name IS '姓名';
COMMENT ON COLUMN person.age IS '年龄';
COMMENT ON COLUMN person.birthdate IS '生日';
COMMENT ON COLUMN person.sex IS '性别';
-- 查看字段注释
SELECT * FROM User_Col_Comments WHERE table_name = 'PERSON';
