/*
案例1：给员工加薪水

*/
DECLARE
    V_AVG_SAL EMP.SAL%TYPE;

BEGIN
    SELECT AVG(SAL) INTO V_AVG_SAL FROM EMP;
    IF V_AVG_SAL <= 1000
    THEN
        UPDATE EMP_CP SET SAL = SAL * 1.2;
    ELSIF V_AVG_SAL > 1000
          AND V_AVG_SAL <= 2000
    THEN
        UPDATE EMP_CP SET SAL = SAL * 1.15;
    ELSIF V_AVG_SAL > 2000
          AND V_AVG_SAL <= 3000
    THEN
        UPDATE EMP_CP SET SAL = SAL * 1.1;
    ELSE
        UPDATE EMP_CP SET SAL = SAL * 1.05;
    END IF;
    COMMIT;
END;

SELECT * FROM emp_cp;

/*
案例2：
*/

DECLARE
    MY_NUM  INT;
    COM_NUM INT;
BEGIN
    DBMS_OUTPUT.PUT_LINE('输入一个数字（13以内）：' || &MY_NUM);
    SELECT TRUNC(DBMS_RANDOM.VALUE(1, 13)) INTO COM_NUM FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('电脑的数字：' || COM_NUM);
    IF MY_NUM > COM_NUM
    THEN
        DBMS_OUTPUT.PUT_LINE('我大');
    ELSIF MY_NUM = COM_NUM
    THEN
        DBMS_OUTPUT.PUT_LINE('一样大');
    ELSE
        DBMS_OUTPUT.PUT_LINE('电脑大');
    
    END IF;
END;


/*
案例3：
*/
DECLARE
    MY_NUM  NUMBER := &输入一个0到2数字;
    COM_NUM NUMBER := TRUNC(DBMS_RANDOM.VALUE(0, 3));
BEGIN
    -- DBMS_OUTPUT.PUT_LINE('输入一个数字（0,1,2）：' || &MY_NUM);
    --SELECT TRUNC(DBMS_RANDOM.VALUE(0, 3)) INTO COM_NUM FROM DUAL;
    --DBMS_OUTPUT.PUT_LINE('电脑的数字：' || COM_NUM);
    IF MY_NUM = 0 THEN 
        IF COM_NUM = 0
        THEN
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：剪刀' || COM_NUM || '，平局');
        ELSIF COM_NUM = 1
        THEN
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：石头' || COM_NUM || '，输了');
        ELSE
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：布' || COM_NUM || '，赢了');
        END IF;
    ELSIF MY_NUM = 1 THEN 
        IF COM_NUM = 0 
        THEN 
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：剪刀' || COM_NUM ||'，WIN');
        ELSIF COM_NUM = 1 
        THEN 
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：石头' || COM_NUM || '，=='); 
        ELSE 
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：布' || COM_NUM || '，LOSS'); 
        END IF; 
    ELSIF MY_NUM = 2 THEN 
        IF COM_NUM = 0 
        THEN 
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：剪刀' || COM_NUM || '，LOSS'); 
        ELSIF COM_NUM = 1 
        THEN 
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：石头' || COM_NUM || '，WIN'); 
        ELSE 
            DBMS_OUTPUT.PUT_LINE('电脑的出的是：布' || COM_NUM || '，=='); 
        END IF; 
    ELSE
        DBMS_OUTPUT.PUT_LINE('输入错误'); 
    END IF; 
END;

-- 使用ifelse结构判断用户输入的年龄是否合法(负数和大于150的都是不合法
DECLARE
   v_age INT := &请输入年龄;
BEGIN
    IF v_age <0 OR v_age >150 THEN
        dbms_output.put_line('年龄不合法');
        
    ELSIF v_age >= 0 AND v_age <= 150 THEN
        dbms_output.put_line('年龄合法');
    ELSE
        dbms_output.put_line('输入不合法');
        
    END IF;

END;
