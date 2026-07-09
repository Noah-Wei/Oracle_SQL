/*1.数据库对象：表、视图、序列、索引、同义词、dblink、存储过程、函数、用户、角色
2.存储过程：就是带命名的plsql代码块，以对象形式存储在数据库
3.特点：传输输入参数，也可以返回参数
3.存储过程语法案例
CREATE [OR REPLACE] PROCEDURE procedure_name
    [(parameter1 [mode] datatype,
      parameter2 [mode] datatype,
      ...)]
IS | AS
    -- 声明区：变量、游标、异常等
BEGIN
    -- 执行体：SQL + PL/SQL 逻辑
EXCEPTION
    -- 异常处理（可选）
END [procedure_name];
/*/
-- CREATE TABLE dd AS SELECT * FROM dept;

-- SELECT * FROM dd;
-- 案例1：无参数过程
CREATE OR REPLACE PROCEDURE proc_test1
IS

BEGIN
    DELETE FROM dd WHERE deptno IN (80,81);
    
    INSERT INTO dd(deptno,dname) VALUES(80,'市场部');
    INSERT INTO dd(deptno,dname) VALUES(81,'财务部');
    
    COMMIT;
EXCEPTION
    WHEN  OTHERS THEN
         ROLLBACK;
END;

/*

-- 查询当前用户所有的存储过程
-- SELECT * FROM User_Procedures ;

-- 验证过程结果
SELECT * FROM dd;

-- 执行存储过程
-- 方式1：call
CALL proc_test1();

-- 方式2：plsql代码块运行直接运行
BEGIN
    proc_test1();
END;

-- 方式3：execute  (需要在命令行窗口运行)
EXECUTE proc_test1();

-- 方式4：exec (需要在命令行窗口运行)
exec proc_test1();
*/
