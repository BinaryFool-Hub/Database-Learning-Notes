USE python_study;

-- --------------------------------- 替换 REPLACE ---------------------------------
-- 第一个值是你要操作字符串对象
-- 第二个值是你旧的字符串
-- 第三个值是你新的字符串
-- 会返回替换后的数据，时其接收即可
UPDATE table_name
SET name= REPLACE(name, 'old_str', 'new_str')
WHERE id = 1;
