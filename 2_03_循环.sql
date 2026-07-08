-- loop 循环
-- 向部门表中插入10条数据，部门编号从41到50
DROP TABLE dept_cp;
CREATE TABLE dept_cp AS SELECT * FROM dept;
SELECT * FROM dept_cp;
DECLARE
   v_i NUMBER := 41;
BEGIN
    LOOP
       INSERT INTO dept_cp(deptno,dname) VALUES(v_i,'dept'||v_i);
       v_i := v_i +1;
       EXIT WHEN v_i>50;
    END LOOP;
    COMMIT;
END;


DROP TABLE dept_cp;
CREATE TABLE dept_cp AS SELECT * FROM dept;
SELECT * FROM dept_cp;
-- while 循环
DECLARE
   v_i NUMBER := 41;
BEGIN
    WHILE v_i <= 50
    LOOP
          INSERT INTO dept_cp(deptno,dname) VALUES(v_i,'dept'||v_i);
          v_i := v_i +1;
    END LOOP;
    COMMIT;
END;

-- for循环
DROP TABLE dept_cp;
CREATE TABLE dept_cp AS SELECT * FROM dept;
SELECT * FROM dept_cp;
DECLARE
       v_i NUMBER := 41;
BEGIN
    FOR v_i IN 41 .. 50
    LOOP
        INSERT INTO dept_cp(deptno,dname) VALUES(v_i,'dept'||v_i);
    END LOOP;
END;

-- 嵌套勋魂：循环内部套循环
DECLARE
BEGIN
     FOR i IN 1.. 5          
     LOOP
         FOR j IN ASCII('A').. ASCII('C')
             
         LOOP
             dbms_output.put(CHR(j)||i||'   ');
         END LOOP;
         dbms_output.put_line('');
     END LOOP;
 
END;

/*
A1   B1   C1   
A2   B2   C2   
A3   B3   C3   
A4   B4   C4   
A5   B5   C5   

控制循环的关键字 
     continue，跳过本次循环，继续下次循环
*/

/*
控制循环的关键字 
     exit，终止整个循环
*/
DECLARE
BEGIN
     FOR i IN 1.. 5          
     LOOP
         FOR j IN ASCII('A').. ASCII('C')
         LOOP
             IF i= 3 THEN
                 EXIT;
                 
                 END IF;
             dbms_output.put(CHR(j)||i||'   ');
         END LOOP;
         dbms_output.put_line('');
     END LOOP;
 
END;
/*
A1   B1   C1   
A2   B2   C2   

A4   B4   C4   
A5   B5   C5   

*/

DECLARE
BEGIN
     FOR i IN 1.. 5 LOOP
         FOR j IN ASCII('A').. ASCII('C') LOOP
             dbms_output.put(CHR(j)||i||'   ');
         END LOOP;
         dbms_output.put_line('');
         IF i= 3 THEN
            EXIT;
         END IF;
     END LOOP;
END;

-- 分别使用for和while循环计算1-100的和。
-- for
DECLARE
   v_sum INT := 0;
BEGIN
    FOR i IN 1 .. 100 LOOP
        v_sum := v_sum + i;
    END LOOP;
    dbms_output.put_line(v_sum);
END;

-- while
DECLARE
   v_sum INT := 0;
   i INT := 1;
BEGIN
    WHILE i <= 100 LOOP
        v_sum := v_sum + i;
        i := i+1;
    END LOOP;
    dbms_output.put_line(v_sum);
END;

-- 分别使用for和while循环以及break找到100以内第二个的可以被13整除的偶数。
-- for
DECLARE
BEGIN
    FOR I IN 1 .. 100
    LOOP
        IF MOD(I, 2) = 0 THEN
            IF i/13 = 2 THEN
                DBMS_OUTPUT.PUT_LINE(I);
                EXIT;
            END IF;
        END IF;
    END LOOP;

END;
-- while
DECLARE
   i INT := 1;
BEGIN
    WHILE i<= 100 LOOP
        IF MOD(I, 2) = 0 THEN
            IF i/13 = 2 THEN
                DBMS_OUTPUT.PUT_LINE(I);
                EXIT;
            END IF;
        END IF;
        i := i +1;
    END LOOP;

END;

--分别使用for和while循环打印出前100个数中的偶数。
-- for
DECLARE

BEGIN
    FOR i IN 1.. 100 LOOP
        IF MOD(I, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(I);
        END IF;
    END LOOP;
END;

-- while
DECLARE
   i INT := 1;
BEGIN
    WHILE i<= 100 LOOP
        IF MOD(I, 2) = 0 THEN
           DBMS_OUTPUT.PUT_LINE(I);
        END IF;
        i := i +1;
    END LOOP;
END;

-- 分别使用for和while循环输出5阶乘的结果，按如下要求输出:
-- 5!=120
-- for 
DECLARE
   v_sum INT  := 1;
BEGIN
    FOR i IN 1.. 5 LOOP
        v_sum := v_sum * i ;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('5!='||v_sum);
END;
-- while
DECLARE
   i INT := 1;
   v_sum INT  := 1;
BEGIN
    WHILE i<= 5 LOOP
          v_sum := v_sum * i ;
          i := i +1 ;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(i-1||'!='||v_sum);
END;

-- 分别使用for和while循环输出101~200间的所有素数。
-- for
DECLARE
   v_is_prime BOOLEAN; -- 用于标记当前数字是否为素数
BEGIN
    FOR i IN 101 .. 200 LOOP
        v_is_prime := TRUE;
        FOR j IN 2 .. i-1 LOOP
            IF MOD(i,j)= 0 THEN
                v_is_prime := FALSE;
                EXIT;
            END IF;
            
        END LOOP;
        IF v_is_prime THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;

END;

