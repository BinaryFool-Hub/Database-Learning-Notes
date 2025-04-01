-- PRIMARY KEY 主键不能重复且不为空，不然会报错
-- 设置了 AUTO_INCREMENT 写 0 是自增长

USE python_study;


-- --------------------------------- 表字段主键唯一约束 ---------------------------------
-- 使用关键字 PRIMARY KEY 来定义主键，确保为一性
-- AUTO_INCREMENT
CREATE TABLE tables_name
(
    id       INT PRIMARY KEY,
    name     VARCHAR(15),
    password VARCHAR(15)
);
-- 删除主键约束，不需要指定主键名，因为一个表只有一主键，删除主键约束后，非空约束还在
-- 如果一个字段同时设置了主键和自增长，则不能删除主键约束（无法删除）
ALTER TABLE tables_name
    DROP PRIMARY KEY;
