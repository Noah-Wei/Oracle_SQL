-- 0.关联更新
-- 1.子查询更新
SELECT * FROM STUDENT;
SELECT * FROM BOY;

INSERT INTO BOY VALUES (38, 'zhixuan');

-- 案例：源数据表 boy同步更新 目标表 student对应的name字段
UPDATE STUDENT S
SET    S.NAME =
       (SELECT B.NAME FROM BOY B WHERE B.ID = S.ID)
WHERE  EXISTS (SELECT 1 FROM BOY B WHERE B.ID = S.ID);

-- 2.内联视图更新(inline view)
-- 案例：源数据表 boy同步更新 目标表 student对应的name字段
UPDATE (SELECT S.NAME S_NAME, B.NAME B_NAME
        FROM   STUDENT S
        JOIN   BOY B ON S.ID = B.ID)
SET    S_NAME = B_NAME;


-- 注意：内联视图要求，源数据表内的关联字段必须设置为主键（唯一性和非空性）
-- 添加源数据表主键约束
ALTER TABLE boy ADD CONSTRAINT pk_id PRIMARY KEY(ID);


-- 
TRUNCATE TABLE student;
