-- 空字符不是空，null 才是MySQL里面的空

USE python_study;

-- --------------------------------- 表字段的非空约束 ---------------------------------

-- 使用关键字跟在字段后面  NOT NULL ，当插入值为空的时候会报错
CREATE TABLE table_name
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(20) NOT NULL,
    notes VARCHAR(20)
);

-- 修改字段的非空约束，等于修改了创建表的创建字段语句，如果有其他关键字语句也需要添加上去
ALTER TABLE table_name
    MODIFY name VARCHAR(15) NULL;

