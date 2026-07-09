/*1.函数：FUNCTION ，数据库对象
              基本结构类似存储过程，也是命令的plsql子块
              
2.函数特点：
              带参数的函数，全是输入参数；即调用函数全部传入进来
              返回值匹配对象数据库类型（RETURN ）
3.基本语法
CREATE [OR REPLACE] FUNCTION function_name
    (parameter1 [IN] datatype,
     parameter2 [IN] datatype)
RETURN return_datatype          -- ⚠️ 注意：是 RETURN，不是 RETURNS
[DETERMINISTIC]                 -- 可选：纯函数标记
[RESULT_CACHE]                  -- 可选：结果缓存
[AUTHID CURRENT_USER | DEFINER] -- 可选：权限模型
IS | AS
    -- 声明区：局部变量、游标、子程序
BEGIN
    -- 执行体
    RETURN expression;          -- ⚠️ 必须有至少一个 RETURN
EXCEPTION                       -- 可选：异常处理
    WHEN OTHERS THEN
        RETURN default_value;
END [function_name];
/
              
              */

-- 案例1：无参数的函数
CREATE OR REPLACE FUNCTION fun_out
RETURN VARCHAR2
IS

BEGIN
    RETURN 'hello world';
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('出现异常');  
END;


/*-- 函数的调用
-- 方式1：
DECLARE
   v_x VARCHAR2(100);
BEGIN
    v_x := fun_out();
    dbms_output.put_line(v_x);
END;

-- 方式2
DECLARE
BEGIN
    dbms_output.put_line(fun_out());
END;

-- 方式3
SELECT fun_out() FROM dual;

--*/
