-- --------------------------------- 使用数据库 ---------------------------------
USE databases_name;

-- --------------------------------- 查看表数据 ---------------------------------

-- * 查看所有列
SELECT *
FROM table_name;

-- 指定列
SELECT name, chinese
FROM table_name;

-- 别名显示使用 AS
SELECT name AS 姓名, chinese AS 语文
FROM table_name;

-- 别名显示直接取
SELECT name 姓名, chinese 语文
FROM table_name;

-- 列的内容去重显示 DISTINCT
-- 后面跟着多个字段只有当两条记录的 字段1 和 字段2 都完全相同时，才会被视为重复
SELECT DISTINCT name, age
FROM table_name;

-- 查询指定数据，并且都加上字符串这一列展示
-- 查询出 name, chinese, math 列的值，并且在第一列标题是名字，所有内容为张三显示
SELECT '张三' as 名字, name, chinese, math
FROM table_name;

-- 条件查询，AND OR，AND 比 OR 更高级，所以先运行 AND
SELECT name, chinese, math, english
FROM table_name
WHERE (english >= 80
    OR english < 100)
  AND name = '张三';

-- 条件查询 IN
SELECT name, chinese, math, english
FROM table_name
WHERE name in ('张三', '李四');

-- 模糊查询
-- % 是通配符，0个或多个
-- _ 是通配符，必须有一个，且只能是一个
-- 例子：`张%`-->查询`张`开头的任何数据。`%张%`-->查询含有`张`字的任何数据。`张_`-->查询`张`字开头且后面所有字符必须只有一个字的数据
SELECT *
FROM table_name
WHERE name LIKE '%张%';

-- 排序显示
-- 默认升序，DESC 降序
-- 查询英语80（包含）-190区间的数据，并且由english列的行大小排名
-- 多个条件排序会优先排序左侧的
SELECT *
FROM table_name
WHERE english >= 80
  AND english < 190
ORDER BY english, chinese DESC;

-- 分页查询
-- 取5条数据，从第9行开始，开始行是0行
SELECT *
FROM table_name
LIMIT 9,5;

-- 类似if else判断操作
-- 判断成绩并且说明，最后END给一个列名
SELECT name,
       chinese,
       english,
       CASE
           WHEN english >= 100 THEN '优秀'
           WHEN english >= 80 THEN '良好'
           ELSE '待努力' END '描述'
FROM table_name;

-- 分组操作
-- 查询 name 并且统计 name 的个数，让 name 进行分组就不会导致返回数据相同和报错
-- 分组就是把很多个相同的数据统一返回一个（3个张三，就返回1个张三，然后后面的数据是统计张三的个数）
SELECT name, COUNT(name) AS name_num
FROM table_1
GROUP BY name;

-- HAVING用于对分组后的数据进行筛选
-- 它常与 GROUP BY 一起使用，作用是在分组聚合之后过滤结果，类似于 WHERE，但 WHERE 是在分组前过滤。
-- 筛选出avg_score <= 60的值
SELECT AVG(score) AS avg_score, student_id
FROM student_table
GROUP BY student_id
HAVING avg_score <= 60;

-- 子查询
-- 在一个查询条件里面再次进行查询，可以使用 = < > 等关系字符或关键字来进行子查询，但是子查询的语句需要使用()来包裹
SELECT name, wages
FROM table_1
WHERE wages in (SELECT wages FROM table_1 WHERE wages > 20000);

-- 给表取别名，然后在条件中使用别名判断
SELECT *
FROM table_1 AS t1,
     table_1 AS t2
WHERE t1.job = '财务顾问'
  AND t2.hobby = '运动'
  AND t1.gender = '男';

-- 把查询到的数据存放到新的表(不需要建立该表)
-- 如果需要指定查询字段加入即可，表的字段会自动获取，不需要指定
-- 如果查询需要跟随条件加入where语句条件即可
CREATE TABLE new_name_table AS
SELECT *
FROM test_table;

-- 查询两者之间(包含)满足条件的数据
-- 查询70-80之间(包含两者)的值，顺序不能调换，小的在前面，不然无满足条件
SELECT *
FROM test_table
WHERE score BETWEEN 70 AND 80;