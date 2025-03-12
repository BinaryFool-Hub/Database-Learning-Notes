-- 本文件为语法练习数据，如果需要全选运行即可

CREATE DATABASE IF NOT EXISTS databases_name CHARACTER SET 'utf8mb4';

USE databases_name;

CREATE TABLE IF NOT EXISTS table_name
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(20),
    chinese FLOAT,
    math    FLOAT,
    english FLOAT,
    total   TEXT
);

-- 重置表
TRUNCATE table_name;

INSERT INTO table_name (id, name, chinese, math, english, total)
VALUES (0, '张三', 60, 70.1, 80.1111, '111'),
       (0, '李四', 60, 70.2, 80.124343, '111'),
       (0, '王五', 60, 70.5, 80.45435, '111'),
       (0, '张张1', 60, 70.5, 80.45435, '111'),
       (0, '张张2', 60, 70.5, 20, '111'),
       (0, '张张3', 60, 70.5, 30, '111'),
       (0, '张张4', 60, 70.5, 50, '111'),
       (0, '张张5', 60, 70.5, 90, '111'),
       (0, '张张6', 60, 70.5, 190, '111'),
       (0, '张张6', 60, 70.5, 190, '111'),
       (null, '张张6', 60, 70.5, 190, '111'),
       (0, '张张6', 60, 70.5, 190, '111'),
       (0, '张张7', 60, 70.5, 180, null),
       (0, '张张8', 60, 70.5, 170, null),
       (null, '赵六', 60, 70.9, 80.1, null);

