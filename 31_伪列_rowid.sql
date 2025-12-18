SELECT * FROM USER_TABLES;

/*
1.ROWID 是表的伪列，它用于唯一表示表行
    并且间接给出了表行的物理地址，
    是定位表行最快的方式，使用insert语句插入数据时，
    oracle会自动生成rowid并将其值与表数据一起存放到表行中
*/
/*
2.sql语句解析结果：
        step1：内存中oracle的本地服务引擎，检查sql语法是否符合标准；
        step2：检查数据库对象（表）的本地磁盘位置（数据库安装目录\oradata\数据库实例文件夹\xxx.dbf），
        step3：检查噶数据文件对象(xxx.dbf)在本次磁盘中的编号
        step4：通知本地磁盘开始读取数据块（block）对象
        step5：获取磁盘中数据块的每一行记录
        step6：通过内存显示查询结果到控制台屏幕
*/
/*
3.简述rowid编码：
    由18个字符64位编码组成
    A~Z 0~25
    a~z 26~51
    0~9 52~61
    =   62
    /   63
    
    第一组：1-6个字符，表示数据库对象（表）编号
    第二组：7-9个字符，表示数据文件对象编号
    第三组：10-15个字符，表示数据块编号
    第四组：16-18个字符，表示当前行记录 
*/
SELECT ROWID, EMP.* FROM EMP;

SELECT ROWID, DNAME FROM DEPT;

INSERT INTO DEPT VALUES (50, '销售部', '北京市');

SELECT ROWID, DEPT.* FROM DEPT;

-- 面试题：如何去掉重复记录？
CREATE TABLE STU(ID NUMBER, NAME VARCHAR2(20) NOT NULL, AGE NUMBER);
INSERT INTO stu VALUES(1,'xx',18);
INSERT INTO stu VALUES(2,'zz',18);
INSERT INTO stu VALUES(1,'xx',18);
INSERT INTO stu VALUES(2,'yy',17);
INSERT INTO stu VALUES(2,'zz',18);
INSERT INTO stu VALUES(3,'mm',15);
INSERT INTO stu VALUES(3,'nn',18);
COMMIT;

SELECT * FROM stu;

SELECT DISTINCT stu.* FROM stu;

DELETE FROM stu WHERE ROWID NOT IN (SELECT MAX(ROWID) FROM stu GROUP BY ID,NAME,age);

DELETE FROM stu s1 WHERE NOT EXISTS(SELECT MAX(ROWID) FROM stu s2 WHERE s1.name=s2.name AND s1.id=s2.id AND s1.age=s2.age)
