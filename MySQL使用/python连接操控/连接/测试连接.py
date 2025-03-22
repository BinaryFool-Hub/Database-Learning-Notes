# 下载 pymysql 库: pip install pymysql
import pymysql

# 创建数据库连接
connection = pymysql.connect(
    host="192.168.171.128",  # MySQL服务器主机名
    user="BinaryFool",  # MySQL用户名
    password="root",  # MySQL密码
    port=3306,  # 数据库端口，默认为3306
)

# 创建游标对象
cursor = connection.cursor()

# 执行SQL查询，列出所有数据库
cursor.execute("SELECT VERSION()")

# 输出结果, 光标取所有返回
for db in cursor.fetchall():
    print(db[0])

# 关闭游标和连接
cursor.close()
connection.close()
