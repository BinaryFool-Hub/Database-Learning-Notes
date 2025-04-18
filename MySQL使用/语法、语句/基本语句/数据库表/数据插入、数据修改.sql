-- --------------------------------- 使用数据库 ---------------------------------
USE databases_name;

-- --------------------------------- 插入数据 ---------------------------------

-- id 为 0 是自增长，不写(null)也是自增长
INSERT INTO table_name (id, name, chinese, math, english)
VALUES (1, '张三', 60, 70, 80),
       (null, '李四', 60, 70, 80),
       (3, '王五', 60, 70, 80),
       (0, '赵六', 60, 70, 80);

-- 插入指定列数据就写指定列即可，如果有自增长会默认进行自增长，无则为null
INSERT INTO table_name (name, chinese, english)
VALUES ('张李', 60, 180),
       ('李四', 60, null);

-- 也可以不指定插入的列，会自动获取内容，但是列数需要对应的正确
INSERT INTO table_name
values (null, '张三', 20, 30, 30, null);


-- 查询后的结果插入到其他表，new_name需要已经存在，字段兼容
-- 如果需要指定字段查询查插入可以把*替换为你的字段，插入表的字段用()加上对应的兼容字段即可
-- 如果需要跟随条件查询select语句后面可以跟where条件
INSERT INTO new_name
SELECT *
FROM test_table;


-- --------------------------------- 修改表指定内容 ---------------------------------
-- 修改 id 为 1 的行 total 列的值和 name 列的值
UPDATE table_name
SET total = 100,
    name  = '小明'
WHERE id = 1;

-- --------------------------------- 删除表指定数据 ---------------------------------
-- 删除id为2的行
DELETE
FROM table_name
WHERE id = 2;

