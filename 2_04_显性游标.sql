-- 游标属性
-- %notfound
-- %found
-- %isopen
-- %rowcount

-- 案例1游标使用示例 -- loop循环
DECLARE
   v_empno emp.empno%TYPE;
   v_ename emp.ename%TYPE;
   -- 定义游标
   CURSOR cursor_emp IS SELECT empno,ename FROM emp;
BEGIN
    -- 打开游标
    OPEN CURSOR_emp;
    -- 提取数据（fetch每次提取一行数据，所以需要循环）
    LOOP
        FETCH cursor_emp INTO v_empno,v_ename;
        
        EXIT WHEN CURSOR_emp%NOTFOUND;
        dbms_output.put_line('第'||CURSOR_emp%ROWCOUNT||'行，'||v_empno||','||v_ename);
    END LOOP;
    -- 关闭游标，释放资源
    CLOSE cursor_emp;

END;

-- 案例2
DECLARE
   v_emp emp%ROWTYPE;
   -- 定义游标
   CURSOR cursor_emp IS SELECT * FROM emp;
BEGIN
    -- 打开游标
    OPEN CURSOR_emp;
    -- 提取数据（fetch每次提取一行数据，所以需要循环）
    LOOP
        -- FETCH cursor_emp INTO v_emp.empno,v_emp.ename,v_emp.JOB,v_emp.MGR,v_emp.HIREDATE,v_emp.SAL,v_emp.COMM,v_emp.DEPT;
        FETCH cursor_emp INTO v_emp;
        EXIT WHEN CURSOR_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(
            '第' || cursor_emp%ROWCOUNT || '行，' ||
            v_emp.empno || ',' ||
            v_emp.ename || ',' ||
            v_emp.job || ',' ||
            v_emp.mgr || ',' ||
            TO_CHAR(v_emp.hiredate, 'YYYY-MM-DD') || ',' ||
            v_emp.sal || ',' ||
            NVL(v_emp.comm,0) || ',' ||
            v_emp.deptno
        );
    END LOOP;
    -- 关闭游标，释放资源
    CLOSE cursor_emp;

END;

-- 练习：打印所有员工的信息，包括员工编号，员工姓名，部门编号，部门名称
DECLARE
   v_empno emp.empno%TYPE;
   v_ename emp.ename%TYPE;
   v_deptno dept.deptno%TYPE;
   v_dname dept.dname%TYPE;
   CURSOR cur_emp IS
          SELECT e.empno,e.ename,d.deptno,d.dname FROM emp e LEFT JOIN dept d ON e.deptno=d.deptno;
BEGIN
    OPEN cur_emp;
    LOOP
        FETCH cur_emp INTO v_empno,v_ename,v_deptno,v_dname;
        EXIT WHEN cur_emp%NOTFOUND;
        dbms_output.put_line(v_empno||','||v_ename||','||v_deptno||','||v_dname);
    END LOOP;
    CLOSE cur_emp;
    
END;

-- while
DECLARE
   v_empno emp.empno%TYPE;
   v_ename emp.ename%TYPE;
   v_deptno dept.deptno%TYPE;
   v_dname dept.dname%TYPE;
   CURSOR cur_emp IS
          SELECT e.empno,e.ename,d.deptno,d.dname FROM emp e LEFT JOIN dept d ON e.deptno=d.deptno;
BEGIN
    OPEN cur_emp;
    FETCH cur_emp INTO v_empno,v_ename,v_deptno,v_dname;
    WHILE cur_emp%FOUND LOOP
        FETCH cur_emp INTO v_empno,v_ename,v_deptno,v_dname;
        
        dbms_output.put_line(v_empno||','||v_ename||','||v_deptno||','||v_dname);
    END LOOP;

    CLOSE cur_emp;
    
END;

-- for循环
DECLARE
 v_emp emp%ROWTYPE;
 CURSOR cur_emp IS SELECT empno,ename FROM emp;
BEGIN
    FOR v_emp IN cur_emp LOOP
        dbms_output.put_line(v_emp.empno||';'||v_emp.ename);
    END LOOP;
END;

-- 练习，用游标循环给员工加薪水
DECLARE
    
    CURSOR CUR_SAL IS
        SELECT ENAME, SAL FROM EMP;
BEGIN
    FOR V_EMP IN CUR_SAL LOOP
        IF V_EMP.SAL <= 1000
        THEN
            V_EMP.SAL := V_EMP.SAL * 1.2;
        ELSIF V_EMP.SAL > 1000
              AND V_EMP.SAL <= 2000
        THEN
            V_EMP.SAL := V_EMP.SAL * 1.15;
        ELSIF V_EMP.SAL > 2000
              AND V_EMP.SAL <= 3000
        THEN
            V_EMP.SAL := V_EMP.SAL * 1.1;
        ELSE
            V_EMP.SAL := V_EMP.SAL * 1.05;
        END IF;
        DBMS_OUTPUT.PUT_LINE(V_EMP.ENAME || ';' || V_EMP.SAL);
    END LOOP;

END;

-- 带参数的显性游标
DECLARE
    CURSOR CUR_EMP IS
        SELECT EMPNO, ENAME, DEPTNO
        FROM EMP E
        WHERE SAL > 2000
              AND DEPTNO = 10;
BEGIN
    FOR V_EMP IN CUR_EMP LOOP
        DBMS_OUTPUT.PUT_LINE('第' || CUR_EMP%ROWCOUNT || '行，---' ||
                             V_EMP.EMPNO || ',' || V_EMP.ENAME || ',' ||
                             V_EMP.DEPTNO);
    
    END LOOP;
END;


--
DECLARE
    CURSOR CUR_EMP(v_sal NUMBER,v_deptno NUMBER) IS
        SELECT EMPNO, ENAME, DEPTNO
        FROM EMP E
        WHERE SAL > v_sal
              AND DEPTNO = v_deptno;
BEGIN
    FOR V_EMP IN CUR_EMP(2000,10) LOOP
        DBMS_OUTPUT.PUT_LINE('第' || CUR_EMP%ROWCOUNT || '行，---' ||
                             V_EMP.EMPNO || ',' || V_EMP.ENAME || ',' ||
                             V_EMP.DEPTNO);
    
    END LOOP;
END;


-- 带参数 loop写法
DECLARE
    V_EMPNO  EMP.EMPNO%TYPE;
    V_ENAME  EMP.ENAME%TYPE;
    V_DEPTNO EMP.DEPTNO%TYPE;
    CURSOR CUR_EMP(p_SAL NUMBER, p_DEPTNO NUMBER) IS
        SELECT EMPNO, ENAME, DEPTNO
        FROM EMP E
        WHERE SAL > p_SAL
              AND DEPTNO = p_DEPTNO;
BEGIN
    OPEN CUR_EMP(2000, 10);
    
    LOOP
        FETCH CUR_EMP INTO V_EMPNO,V_ENAME,V_DEPTNO;
        DBMS_OUTPUT.PUT_LINE(V_EMPNO||','||V_ENAME || ',' || V_DEPTNO);
        EXIT WHEN CUR_EMP%NOTFOUND;
    END LOOP;
    CLOSE CUR_EMP;
END;
