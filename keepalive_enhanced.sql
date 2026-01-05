-- ==========================================
-- Keep-Alive 脚本（增强版）
-- 作者: Noah
-- 功能: 每隔一定时间执行轻量 SQL 保持连接活跃
-- 日志: 出错时记录到本地日志表
-- ==========================================

-- 1. 可选：创建日志表（只需执行一次）
BEGIN
    EXECUTE IMMEDIATE '
        CREATE TABLE KEEPALIVE_LOG (
            LOG_TIME TIMESTAMP,
            MESSAGE  VARCHAR2(4000)
        )
    ';
EXCEPTION
    WHEN OTHERS THEN
        -- 表已存在时忽略
        NULL;
END;
/

-- 2. 主循环块
DECLARE
    v_dummy NUMBER;
    v_interval_sec CONSTANT NUMBER := 100;  -- 保活间隔（秒），可修改
BEGIN
    LOOP
        BEGIN
            -- 保活查询
            SELECT 1 INTO v_dummy FROM DUAL;
        EXCEPTION
            WHEN OTHERS THEN
                -- 记录错误到日志表
                BEGIN
                    INSERT INTO KEEPALIVE_LOG(LOG_TIME, MESSAGE)
                    VALUES(SYSTIMESTAMP, '保活查询异常: ' || SQLERRM);
                    COMMIT;
                EXCEPTION
                    WHEN OTHERS THEN
                        NULL; -- 记录日志失败忽略
                END;
        END;

        -- 等待指定秒数
        DBMS_LOCK.SLEEP(v_interval_sec);
    END LOOP;
END;
/
