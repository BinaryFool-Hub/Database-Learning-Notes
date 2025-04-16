-- 版本要求较高 8.0+

USE python_study;

-- --------------------------------- 表字段检查约束 ---------------------------------
-- 使用函数 CHECK() 来检查插入的数据是否满足条件，不能满足则报错
CREATE TABLE tables_name
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(15),
    password VARCHAR(15),
    CONSTRAINT chk_password_length
        CHECK (LENGTH(password) > 6 AND LENGTH(password) < 20) -- 长度需要满足才能插入数据
);

-- 删除检查约束
-- 直接写入创建的约束名即可
ALTER TABLE tables_name
    DROP CONSTRAINT chk_password_length;

-- 添加检查约束
ALTER TABLE tables_name
    ADD CONSTRAINT chk_password_length CHECK (LENGTH(password) > 6 AND LENGTH(password) < 20);
