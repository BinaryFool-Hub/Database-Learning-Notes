USE python_study;

-- --------------------------------- 表字段选择约束 ---------------------------------
-- 使用函数 ENUM() 来获取选择，如果插入的值不在里面则抛出错误
-- 值不固定，可以多个，官方说明最大值数量为（65535）
CREATE TABLE tables_name
(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    name   VARCHAR(15),
    gender ENUM ('男', '女', '妖')
);
