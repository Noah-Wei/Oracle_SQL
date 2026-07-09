--定义存储过程swap(nl,n2)，其中有两个整型参数，存储过程的作用是交换这两个参数的值。
CREATE OR REPLACE PROCEDURE swap(N1 IN OUT NUMBER,n2 IN OUT NUMBER)
IS
       v_temp NUMBER;       -- 用于交换的临时变量 
BEGIN
    -- 方式1
    v_temp := n1;
    n1 := n2;
    n2 := v_temp;

-- 方式二
/*    n1 := n1+n2;   
    n2 := n1-n2;   
    n1 := n1-n2;*/

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('出现异常');
END;


/*-- 执行存储过程
DECLARE
   num1 NUMBER := 100;
   num2 NUMBER := 200;
BEGIN
    dbms_output.put_line('交换前：');
    dbms_output.put_line('num1：'||num1);
    dbms_output.put_line('num2：'||num2);
    swap(num1,num2);
    dbms_output.put_line('交换后：');
    dbms_output.put_line('num1：'||num1);
    dbms_output.put_line('num2：'||num2);
END;
--*/
