DECLARE
    -- 定义变量
    v_name employees.emp_name%TYPE;
    v_salary employees.salary%TYPE;
    -- 定义游标
    CURSOR c_emp IS
        SELECT emp_name,salary
        FROM employees;
BEGIN
    -- 打开游标
    OPEN c_emp;
    LOOP

        -- 读取一行
        FETCH c_emp 
        INTO v_name,v_salary;


        -- 没数据退出
        EXIT WHEN c_emp%NOTFOUND;


        DBMS_OUTPUT.PUT_LINE(
            v_name || ' 工资:' || v_salary
        );
    END LOOP;
    --关闭游标
    CLOSE c_emp;
END;
/


DECLARE
    CURSOR c_emp IS
        SELECT emp_name,salary
        FROM employees;
BEGIN
    FOR T_EMP IN C_EMP LOOP
        DBMS_OUTPUT.PUT_LINE(T_EMP.emp_name|| ' 工资:' ||T_EMP.salary);
    END LOOP;
END;
/