-- merge应用:匹配上走更新，匹配不上走增加
SELECT * FROM STUDENT;
SELECT * FROM BOY;

-- 案例：源数据表 boy同步更新 目标表 student对应的name字段
-- 如果对应失败，将boy的数据插入到student中
MERGE INTO STUDENT S
USING BOY B
ON (S.ID = B.ID)
WHEN MATCHED THEN
    UPDATE SET S.NAME = B.NAME
WHEN NOT MATCHED THEN
    INSERT VALUES (B.ID,B.NAME, '男') ;
    
