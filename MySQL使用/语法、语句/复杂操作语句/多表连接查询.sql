USE python_study;

-- --------------------------------- 多表字段连接查询 ---------------------------------
-- 查询字段是两张表中的，使用 INNER JOIN 进行内部连接另一张表，连接条件使用 ON 关键字连接
SELECT name, title, author_id
FROM author
         INNER JOIN article ON author.id = article.author_id;