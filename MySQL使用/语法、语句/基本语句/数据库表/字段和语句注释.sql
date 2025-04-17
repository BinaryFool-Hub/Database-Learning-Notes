USE python_study;

-- --------------------------------- 字段注释和语句注释 ---------------------------------
-- 使用 COMMENT 后面跟着的字符串就是注释
-- 不仅可以在字段中创建注释也可以在语句中添加注释
CREATE TABLE table_name
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL COMMENT '姓名',
    note VARCHAR(50) COMMENT '备注'
) COMMENT '这是一条创建表的语句注释';
