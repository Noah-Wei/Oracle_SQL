-- 案例3：out模式，输出数值，返回结果
CREATE OR REPLACE PROCEDURE proc_out(v_empno IN NUMBER,v_name OUT VARCHAR2)
IS
      
BEGIN
    SELECT ename INTO v_name FROM emp WHERE empno = v_empno;
    dbms_output.put_line(v_empno||'---'||v_name);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('出现异常');
END;


/*-- 调用带out模式参数，必须通过plsql代码块方式调用
DECLARE
    v_name emp.ename%TYPE;
BEGIN
    proc_out(7369,v_name);
END;
-*/
