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
data.append(['2', '3', '4'])  # 为了体现错误，少了一个数据
data.append(['2', '3', '4', '5'])  # 添加执行到错误点后面数据，会进行执行提交
for i in range(len(data)):
    """
    如果遇到错误就回滚数据库表原来没有提交的状态，但是可以选择停止数据的插入，
    回滚事件必须是写在connection.commit()前面，不然写入数据库后就不能回滚原来的状态了
    
    发生错误位置之前为提交的数据全都不要，后面的数据可以正常插入
    """
    try:
        cursor.execute(sql, data[i])
    except Exception as e:
        print(e)
        connection.rollback()  # 回滚原来的状态
        # break  # 停止继续插入数据

"""写入数据库"""
# 提交事件，不然不会写入数据到数据库
connection.commit()

# 关闭游标和连接
cursor.close()
connection.close()
