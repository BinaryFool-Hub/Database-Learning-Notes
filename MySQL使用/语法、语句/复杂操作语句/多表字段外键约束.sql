USE python_study;

-- 外键可以更好的管理我们表之间的联系，当数据过多的时候查找起来更节省时间和更醒目
-- 然后依次查询需要的信息（id）即可
-- 完全可以使用多个外键来继续进行关联操作，只不过多写一句外键语句而已 CONSTRAINT association_id FOREIGN KEY (author_id) REFERENCES author (id)

-- --------------------------------- 多表字段外键约束创建删除 ---------------------------------
-- 先创建主表作者的信息
CREATE TABLE author
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    name  varchar(20),
    phon  char(6),
    hobby varchar(20)
);

-- 再创建子表作者的文章信息
-- 使用外键来关联另一张表
-- association_id：自定义名称
-- FOREIGN KEY (author_id): 用这个字段作为外键
-- REFERENCES author (id): 标记 author 表中的 id 键来进行关联
CREATE TABLE article
(
    id        INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(20),
    body      TEXT,
    author_id INT,
    CONSTRAINT association_id FOREIGN KEY (author_id) REFERENCES author (id)
);

-- 删除外键
ALTER TABLE article
    DROP FOREIGN KEY association_id;

-- 添加新的外键(如果创建表的时候没有外键可以修改)
-- CONSTRAINT：约束，后面跟的是约束的字段
-- FOREIGN KEY (author_id) REFERENCES author (id)：设置author_id为外键，并且author (id)表密码的字段id为约束
ALTER TABLE article
    ADD CONSTRAINT association_id
        FOREIGN KEY (author_id) REFERENCES author (id);

-- --------------------------------- 插入规则 ---------------------------------
-- 插入的数据键必须在外键中已经存在了，不然会报错
INSERT INTO article(title, body, author_id) VALUE ('剑来', '……', 999); -- 不存在，会报错
INSERT INTO article(title, body, author_id) VALUE ('剑来1', '……', 1); -- 存在，不会报错

