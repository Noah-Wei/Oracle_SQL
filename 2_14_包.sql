1.包：package,数据库对象
2.包作用：一组相关过程、函数、变量、常量、类型和游标等plsql程序设计元素的组合
3.包的优点：
    one:不同的业务放在不同的包内，解决命名冲突问题
    例如：银行开户业务、                     银行贷款业务
            开户相关包                       贷款相关的包
            过程、函数、变量、常量、         过程、函数、变量、常量、
            PROCEDURE proc                   PROCEDURE proc
            包名1.proc                       包名2.proc
    TWO:不同包内都封装各自相同业务的plsql子代码块
4.包组成：包头 + 包体
5.包的语法特点： 包头可以单独存在，包体必须组合包头
6.包头：存放过程、函数、变量、常量、类型和游标等plsql程序设计的定义
7.包体：实现包头定义部分

-- 包头
CREATE OR REPLACE PACKAGE mypac
IS
    v_x NUMBER;
    FUNCTION fun_1(x NUMBER,y NUMBER,op VARCHAR2) RETURN VARCHAR2;   
    PROCEDURE pro_1(v_empno NUMBER,v_ename OUT VARCHAR2);
    
    TYPE mycur IS REF CURSOR;  -- 声明动态游标类型
END;

-- 包体
CREATE OR REPLACE PACKAGE BODY mypac
IS
       -- 实现函数
       FUNCTION fun_1(x NUMBER,y NUMBER,op VARCHAR2)
       RETURN VARCHAR2
       IS

       BEGIN
           IF op = '+' THEN
               RETURN x||'+'||y||'='||(x + y);
           ELSIF op = '-' THEN
               RETURN x||'-'||y||'='||(x - y);
           ELSIF op = '*' THEN
               RETURN x||'*'||y||'='||(x * y);
           ELSIF op = '/' THEN
               RETURN x||'/'||y||'='||(x / y);
           ELSE
               RETURN '输入错误';

           END IF;
       END;

       -- 实现过程
       PROCEDURE pro_1(v_empno NUMBER,v_ename OUT VARCHAR2)
       IS

       BEGIN
           SELECT ename INTO V_ename FROM emp WHERE empno = v_empno;
           dbms_output.put_line(v_empno||','||v_ename);
       END;

END;


-- 调用包内的变量、游标、函数、过程等plsql子程序
DECLARE
   v_refcur mypac.mycur;     -- 动态游标类型变量
   v_ename emp.ename%TYPE;
   v_ename2 emp.ename%TYPE;
   
BEGIN
    -- 变量使用
   mypac.v_x := 100;
   dbms_output.put_line(mypac.v_x); 
   
   -- 游标使用 
   OPEN v_refcur FOR 'select ename from emp';
   LOOP
       FETCH v_refcur INTO v_ename;
        EXIT WHEN v_refcur%NOTFOUND;
        dbms_output.put_line(v_ename); 
   END LOOP;
   CLOSE v_refcur;
   
   -- 函数的使用
   dbms_output.put_line(mypac.fun_1(1,2,'+'));
   
   -- 过程的使用
   mypac.pro_1(7369,v_ename);
   dbms_output.put_line(v_ename);
END;


SELECT mypac.fun_1(1,2,'+') FROM dual;
