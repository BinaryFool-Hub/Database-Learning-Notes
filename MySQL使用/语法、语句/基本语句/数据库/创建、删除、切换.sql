-- --------------------------------- 创建数据库 ---------------------------------

-- 方法一，简单创建
CREATE DATABASE databases_name;

-- 方法二，指定字符集，有效的防止数据乱码
-- 如果你在创建数据库时已经指定了字符集（如 utf8mb4），表会默认继承数据库的字符集和排序规则。
-- utf8 编码不能存储 4 字节的字符，比如一些表情符号（Emoji）和一些不常用的汉字
-- utf8mb4 它可以存储 4 字节的字符，所有 Unicode 字符，包括表情符号（如 😊、❤️ 等）。
CREATE DATABASE databases_name CHARACTER SET 'utf8mb4';

-- 方法三，存在则不创建
CREATE DATABASE IF NOT EXISTS databases_name;

-- 推荐使用，防止乱码又不会重复创建报错
CREATE DATABASE IF NOT EXISTS databases_name CHARACTER SET 'utf8mb4';

-- --------------------------------- 删除数据库 ---------------------------------
DROP DATABASE databases_name;

-- --------------------------------- 切换数据库 ---------------------------------
USE databases_name;
