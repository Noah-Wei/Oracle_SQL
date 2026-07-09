-- 案例1：异常
DECLARE
   v_x INT;
BEGIN
    dbms_output.put_line('begin执行开始');
    -- SELECT empno INTO v_X FROM emp WHERE empno = 7788;
    -- SELECT empno INTO v_X FROM emp ;
    -- SELECT 10/0 INTO v_x FROM dual;
    SELECT to_number('a') INTO v_x FROM dual;
    dbms_output.put_line('end执行结果');
EXCEPTION
    WHEN no_data_found THEN 
        dbms_output.put_line('数据找不到');
    WHEN too_many_rows THEN
        dbms_output.put_line('返回多行数据');
    WHEN zero_divide THEN 
        dbms_output.put_line('试图被0除');
    WHEN INVALID_NUMBER THEN 
        dbms_output.put_line('转换数字失败');       
    WHEN OTHERS THEN
        dbms_output.put_line('报异常了');
END;
