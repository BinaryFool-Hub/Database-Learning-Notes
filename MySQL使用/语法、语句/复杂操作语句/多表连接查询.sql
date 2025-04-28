USE python_study;

-- --------------------------------- 多表字段连接查询（内连接） ---------------------------------
# 连接的表必须是有关系的，最好是主外键关系
# 三张表连接在前两个表`ON`条件后使用`INNER JOIN`添加再`ON`条件即可
# 可以自己连接自己，又称为自连接

-- 查询字段是两张表中的，使用 INNER JOIN 进行内部连接另一张表，连接条件使用 ON 关键字连接
SELECT name, title, author_id
FROM author
         INNER JOIN article ON author.id = article.author_id;

-- 字段同名的情况可以使用表加点
SELECT article.name, article.title, article.author_id
FROM author
         INNER JOIN article ON author.id = article.author_id;

-- 字段同名的情况可以使用别名
SELECT a1.name, a2.title, a2.author_id
FROM author a1
         INNER JOIN article a2 ON a1.id = a2.author_id;

-- --------------------------------- 多表字段连接查询（外连接） ---------------------------------
-- 左外连接：left join
-- 在left关键字左边的是主表，右侧的是其他表，当右侧的表内容不存在左侧的条件时以null填充
SELECT *
FROM table1
         LEFT JOIN table2 ON table2.sno = table1.sno;

-- 外连接：左外连接：right join
-- 和 left 相反的结果，以右侧的表为主表
SELECT *
FROM table1
         RIGHT JOIN table2 ON table2.sno = table1.sno;
