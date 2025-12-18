-- 关闭显示列标题重复（可选）
SET HEADSEP OFF;
-- 设置行宽（关键）
SET LINESIZE 300;
-- 设置每页行数（避免频繁分页）
SET PAGESIZE 200;
-- 关闭自动换行（适用于部分版本）
SET WRAP OFF;
-- 关闭显示行号（可选）
-- SET NUMWIDTH 10;
-- 清除列格式缓存（可选）
-- CLEAR COLUMNS;

-- 调整时间显示
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD HH24:MI:SS';