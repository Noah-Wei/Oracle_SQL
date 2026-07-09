-- 创建一个系统触发器，记录每次系统的启动时间
CREATE TABLE database_log(op_date timetamp);

CREATE OR REPLACE TRIGGER database_startup
AFTER startup
ON DATABASE
BEGIN
    INSERT INTO database_log VALUES(SYSDATE);
END;
