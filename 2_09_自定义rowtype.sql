-- 1.自定义记录型 rowtype
DECLARE
   TYPE mytype IS RECORD(
        x NUMBER(4),
        y VARCHAR2(19)
   );
   mt mytype;
   
   -- 游标
   CURSOR  mycur IS SELECT 1,'张三' FROM dual UNION SELECT 2,'李四' FROM dual UNION ALL SELECT 3,'王五' FROM dual;
BEGIN
   OPEN mycur;
   
   LOOP
       FETCH mycur INTO mt;

       EXIT WHEN mycur%NOTFOUND;
       dbms_output.put_line(mt.x||mt.y);
   END LOOP;
   CLOSE mycur;
END;
