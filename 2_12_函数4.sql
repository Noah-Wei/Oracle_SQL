-- 案例3：定义函数math_sum，带两个数值参数，该函数返回两个参数的和
-- 定义好函数后，请用次函数计算员工薪水和员工编号的和
CREATE OR REPLACE FUNCTION math_sum(v_a NUMBER,v_b NUMBER)
RETURN NUMBER
IS
       
BEGIN
    RETURN v_a + v_b ;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('出现异常');  
END;


-- 调用
SELECT math_sum(sal,empno) FROM emp;
