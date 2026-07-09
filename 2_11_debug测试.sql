-- debug测试plsql代码的逻辑业务
-- 目的：查找代码执行的整体逻辑是否与结果一致
-- 可以一步步追踪执行过程
-- plsql/developer工具——找到过程名——右键测试
-- 测试之前，授权用户测试过程或者函数标本
GRANT DEBUG ANY PROCEDURE TO scott;
GRANT DEBUG CONNECT SESSION  TO scott;
