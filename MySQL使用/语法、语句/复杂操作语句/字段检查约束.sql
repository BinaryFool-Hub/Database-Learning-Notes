-- 版本要求较高 8.0+

USE python_study;

-- --------------------------------- 表字段默认值一约束 ---------------------------------
-- 使用函数 CHECK() 来检查插入的数据是否满足条件，不能满足则报错
CREATE TABLE tables_name
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(15),
    password VARCHAR(15) CHECK ( LENGTH(password) > 6 AND LENGTH(password) < 20) -- 长度需要满足才能插入数据
);
