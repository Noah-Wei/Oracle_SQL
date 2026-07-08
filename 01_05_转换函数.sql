-- to_char()函数:将数字或者日期转为字符型
-- 将日期类型转为固定显示格式
SELECT hiredate,to_char(hiredate,'yyyy-mm-dd hh24:mi:ss') FROM emp; 

-- fm:去掉前导0
SELECT hiredate,to_char(hiredate,'fmyyyy-mm-dd') FROM emp; 

SELECT hiredate,to_char(hiredate,'yyyy') AS "YEAR" FROM emp;

SELECT to_char(SYSDATE,'yyyy') AS 年,
       to_char(SYSDATE,'mm')  AS 月,
       to_char(SYSDATE,'dd') AS 日,
       to_char(SYSDATE,'hh24') AS 时,
       to_char(SYSDATE,'mi') AS 分,
       to_char(SYSDATE,'ss') AS 秒,
       to_char(SYSDATE,'day') AS 星期,
       to_char(SYSDATE,'d') AS 星期数字,
       to_char(SYSDATE,'q') AS 季度
FROM dual;

-- 应用：银行设置金额 例：15,232.32
-- to_char()函数设置数字格式
SELECT TRIM(to_char(sal,'9,,999,999.99')) AS 去处空格后,
       to_char(sal,'9,,999,999.99') AS 标准格式,
       to_char(sal,'$9,,999,999.99') AS 美元符,
       to_char(sal,'L9,,999,999.99') AS 本地货币
FROM emp;

-- 把数字转化成固定长度的格式
SELECT To_char(deptno,'000000') FROM emp;
SELECT To_char(deptno,'0') FROM emp;

-- to_number()函数:将数字格式的字符类型转换成纯数字类型
SELECT to_number(100) FROM dual;
-- to_number(参数)：参数必须是数字格式字符串，否则报异常
-- to_number()可以通过抛出异常错误来验证是否是纯数字字符
-- oracle默认将数字格式的字符转为数字类型运算
SELECT '100'+200 FROM dual;

-- to_date()函数:将字符型转为日期类型
SELECT to_date('2010-12-23','yyyy-mm-dd') FROM dual;

SELECT TO_DATE('25 juillet 2023', 'DD MONTH YYYY', 
              'NLS_DATE_LANGUAGE=FRENCH') FROM dual;
