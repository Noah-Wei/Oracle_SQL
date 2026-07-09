包的私有过程或者函数：包头部没有声明定义，但是在包体内实现的过程或者函数
私有的过程或者函数，只能被包内其他过程或者函数调用
外部无法访问私有，这也保证了包内数据的安全性
-- 包头
CREATE OR REPLACE PACKAGE pac_test
IS
       PROCEDURE proc_1;
       
       FUNCTION fun_1 RETURN DATE;
END;

-- 包体
CREATE OR REPLACE PACKAGE BODY pac_test
IS
       -- 实现私有存储过程
       PROCEDURE pro_2(x VARCHAR2)
       IS
       
       BEGIN
           dbms_output.put_line('pro_2私有过程');
       END;
       
       -- 实现存储过程
       PROCEDURE proc_1
       IS
       
       BEGIN
           dbms_output.put_line('公共的存储过程');
           -- 调用私有存储过程
           pro_2('hello');
       
       END;
       
       -- 实现函数
       FUNCTION fun_1
       RETURN DATE
       IS
       
       BEGIN
           RETURN SYSDATE;
       
       END;

    
END;


-- 调用过程或者函数

DECLARE

BEGIN
    -- 使用过程
    pac_test.proc_1;
    pac_test.proc_1();
    
    -- 使用函数
    dbms_output.put_line(pac_test.fun_1());
    
    --
    pac_test.proc_2('hello'); -- 私有过程或者函数，外接调用不了

END;

