-- 案例1：输出系统当前时间
-- dbms_output.put_line(); 换行
-- dbms_output.put(); 不换行，必须搭配dbms_output.put_line(x);使用
DECLARE
   x DATE := SYSDATE;
BEGIN
    dbms_output.put_line(x);
    dbms_output.put(11);
    dbms_output.put_line(x);
END;

-- 
DECLARE
    v_emp_c NUMBER; 
    v_ename emp.ename%TYPE;
    v_empno emp.empno%TYPE;
BEGIN
    -- v_emp_c := 10;
    SELECT  COUNT(*) INTO v_emp_c FROM emp;
    SELECT empno,ename INTO v_empno,v_ename FROM emp WHERE empno = 7369;
    dbms_output.put_line('人数:'||v_emp_c);
    dbms_output.put_line(v_ename);
END;

--
-- 
DECLARE
    v_emp emp%ROWTYPE;
BEGIN
    SELECT * INTO v_emp FROM emp WHERE empno = 7369;
    dbms_output.put_line(v_emp.empno||','||v_emp.ename);
END;

--
DECLARE
    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
    v_dname dept.dname%TYPE;
BEGIN
    SELECT e.empno,e.ename,d.dname INTO v_empno,v_ename,v_dname FROM emp e LEFT JOIN dept d ON e.deptno=d.deptno WHERE empno=7788;
    dbms_output.put_line('员工编号：'||v_empno||','||'员工姓名：'||v_ename||'，部门：'||v_dname);
END;


