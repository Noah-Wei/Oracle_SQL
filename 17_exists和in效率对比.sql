-- 项目实际案例：对比IN与EXISTS效率
-- 查询具有订单信息的用户
-- 1. 创建两张表
-- 用户表
CREATE TABLE T_USER(
U_ID NUMBER(4),
U_NAME VARCHAR2(15),
U_ADDR VARCHAR2(100)
);


-- 订单表
CREATE TABLE T_ORDER(
O_ID NUMBER(4),
U_ID NUMBER(4),
O_NAME VARCHAR2(50)
); 

-- 查询表
SELECT * FROM T_USER;
SELECT * FROM T_ORDER;

-- 2. 插入表数据
INSERT ALL INTO T_USER
VALUES
    (1, '张三', '济南市历下区') INTO T_USER
VALUES
    (2, '李四', '上海市浦东新区') INTO T_USER
VALUES
    (5, '王五', '北京市朝阳区') INTO T_ORDER
VALUES
    (1001, 1, '张三的订单') INTO T_ORDER
VALUES
    (1002, 2, '李四的订单')
    SELECT 1 FROM DUAL;

-- 3.in的当时查询表连接
/*
执行顺序：
    step1：【内层表t_order表】             u_id
                                            1
                                            2
    step2：【外层表t_user表】              u_id
                                            1
                                            2
                                            5
    step3：【内层表t_order表】每一行与【外层表t_user表】 做笛卡尔积
            u_id                            u_id
              1                             1
              1                             2
              1                             5
              2                             1
              2                             2
              2                             5
    step4：where与in的等值条件，过滤掉不符合条件的行数据
                1, '张三', '济南市历下区'
                2, '李四', '上海市浦东新区'
              
                                  
*/
SELECT U.U_ID, U.U_NAME, U.U_ADDR, O.O_ID, O.O_NAME
FROM   T_USER U, T_ORDER O
WHERE  U.U_ID = O.U_ID;

SELECT U.U_ID, U.U_NAME, U.U_ADDR, O.O_ID, O.O_NAME
FROM   T_USER U
JOIN   T_ORDER O ON U.U_ID = O.U_ID;

SELECT U.U_ID, U.U_NAME, U.U_ADDR
FROM   T_USER U
WHERE  U.U_ID IN (SELECT U_ID FROM T_ORDER);

-- 4.使用exists实现
/*
执行顺序：

    step1：【外层表t_user表】              u_id
                                            1
                                            2
                                            5                
    step2：【外层表t_user表】每一行与 【内层表t_order表】
            u_id                u_id
              1                     1
              2                     2
              5                     无
              
                                  
*/
SELECT U.U_ID, U.U_NAME, U.U_ADDR
FROM   T_USER U
WHERE  EXISTS (SELECT O.U_ID FROM T_ORDER O WHERE O.U_ID = U.U_ID);

-- 5.in与exists应用场景：
/*
    in:子表/内表的数据量小的时候，使用in查询的效率更高
        因为内部执行流程：先查询内表（以内表为驱动表）
        反之，子表数据量较大，效率反而低
        
    exists：外表/主表的数据量小的时候，使用exists查询的效率更高
        因为内部执行流程：先查询内表（以内表为驱动表）
        反之，子表数据量较大，效率反而低
*/

-- 6. not in 与not exists区别？
