-- 在插入数据的时候没有给值，则使用默认值（不能显式插入 NULL，不然还是NULL）

USE python_study;

-- --------------------------------- 表字段默认值一约束 ---------------------------------
-- 使用 DEFAULT 关键字来定义默认值的约束
CREATE TABLE tables_name
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(15) DEFAULT '默认值',
    password VARCHAR(15)
);

