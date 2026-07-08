-- 1.添加Person表中一列address,数据类型为varchar2(20),默认值为暂无地址
ALTER TABLE  person ADD(address VARCHAR2(20) DEFAULT '暂无地址');

-- 查询表
SELECT * FROM person;

-- 删除列
ALTER TABLE person DROP  COLUMN address;

-- 删除多列
ALTER TABLE person DROP (birthdate,sex);

-- 修改字段的数据类型
-- 注意：要更改数据类型，则要修改的字段值为空
ALTER TABLE person MODIFY (NAME CHAR(30) DEFAULT '无名');

ALTER TABLE person MODIFY (NAME CHAR(30) ,address VARCHAR2(200));

-- 注意2：修改表的字段最大存值导航度
ALTER TABLE person MODIFY (NAME VARCHAR2(3000));

-- 5.修改表名
RENAME person TO T_person;

SELECT * FROM T_person;
