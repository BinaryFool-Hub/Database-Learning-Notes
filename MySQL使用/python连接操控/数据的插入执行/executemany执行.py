# executemany 一次性插入多条数据，消耗更少的 io 网络延迟，大量数据的时候更快
# 只支持参数化提交
# [[数据块1], [数据块2]]
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
INSERT INTO table_name (id, name, chinese, math, english)
VALUES (null, %s, %s, %s,%s);
"""

# 执行SQL语句
content = []
data = [['1', '2', '3', '4'] for _ in range(9)]
"""executemany执行，可以融入多条可迭代数据"""
cursor.executemany(sql, data)

"""写入数据库"""
# 提交事件，不然不会写入数据到数据库
connection.commit()

# 关闭游标和连接
cursor.close()
connection.close()
