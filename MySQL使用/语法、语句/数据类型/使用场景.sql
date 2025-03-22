-- 数据类型常用于字段相关

-- 存在则不创建数据库，指定编码防止乱码
CREATE DATABASE IF NOT EXISTS test CHARACTER SET 'utf8mb8';

-- 使用这个数据
USE test;

-- 创建一个数据库表
CREATE TABLE table_name
(
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(20),
    chinese  FLOAT,
    math     INT,
    english  FLOAT,
    gender   CHAR,
    birthday DATE,
    notes    TEXT
);

