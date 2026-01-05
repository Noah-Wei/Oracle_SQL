-- keepalive.sql 极简保活版本（无需SELECT，更高效）
SET SERVEROUTPUT ON;
BEGIN
  -- 无限循环，手动终止即可停止
  LOOP
    DBMS_OUTPUT.PUT_LINE('保活检测时间：' || TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'));
    
    -- 延时10秒（需1分钟则改为60），仅通过定时交互保持连接活跃
    DBMS_LOCK.SLEEP(10);
  END LOOP;
END;
/
