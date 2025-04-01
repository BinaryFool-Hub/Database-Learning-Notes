-- 用户表(无外键)
CREATE TABLE users
(
    user_id  INT PRIMARY KEY,
    username VARCHAR(50)
);

-- 订单表(无外键)
CREATE TABLE orders
(
    order_id INT PRIMARY KEY,
    user_id  INT, -- 逻辑上关联users.user_id，但没有外键约束
    amount   DECIMAL(10, 2)
);

-- 仍然可以进行连接查询
SELECT username, order_id, amount
FROM users AS u
         INNER JOIN orders AS o ON u.user_id = o.user_id;