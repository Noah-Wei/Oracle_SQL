-- 案例1：隐形游标（DML、select into 等语句）
DECLARE

BEGIN
    UPDATE ee SET ename = 'baby' WHERE empno = 77888;
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('不存在，修改失败');
        ROLLBACK;
    ELSIF SQL%FOUND THEN
        dbms_output.put_line('存在的，修改成功'||sql%ROWCOUNT||'条数据');
        COMMIT;
    END IF;
END;


SELECT * FROM ee;

-- 案例2
--使用游标删除部门表中名称相同的记录，但要保留最后一次添加的部门(部门编号最大的)
CREATE TABLE dd AS SELECT * FROM dept;
SELECT * FROM dd;
INSERT INTO dd VALUES(50,'SALES','sdsd');
COMMIT;

-----------------------
DECLARE

BEGIN
    DELETE FROM dd WHERE deptno IN(
        SELECT deptno FROM (
            SELECT dd.*,row_number() OVER(PARTITION BY dname ORDER BY deptno DESC) AS rn
            FROM dd) t
        WHERE t.rn>1
        );
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('不存在，修改失败');
        ROLLBACK;
    ELSIF SQL%FOUND THEN
        dbms_output.put_line('存在的，修改成功'||sql%ROWCOUNT||'条数据');
        COMMIT;
    END IF;
END;

ROLLBACK;

----------------------------------------------------------------------------
DECLARE
    
BEGIN
    DELETE FROM dept
    WHERE deptno NOT IN (
          SELECT MAX(deptno) FROM dept GROUP BY dname
    );
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('不存在，修改失败');
        ROLLBACK;
    ELSIF SQL%FOUND THEN
        dbms_output.put_line('存在的，修改成功'||sql%ROWCOUNT||'条数据');
        COMMIT;
    END IF;
END;
