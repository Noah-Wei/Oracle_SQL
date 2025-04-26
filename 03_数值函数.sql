-- 1.ROUND():用于数值四舍五入的函数，它可以对数字进行指定精度的舍入操作。
/*
基本语法
   ROUND(number [, decimal_places])
参数说明
   number:  要进行舍入的数值（可以是列、表达式或字面值）
   decimal_places (可选):  指定保留的小数位数，默认为 0
函数特点
   四舍五入规则：遵循标准的四舍五入规则
   正负位数：
      正数表示小数位数
      负数表示整数部分的舍入位
   NULL 处理：如果输入为 NULL，返回 NULL
   日期支持：也可用于日期类型的舍入
*/
-- 整数位四舍五入
SELECT ROUND(123.4567) FROM DUAL;
SELECT ROUND(123.8567) FROM DUAL;
SELECT ROUND(-123.4567) FROM DUAL;
SELECT ROUND(-123.7567) FROM DUAL;

-- 保留小数点后两位,四舍五入
SELECT ROUND(123.4567, 2) FROM DUAL;

SELECT ROUND(163.4567, -2) FROM DUAL;

-- 2.trunc():用于截断数值或日期的函数，它可以将数值截断到指定的小数位，或将日期截断到指定的时间单位。
/*
基本语法
   对于数值的截断
       TRUNC(number [, decimal_places])
   对于日期的截断
   TRUNC(date [, format])
参数说明
   数值截断参数
       number:	要进行截断的数值
       decimal_places (可选):	指定保留的小数位数，默认为 0
   日期截断参数
       date:	要进行截断的日期
       format (可选):	指定截断的精度单位
*/
-- 截断到整数位
SELECT TRUNC(123.6567) FROM DUAL;

-- 截断到小数点的后两位
SELECT TRUNC(123.6567,2) FROM DUAL;

SELECT TRUNC(123.6567,-2) AS "截取小数点后两位" FROM DUAL;

-- 截取日期
SELECT TRUNC(SYSDATE) FROM dual;  

-- 3.mod()：取余函数
SELECT MOD(10,3) FROM dual;

SELECT MOD(10,5) FROM dual;

SELECT MOD(3,10) FROM dual;

-- 取余数企业中实战
-- 判断奇偶性
SELECT '偶数' FROM dual WHERE MOD(6,2)=0;
SELECT '奇数' FROM dual WHERE MOD(6,2)<>0;

-- 数值函数扩展
/*
dbms_random:oracl内置的包结构
   在该包结构下面有内置的获取随机数函数 value
*/
-- value()默认随机情况，最小值0，最大值不到1，所以0~1之间的小数
SELECT dbms_random.value() FROM dual;

-- 需求：随机10~20之间整数
SELECT TRUNC(dbms_random.value(10,21)) FROM dual;
-- 方式2
SELECT TRUNC(dbms_random.value()*11+10) FROM dual;

-- 需求：随机产生5个整数，范围在10~20之间
SELECT 
   TRUNC(dbms_random.value(10,21)),TRUNC(dbms_random.value(10,21)),
   TRUNC(dbms_random.value(10,21)),TRUNC(dbms_random.value(10,21)),
   TRUNC(dbms_random.value(10,21)) 
FROM dual;
-- 方式2
-- level :伪列
SELECT  TRUNC(dbms_random.value(10,21)) FROM dual  CONNECT BY LEVEL < 6;


