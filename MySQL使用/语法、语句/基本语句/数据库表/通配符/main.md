# 通配符

常用的通配符主要用于 LIKE 语句中进行模式匹配   
这些通配符可以结合使用，以实现更复杂的模式匹配需求。如果需要更强大的模式匹配功能，可以使用 MySQL 的正则表达式（REGEXP 或 RLIKE）。

| 通配符         | 作用                                               | 示例                                                      | 解释                       |
|-------------|--------------------------------------------------|---------------------------------------------------------|--------------------------|
| %           | 匹配任意数量的字符（包括零个字符）                                | SELECT * FROM users WHERE name LIKE 'J%';               | 匹配所有以 "J" 开头的名字          |
| _           | 匹配单个字符                                           | SELECT * FROM users WHERE name LIKE 'J_hn';             | 匹配 "John"、"Joan" 等名字     |
| [charlist]  | 匹配字符列表中的任意一个字符（MySQL 不支持原生语法，但可以通过正则表达式实现类似功能）   | SELECT * FROM users WHERE name REGEXP '^[Jj]ohn';       | 匹配以 "J" 或 "j" 开头的 "John" |
| [^charlist] | 匹配不在字符列表中的任意一个字符（MySQL 不支持原生语法，但可以通过正则表达式实现类似功能） | SELECT * FROM users WHERE name REGEXP '^[^Jj]ohn';      | 匹配不以 "J" 或 "j" 开头的 "ohn" |
| ESCAPE      | 用于转义通配符字符（如 % 或 _），使其作为普通字符使用                    | SELECT * FROM users WHERE name LIKE '100\%' ESCAPE '\'; | 匹配 "100%" 字符串            |

