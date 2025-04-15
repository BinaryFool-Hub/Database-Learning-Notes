USE python_study;

-- --------------------------------- 表字段的唯一约束 ---------------------------------
-- 使用关键字跟在字段后面 UNIQUE ，当插入值在这个字段中有了会报错
CREATE TABLE table_name
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(20) UNIQUE,
    notes VARCHAR(20)
);

-- (推荐) 删除这个自动创建的同名索引，当使用关键字 UNIQUE 会创建一个同名索引
ALTER TABLE table_name
    DROP INDEX name;

-- 修改字段的唯一约束，等于修改了创建表的创建字段语句，如果有其他关键字语句也需要添加上去
-- MODIFY： 修改
-- COLUMN： 列
-- 修改了name列只有VARCHAR(20)特性
ALTER TABLE table_name
    MODIFY COLUMN name VARCHAR(20);

