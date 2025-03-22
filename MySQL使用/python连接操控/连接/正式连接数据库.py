import pymysql

# 创建数据库连接
connection = pymysql.connect(
    host="192.168.171.128",  # MySQL服务器主机名
    user="BinaryFool",  # MySQL用户名
    password="root",  # MySQL密码
    database='databases_name',  # 数据库名称，需要是已经创建的
    port=3306,  # 数据库端口，默认为3306
    charset='utf8mb4',  # 字符编码
    cursorclass=pymysql.cursors.DictCursor  # 设置游标类型，返回字典格式的结果
)

# 使用 cursor() 方法创建一个游标对象 cursor
cursor = connection.cursor()

# 执行SQL查询
cursor.execute("SELECT VERSION()")

# 获取单条数据
data = cursor.fetchone()
# 获取全部数据
# data = cursor.fetchall()
# 获取多行数据
# data = cursor.fetchmany(size=10)

print("Database version : %s " % data)

# 关闭游标和连接
cursor.close()
connection.close()
