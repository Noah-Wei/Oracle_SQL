-- 动态游标：显性游标+动态sql

-- 案例1：
DECLARE
    -- 申明动态游标类型
    TYPE refcur IS REF CURSOR;
    -- 定义动态游标变量
    v_cur refcur;
    
    v_emp emp%ROWTYPE;
BEGIN
    OPEN v_cur FOR 'select * from emp where sal < :1 order by sal' USING 3000;
    LOOP
        FETCH v_cur INTO v_emp;
        EXIT WHEN v_cur%NOTFOUND;
        dbms_output.put_line(v_emp.empno||','||v_emp.ename||','||v_emp.sal);
    END LOOP;
END;
