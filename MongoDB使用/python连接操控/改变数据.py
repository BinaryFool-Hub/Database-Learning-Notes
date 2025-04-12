import pymongo

# 没有刻意设置通常不需要账号密码
client = pymongo.MongoClient(
    host='192.168.171.128',
    port=27017,
    username="root",
    password="root"
)

"""创建数据库，无则自动创建"""
# 方法一
db = client['test_databases']
# 方法二
# db = client.test

"""创建集合"""
table = db["table"]

"""改变数据"""

# 替换数据
# ！注意：是重写了整条数据，如果字段没有在第二个参数中写的话就为空了
table.replace_one({"author": "小明"}, {"author": "小黑", "field": "这是被重新写入的语句，之前的字段没有了"})

# 更新数据
# 不会重写整条数据
table.update_one({"author": "小明"}, {"$set": {"field": "这是被更新的字段之前的字段还在"}})  # 只更新找到的第一条数据
# table.update_many({"author": "小明"}, {"$set": {"field": "这是被更新的字段之前的字段还在"}})  # 更新全部数据

client.close()
