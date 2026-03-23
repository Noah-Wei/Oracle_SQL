/*
1.序列：sequence，数据库对象；每次使用序列属性，产生相应的有序数字编号

2.序列作用：目的是为了表的主键字段产生唯一与非空的序列编号

3.序列语法：
    CERATE SEQUENCE 序列名称 【参数类型 参数值。。。】;
    
4.序列属性：
    序列.currval：当前序号值
    序列.nextval：下一个序号值，可以为表的主键字段值
    参数： 
    maxvalue 最大值
    minvalue 最小值
    increment by 每次递增+n，默认每次加1
    start with  从第几开始计数
    cycle  循环执行，一直产生序列
    cache  缓存序列个数
5.序列注意事项：
①：默认序列，从1开始产生编号，递增加1
②：必须先NEXTVAL产生新值，CURRVAL才能获取当前值
③：参数start with >= minvalue
④：为了多个客户端并发访问序列.nextval;提升获取序列编号执行效率，防止每次都要磁盘读取IO，所以内存都会体检预留一些序列号码，当使用者用的时候直接拿出来，默然缓存序列编号20个
    想制定任意个缓存的个数，必须使用cache参数   
⑤：参数 cache < cycle
*/
-- 案例1：创建序列，默认无参数形式
CREATE SEQUENCE my_seq;

-- 案例2：查询当前用户下所有的可用序列
SELECT SEQUENCE_NAME FROM USER_SEQUENCES;

-- 案例3：产生默认形式序列当前值与下一个值
SELECT my_seq.nextval  FROM dual;
SELECT my_seq.currval 当前值,my_seq.nextval 下一值 FROM dual;

-- 案例4：删除序列
DROP SEQUENCE MY_SEQ;

-- 案例5：创建测试表，为表中主键字段增加序列编号
CREATE TABLE student(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL,
    age NUMBER(5),
    gender VARCHAR2(10) DEFAULT '男'
);
-- 查询表
SELECT  * FROM student;
-- 插入数据
INSERT INTO student VALUES(my_seq.nextval,'张三',24,'男');
INSERT INTO student VALUES(my_seq.nextval,'李四',24,'女');
INSERT INTO student VALUES(my_seq.nextval,'王五',33,'男');
INSERT INTO student VALUES(my_seq.nextval,'赵六',17,'女');
INSERT INTO student VALUES(my_seq.nextval,'冯奇',34,'男');
INSERT INTO student VALUES(my_seq.nextval,'艾玛',24,'女');

-- 案例6：带参数的序列
CREATE SEQUENCE seq_test MAXVALUE 10;
-- 查看序列
SELECT seq_test.nextval FROM dual;
-- 删除序列
DROP SEQUENCE seq_test;

-- 案例6：带参数的序列2
CREATE SEQUENCE seq_test MAXVALUE 10 MINVALUE 3;
-- 查看序列
SELECT seq_test.currval FROM dual;
SELECT seq_test.nextval FROM dual;
-- 删除序列
DROP SEQUENCE seq_test;

-- 案例6：带参数的序列3
CREATE SEQUENCE seq_test 
MAXVALUE 10 
MINVALUE 3 
INCREMENT BY 3;
-- 查看序列
SELECT seq_test.nextval FROM dual;
-- 删除序列
DROP SEQUENCE seq_test;

-- 案例6：带参数的序列4
CREATE SEQUENCE seq_test 
MAXVALUE 10 
MINVALUE 3 
INCREMENT BY 3
START WITH 4;
-- 查看序列
SELECT seq_test.nextval FROM dual;
-- 删除序列
DROP SEQUENCE seq_test;

-- 案例6：带参数的序列5
CREATE SEQUENCE seq_test 
MAXVALUE 100 
MINVALUE 3 
INCREMENT BY 3
START WITH 3
CYCLE
CACHE 10 ;
-- 查看序列
SELECT seq_test.nextval FROM dual;
-- 删除序列
DROP SEQUENCE seq_test;
