-- --------------------------------- 使用数据库 ---------------------------------
USE databases_name;

-- --------------------------------- 查看表数据 ---------------------------------

-- * 查看所有列
SELECT *
FROM table_name;

-- 指定列
SELECT name, chinese
FROM table_name;

-- 别名显示
SELECT name as 姓名, chinese as 语文
FROM table_name;

-- 列的内容去重显示 DISTINCT ，字段只能是一个
SELECT DISTINCT name
FROM table_name;

-- 显示数据拼接后的列并且取别名显示，这里字符串连接的内容，而不是表里面的列的键，name、chinese才是键，查询出后让字符串拼接展示
-- CONCAT() 数据拼接
SELECT CONCAT(name, '你好') as name, CONCAT(chinese, '_', '这是非str拼接') as 语文成绩
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
-- %这里面填写值% 值包含在列单元格即满足条件
SELECT *
FROM table_name
WHERE name like '%张%';

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

-- 保留几位小数
-- ROUND()
SELECT name, ROUND(english, 2) as 英语成绩
FROM table_name;

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
