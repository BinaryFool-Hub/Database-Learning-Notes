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

"""查看数据"""
# 基本查询
result = table.find({"author": "小明"}, {"_id": 0})  # 第二个参数是不显示id
print(list(result))

# 追加操作符查询
for i in table.find({"age": {"$lt": 50}}):  # 小于50
    print(i)

print("-------------")

# 查询后排序
# {"data": {"$ne": None}} 查询不为空的
for i in table.find({"data": {"$ne": None}}).sort([("age", pymongo.ASCENDING)]):  # 降序DESCENDING，升序ASCENDING
    print(i)

client.close()
