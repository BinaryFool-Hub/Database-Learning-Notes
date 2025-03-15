-- as 是表头取别名显示

-- 返回当前时间戳
SELECT UNIX_TIMESTAMP(NOW()) as 时间戳;

-- 返回当前年月日
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d') as 年月日;
