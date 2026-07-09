-- 数据字典的种类
-- user视图：以user_为前缀，用来记录房钱用户下的用户对象的信息
SELECT * FROM User_Tables;
SELECT * FROM User_Indexes;

-- all视图：以all_为前缀，用来记录用户对象的信息以及被授权访问的对象
SELECT * FROM All_Tables;

-- DBA视图：以DBA_为前缀，用来记录数据库实例的所有对象的信息
SELECT * FROM dba_tables;

-- V$视图：
