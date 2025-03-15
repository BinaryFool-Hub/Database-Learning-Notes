# 格式化查询会自动是被布尔结果，True 就会返回全部
import pymysql

# 创建数据库连接
connection = pymysql.connect(
    host="192.168.171.128",
    user="BinaryFool",
    password="root",
    database='databases_name',
    port=3306,
    charset='utf8mb4',
)

# 使用 cursor() 方法创建一个游标对象 cursor
cursor = connection.cursor()

# sql 语句
sql = """
SELECT * FROM table_name WHERE name = '%s';
"""

# 执行SQL查询
cursor.execute(sql % "'or 0=0 or'")  # 会返回所有，因为布尔结果为 True
# cursor.execute(sql % '张三') # 这就不会返回所有，只返回查询的结果

result = cursor.fetchall()
print(result)

# 关闭游标和连接
cursor.close()
connection.close()
