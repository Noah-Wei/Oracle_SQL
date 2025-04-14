-- 虚表dual：维护完整的查询结构x
SELECT 1 FROM DUAL;

-- 1.upper():字符串 转大写;lower() 转小写;
SELECT UPPER('hello') AS "大写" FROM DUAL;

SELECT LOWER('WORLD') AS "小写" FROM DUAL;

-- 2.initcap():将每个单词的首字母大写，其余小写，默认以空格区分;
SELECT INITCAP('hello world pYTHON') FROM DUAL;

SELECT EMPNO, INITCAP(ENAME) FROM EMP;

-- 3.concat()或者拼接符号 || :拼接字符函数  
-- CONCAT()最多只有两个参数
SELECT CONCAT('hello', 'Python') FROM DUAL;
SELECT 'hello' || 'Python' FROM DUAL;
-- 拼接三个参数
SELECT CONCAT(CONCAT('hello', 'Python'), 'Java') FROM DUAL;
SELECT 'hello' || 'Python' || 'java' FROM DUAL;

-- 4.substr():截取字符串
/*
基本语法
  SUBSTR(string, start_position [, length])
参数说明
  string: 要截取的源字符串
  start_position: 开始截取的位置（正整数表示从左向右，负整数表示从右向左）
  length (可选): 要截取的子字符串长度。如果省略，则从 start_position 开始截取到字符串末尾
注意事项
  Oracle 中字符串位置从 1 开始计数，不是从 0 开始
  如果 start_position 为 0，Oracle 会将其视为 1
*/
SELECT ENAME, SUBSTR(ENAME, 0) AS "截取名字" FROM EMP;

SELECT ENAME, SUBSTR(ENAME, 1, 1) AS "截取名字" FROM EMP;

SELECT ENAME, SUBSTR(ENAME, -1, 2) AS "截取名字" FROM EMP;
SELECT ENAME, SUBSTR(ENAME, -1, 1) AS "截取名字" FROM EMP;

-- 5.length():获取字符串长度的函数，它返回字符串中的字符数
/*
基本语法
   LENGTH(string)
参数说明
   string: 要计算长度的字符串表达式，可以是字符串常量、列名或变量
*/
-- 要求显示所有雇员的姓名和姓名的后三个字符
SELECT ENAME AS "姓名", SUBSTR(ENAME, -3) AS "后三位" FROM EMP;
SELECT ENAME AS "姓名", SUBSTR(ENAME, LENGTH(ENAME) - 2) AS "后三位" FROM EMP;

-- 6.REPLACE():用于字符串替换的函数，它可以搜索并替换字符串中的指定子串。
/*
基本语法
   REPLACE(string, search_string [, replacement_string])
参数说明
   string: 原始字符串（可以是列名、变量或字符串常量）
   search_string: 要查找的子串
   replacement_string (可选): 替换后的新子串。如果省略，则删除所有匹配的 search_string
*/
SELECT '192.168.1.63' AS "替换前", REPLACE('192.168.1.63','.','/') AS "替换后" FROM dual;
SELECT '123    456   789  ' AS "替换前",REPLACE('123    456   789  ',' ') AS "替换后" FROM dual; 
SELECT '123    456   789  ' AS "替换前",REPLACE('123    456   789  ',' ','') AS "替换后" FROM dual; 

-- 7.ASCII():用于获取字符 ASCII 码值的函数，它返回字符串中第一个字符的 ASCII 码值
/*
基本语法
   ASCII(char)
参数说明
   char: 要获取 ASCII 码的字符或字符串（如果输入是字符串，只返回第一个字符的 ASCII 码）
常用字符的ASCII编码
   'A'~'Z':65~90
   'a'~'z':97~122
   '0'~'9':48~57
*/
SELECT ASCII('A') FROM dual;
SELECT ASCII('ABC') FROM dual;

-- 8.CHR():将 ASCII 码转换为对应字符的函数，它与 ASCII 函数功能相反
/*
基本语法
   CHR(n [USING NCHAR_CS])
参数说明
   n: 要转换的 ASCII 码值（数值类型）
   USING NCHAR_CS (可选): 指定使用国家字符集（NCHAR）而非数据库字符集
*/
SELECT CHR(100) FROM dual;

-- 9.LPAD():用于左侧填充字符串的函数，它可以在字符串的左侧填充指定的字符，直到字符串达到指定的长度。
--   RPAD():右补齐
/*
基本语法
   LPAD(string, target_length [, pad_string])
参数说明
   string:	原始字符串（可以是列名、变量或字符串常量）
   target_length:	填充后的总长度（数值类型）
   pad_string (可选):	用于填充的字符串，默认为单个空格
特殊注意事项
   截断行为：如果原始字符串长度 > target_length，LPAD 会从右侧截断字符串
   NULL 处理：如果 string 为 NULL，结果返回 NULL
   多字节字符：对于多字节字符集，长度计算可能不同
   pad_string 为空：如果 pad_string 为空字符串('')，返回原字符串
*/
SELECT LPAD('HELLO W',10) AS "左补齐" FROM DUAL;
SELECT LPAD('HELLO W',10,'*') AS "左补齐" FROM DUAL;
SELECT LPAD('HELLO W',7,'*') AS "左补齐" FROM DUAL;

SELECT RPAD('HELLO W',10) AS "左补齐" FROM DUAL;
SELECT RPAD('HELLO W',10,'*') AS "左补齐" FROM DUAL;
SELECT RPAD('HELLO W',5,'*') AS "左补齐" FROM DUAL;

-- 10.TRIM()：用于去除字符串首尾指定字符的函数，它可以灵活地去除字符串开头或结尾（或两端）的特定字符
/*
基本语法
   TRIM([LEADING|TRAILING|BOTH] [trim_character] FROM] source_string)
参数说明
   LEADING:	只去除开头的字符
   TRAILING:	只去除结尾的字符
   BOTH:	去除两端的字符（默认选项）
   trim_character:	要去除的字符（默认为空格）
   source_string:	原始字符串
*/
-- 去除两边的空格
SELECT TRIM('   123   4556   ') FROM DUAL;
-- 去除左边的空格
SELECT TRIM(LEADING  FROM '   123   4556   ') AS "结果" FROM dual;
-- 去除右边的空格
SELECT TRIM(TRAILING FROM '   123   4556   ') AS "结果" FROM dual;


-- 11.TRANSLATE():用于字符级替换的函数，它按照字符一一对应的方式执行替换操作，与 REPLACE 函数的整体替换不同
/*
基本语法
   TRANSLATE(source_string, from_string, to_string)
参数说明
   source_string: 要进行字符替换的原始字符串
   from_string: 需要被替换的字符集合
   to_string: 替换后的新字符集合
核心特点
  1. 逐字符替换：对 source_string 中的每个字符单独处理
  2. 位置对应：from_string 和 to_string 按字符位置一一对应
  3. 删除功能：如果 to_string 比 from_string 短，多出的字符将被删除
  4. 大小写敏感：替换区分大小写
*/
SELECT TRANSLATE('hello hello world','he','a') FROM dual;
SELECT TRANSLATE('hello hello world','he','aaaa') FROM dual;
SELECT TRANSLATE('hello hello world','he','aa') FROM dual;

SELECT TRANSLATE('ABC123', '123', 'XYZ') FROM dual;
-- 结果: 'ABCXYZ' (逐字符替换)

SELECT REPLACE('ABC123', '123', 'XYZ') FROM dual;
-- 结果: 'ABCXYZ' (整体替换)

SELECT TRANSLATE('AB12', 'A12', 'BX') FROM dual;
-- 结果: 'BBX' (A→B, 1→X, 2被删除)

SELECT REPLACE('AB12', 'A12', 'BX') FROM dual;

SELECT '数字格式' AS "验证数字格式" FROM dual
WHERE TRANSLATE('123123897','#0123456789','*') IS NULL;
