USE python_study;

-- 多个字段同时和历史相同的时候插入才会报错

-- --------------------------------- 多个表字段的符合唯一约束 ---------------------------------
-- 使用表级约束语法
-- uk_name_password（"uk"通常表示"unique key"）, 同时约束 name 和 password 不能同时和历史相同
CREATE TABLE tables_name
(
    id       INT NOT NULL AUTO_INCREMENT,
    name     VARCHAR(25),
    password VARCHAR(16),
    CONSTRAINT uk_name_password UNIQUE (name, password),
    PRIMARY KEY (id)
);