-- 雇员表每个员工的入职时间+2天,-3天
SELECT HIREDATE, HIREDATE + 2 AS "new hiredate +2" ， HIREDATE - 3 AS "new hiredate -3"
FROM EMP;

-- 雇员表每个员工的入职时间+1小时,+1分钟
SELECT HIREDATE, HIREDATE + 1 / 24 AS "+1h", HIREDATE + 1 / (24 * 60) AS "+1min"
FROM EMP;

-- 日期-日期=数字（为天数）
SELECT SYSDATE FROM DUAL;

-- 获取10部分的员工进入公司星期数
SELECT ENAME, HIREDATE, ROUND((SYSDATE - HIREDATE) / 7) AS "星期数"
FROM EMP
WHERE DEPTNO = 10;

-- ADD_MONTHS()函数：指定月数后推或者前推日期
SELECT sysdate,add_months(SYSDATE,2), add_months(SYSDATE,-2)FROM dual;

-- MONTHS_BETWEEN()函数:指定两个日期间隔月数
SELECT months_between(SYSDATE,hiredate) FROM emp;

-- NEXT_DAY()函数:给定日期下个星期几的日期
SELECT SYSDATE,next_day(SYSDATE,5) FROM dual;

-- last_day()函数：表示当月的最后一天
SELECT last_day(SYSDATE)-2 FROM dual;

-- trunc函数:截取时间，值返回的还是时间类型
SELECT SYSDATE,TRUNC(SYSDATE,'YYYY') AS 年，
       TRUNC(SYSDATE,'MM') AS 月,
       TRUNC(SYSDATE,'DD') AS 日,
       TRUNC(SYSDATE,'mi') AS 分钟,
       TRUNC(SYSDATE,'DY') AS 星期,
       TRUNC(SYSDATE,'HH24') AS 小时

FROM dual;



