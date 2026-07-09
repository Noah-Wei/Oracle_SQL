-- 案例2：定义函数max_emp_sal ,没有参数
-- 该函数返回所有员工薪水的最大值
CREATE OR REPLACE FUNCTION max_emp_sal
RETURN NUMBER
IS
       max_sal emp.sal%TYPE;
BEGIN
    
    SELECT MAX(sal)  INTO max_sal FROM emp;
    RETURN max_sal;
    
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('出现异常');  
END;


-- 方式1
SELECT max_emp_sal() FROM dual;

SELECT max_emp_sal FROM dual;
-- 方式2
BEGIN

    dbms_output.put_line(fun_out());
END;


