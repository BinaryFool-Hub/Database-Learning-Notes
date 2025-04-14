# 大小写敏感性

- SQL 关键字不区分大小写（SELECT 与 select 相同）
- 数据库名、表名和列名在 Unix/Linux 系统中区分大小写，在 Windows 系统中不区分

## 特殊情况

- 如果标识符包含大写字母，查询时必须保持一致
- 建议使用反引号包裹：
    ```mysql
    SELECT `UserId`, `UserName` FROM `UserTable`;
    ```

# 注释

```mysql
-- 单行注释
# MySQL 特有的单行注释
/* 多行注释 */
```
