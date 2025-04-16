USE python_study;

-- --------------------------------- 表字段的唯一约束 ---------------------------------
-- 使用关键字跟在字段后面 UNIQUE ，当插入值在这个字段中有了会报错
CREATE TABLE table_name
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(20) UNIQUE,
    notes VARCHAR(20)
);

-- 删除这个自动创建的同名索引，当使用关键字 UNIQUE 会创建一个同名索引
ALTER TABLE table_name
    DROP INDEX name;

-- 添加唯一约束
ALTER TABLE table_name
    ADD UNIQUE (name);
