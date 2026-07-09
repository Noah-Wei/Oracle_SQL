-- 案例：储存过程参数是动态游标类型
-- 动态游标= 显性游标+ 动态sql
-- 目标：实现按照输入的部门编号，输出动态游标结果集合
CREATE OR REPLACE PROCEDURE pro_ref(v_deptno IN NUMBER,v_emp OUT SYS_REFCURSOR)
IS
       v_e emp%ROWTYPE;
BEGIN
    OPEN v_emp FOR 'SELECT * FROM emp WHERE deptno = :d' USING v_deptno;
    LOOP
        FETCH v_emp INTO v_e;
        EXIT WHEN v_emp%NOTFOUND;
        dbms_output.put_line(v_e.ename||'----'||v_e.empno);
    END LOOP;
    CLOSE v_emp;
END;

/*-- 调用
DECLARE
    TYPE mytype IS REF CURSOR;
    ref_cur mytype;
BEGIN
    pro_ref(10,ref_cur);
END;
--*/


