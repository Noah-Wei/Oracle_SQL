-- 案例2：in模式 默认参数模式，传入参数
CREATE OR REPLACE PROCEDURE proc_in(v_empno IN NUMBER)
IS
       v_emp emp%ROWTYPE;
BEGIN
    SELECT * INTO v_emp FROM emp WHERE empno = v_empno;
    dbms_output.put_line(v_emp.empno||'---'||v_emp.ename);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('出现异常');
END;

-- 调用1
CALL proc_in(7369);
