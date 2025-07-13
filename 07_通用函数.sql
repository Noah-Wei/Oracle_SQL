-- 1.通用函数值nvl2:
--   语句：NVL2(参数1，参数2，参数3)
--   参数1 空置，返回   参数3 的值
--   参数1 非空值，返回 参数2  的值
SELECT NVL2('', '非空', '空值') FROM DUAL;
SELECT NVL2('22', '非空', '空值') FROM DUAL;

SELECT ENAME, SAL, COMM, (SAL + NVL2(COMM, COMM, 0)) * 12 AS "年收入" FROM EMP;

/*
通用函数之NULLIF:
        语法：NULLIF(参数1，参数2)
        参数1 = 参数2 ，返回 null
        参数1 != 参数2，返回参数1
 */
SELECT NULLIF(1, 1) FROM DUAL;
SELECT NULLIF(1, 2) FROM DUAL;

/*
通用函数之DECODE：
*/
SELECT ENAME,
       DECODE(DEPTNO, 20, '20部门', 10, '20部门', 30, '30部门', '没有部门') AS "部门名称"
  FROM EMP;

-- 1.利用 decode 函数，判断男女。
-- 要求：如果一个数是奇数返回“男”，否则返回“女”
SELECT DECODE(MOD(&N, 2), 1, '男', 0, '女') FROM DUAL;

SELECT CASE
           WHEN MOD(&N, 2) = 1 THEN
            '男'
           ELSE
            '女'
       END AS "判断男女"
  FROM DUAL;

-- 2.利用 decode 函数，验证雇员表 emp 的员工入职时间，如果是6月份入职的，返回上半年，如果是7月份入职的，返回下半年，否则返回未知

SELECT ENAME,
       DECODE(EXTRACT(MONTH FROM HIREDATE), 6, '上半年', 7, '下半年', '未知年份') AS "入职时间"
  FROM EMP;

-- 2.1利用 decode 函数，验证雇员表 emp 的员工入职时间，如果是6月份以前入职的，返回上半年，如果是6月份以后入职的，返回下半年，否则返回未知
SELECT ENAME,
       CASE
           WHEN EXTRACT(MONTH FROM HIREDATE) <= 6 THEN
            '上半年'
           WHEN EXTRACT(MONTH FROM HIREDATE) > 6 THEN
            '下半年'
           ELSE
            '未知'
       END AS "入职时间"
  FROM EMP;

-- 3.利用 decode 函数，验证当前月份工作日多少天
WITH DAYS_IN_MONTH AS
 (SELECT TRUNC(SYSDATE, 'MM') + LEVEL - 1 AS DAY
    FROM DUAL
  CONNECT BY LEVEL <= TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE), 'DD'))),
WORKDAYS AS
 (SELECT DAY,
         DECODE(TO_CHAR(DAY, 'DY', 'NLS_DATE_LANGUAGE=AMERICAN'), 'SAT', 0, 'SUN', 0, 1) AS IS_WORKDAY
    FROM DAYS_IN_MONTH)
SELECT COUNT(*) AS 工作日天数 FROM WORKDAYS WHERE IS_WORKDAY = 1;
