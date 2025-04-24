-- 显示数据拼接后的列并且取别名显示
-- CONCAT() 数据拼接
SELECT CONCAT(name, '你好') as name, CONCAT(chinese, '_', '这是非str拼接') as 语文成绩
FROM table_name;

