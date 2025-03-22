-- --------------------------------- 使用数据库 ---------------------------------
USE databases_name;

-- --------------------------------- 创建数据库表 ---------------------------------

-- PRIMARY KEY 表格主键，不能进行重复
-- AUTO_INCREMENT 自增长
-- 左侧的为键，右侧的为数据类型
CREATE TABLE table_name
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(20),
    score FLOAT
);

-- 没有表才创建（推荐）
CREATE TABLE IF NOT EXISTS table_name
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(20),
    score FLOAT
);

-- --------------------------------- 表插入新的列 ---------------------------------

-- 在 english 列后面插入新的列 total ，指定 FLOAT 数据类型
ALTER TABLE table_name
    ADD COLUMN total FLOAT AFTER english;

-- 在第一列前插入 total 列 ，指定 FLOAT 数据类型
ALTER TABLE table_name
    ADD COLUMN total FLOAT FIRST;

-- 不指定位置默认加在最后列的后面
ALTER TABLE table_name
    ADD COLUMN total FLOAT;

-- --------------------------------- 表格删除列 ---------------------------------

-- 删除 total 列
ALTER TABLE table_name
    DROP total;

-- --------------------------------- 更改表格列数据类型 ---------------------------------

-- 更改 total 列的数据类型为整形
ALTER TABLE table_name
    MODIFY COLUMN total INT;

-- --------------------------------- 修改表名 ---------------------------------

-- 方法一
RENAME TABLE table_name TO table_name1;

-- 方法二
ALTER TABLE table_name RENAME table_name1;

-- --------------------------------- 表重置 ---------------------------------
-- 保存了日志 可以进行恢复
TRUNCATE table_name;
