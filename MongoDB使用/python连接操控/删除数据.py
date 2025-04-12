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

"""删除数据"""
# table.delete_one({"age": {"$gt": 50}})  # 找到第一个满足条件的，然后删除age大于50的
table.delete_many({"age": {"$gt": 50}})  # 找到所有满足条件的，然后删除age大于50的

client.close()
