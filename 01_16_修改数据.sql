-- 1.修改数据的关键字：update
SELECT * FROM E;

-- 案例1：单行数据修改
UPDATE E SET 员工工资 = 3000, 部门编号 = 20，部门名称 = '销售部'
WHERE 员工姓名 = 'KING';

-- 2.exists:存在，一般用在where条件后面
-- 注1：exists内部一般接子查询或者表关联查询
-- 注2：exists内部返回数据行结果，那么满足条件，否则就不存在
SELECT 1 FROM dual WHERE 1>2;                                       -- 无返回值

SELECT 1 FROM dual WHERE EXISTS(SELECT 2 FROM dual);                -- 有返回值

SELECT 1 FROM dual WHERE EXISTS(SELECT 2 FROM dual WHERE 1<>1);     -- 无返回值

SELECT 1 FROM dual WHERE EXISTS(SELECT '' FROM dual );              -- 有返回值

SELECT 1 FROM dual WHERE EXISTS(SELECT NULL FROM dual );            -- 有返回值


-- 3. not exists:不存在，一般用在where条件后面
-- 注1：not exists内部一般接子查询或者表关联查询
-- 注2：not exists内部无返回数据行结果，那么满足条件；否则就不存在【与exists相反】
SELECT 1 FROM dual WHERE NOT EXISTS(SELECT 2 FROM dual WHERE 1<>1);     -- 有返回值
