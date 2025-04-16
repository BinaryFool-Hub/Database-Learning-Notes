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

-- 修改为选择约束（如果创建表的时候没有带或其他）
-- 直接修改了字段的属性
ALTER TABLE tables_name
    MODIFY gender ENUM ('男', '女');

