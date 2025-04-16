-- PRIMARY KEY 主键不能重复且不为空，不然会报错
-- 设置了 AUTO_INCREMENT 写 0 是自增长

USE python_study;


-- --------------------------------- 表字段主键唯一约束 ---------------------------------
-- 使用关键字 PRIMARY KEY 来定义主键，确保为一性
-- AUTO_INCREMENT
CREATE TABLE tables_name
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(15),
    password VARCHAR(15)
);


-- 如果有自增长AUTO_INCREMENT需要先删除
-- 修改id列只有int属性,如果有其他属性还需要的需要加上，因为这是直接修改了id字段的全部属性
ALTER TABLE tables_name
    MODIFY id INT;

-- 删除主键约束，不需要指定主键名，因为一个表只有一主键，删除主键约束后，非空约束还在
-- 如果一个字段同时设置了主键和自增长，则不能删除主键约束（无法删除）
ALTER TABLE tables_name
    DROP PRIMARY KEY;


# 你不能删除主键的原因可能有以下几种情况：
# 主键列有 AUTO_INCREMENT 属性：在 MySQL 中，如果一个列既是主键又有 AUTO_INCREMENT 属性，你不能直接删除这个主键约束。需要先移除 AUTO_INCREMENT 属性，然后再删除主键。
# 外键约束：如果这个主键被其他表作为外键引用，你需要先删除那些外键约束。
# 唯一索引问题：在某些 MySQL 版本中，主键会自动创建唯一索引，可能会有相关限制。
