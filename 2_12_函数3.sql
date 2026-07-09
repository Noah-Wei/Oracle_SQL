-- 案例3：带参数
CREATE OR REPLACE FUNCTION doublenum(v_x NUMBER)
RETURN NUMBER
IS
       
BEGIN
    RETURN v_x *2 ;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('出现异常');  
END;

-- 调用
SELECT sal,DOUBLEnum(sal) FROM emp;
