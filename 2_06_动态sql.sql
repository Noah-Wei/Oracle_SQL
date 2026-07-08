/*
-- 动态sqlL:
-- plsql内部正常运行DML（insert，update，delete）
                    DQL（SELECT into）
          如果运行DDL（create，truncate，drop等），必须要动态sql执行
2.动态sql不但可以在plsql中运行ddl，还可以运行DML，DQL
3.动态sql语法：
       execute immdiate  'sql 语句' 【using 绑定参数】【into 变量】
          
*/
-- 案例1：动态sql执行ddl语句
DECLARE
   v_sql VARCHAR2(255) := '
   CREATE TABLE aa (
       ID NUMBER,
       NAME VARCHAR2(30) NOT NULL,
       
       CONSTRAINT a_id_pk PRIMARY KEY(ID)
   )
   ';
BEGIN
   EXECUTE IMMEDIATE V_sql;
   dbms_output.put_line('创建表');
   EXECUTE IMMEDIATE 'drop table aa ';
   dbms_output.put_line('删除表');
END;       

-- 案例2：动态sql执行dml语句
DECLARE

BEGIN
    --EXECUTE IMMEDIATE 'insert into e(员工姓名,员工工资,部门编号,部门名称) values(''tom'',2000,20,''IT'')';
    -- :1 第一个占位参数，:2 第二个占位参数
    EXECUTE IMMEDIATE 'insert into e(员工姓名,员工工资,部门编号,部门名称) values(:1,:2,:3,:4)' USING 'jack',1111,20,'SQL' ;
    COMMIT;
END;

SELECT * FROM e;


-- 案例3：动态sql 执行DQL
-- 注意：into变量不能返回多行数据，只能一行数据
DECLARE
        v_ename  emp.ename%TYPE;
        v_sal    emp.sal%TYPE;
        v_deptno emp.deptno%TYPE;
BEGIN
    EXECUTE IMMEDIATE 
            'select ename,sal,deptno from emp where sal> :1 and deptno = :2 ' 
            INTO v_ename, v_sal,v_deptno
            USING 3000,10  ;
    dbms_output.put_line(v_ename||','||v_sal||','||v_deptno);
END;
-------------------------------------------------------------------
DECLARE
        v_emp  emp%ROWTYPE;
BEGIN
    EXECUTE IMMEDIATE 
            'select * from emp where sal> :1 and deptno = :2 ' 
            INTO v_emp
            USING 3000,10  ;
    dbms_output.put_line(v_emp.ename||','||v_emp.sal||','||v_emp.deptno);
END;



