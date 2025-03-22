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
data = [['1', '2', '3', '4'] for _ in range(9)]
data.insert(0, ['2', '3', '4'])  # 为了体现错误，少了一个数据
for i in range(9):
    """如果遇到错误就直接跳过，打印错误"""
    try:
        cursor.execute(sql, data[i])
    except Exception as e:
        print(e)

"""写入数据库"""
# 提交事件，不然不会写入数据到数据库
connection.commit()

# 关闭游标和连接
cursor.close()
connection.close()
