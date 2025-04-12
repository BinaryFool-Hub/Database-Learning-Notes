import pymongo
import re

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

"""正则匹配查询"""

# re.I 忽略大小写(修正符)
# ^ 以什么开头
res = table.find({'author': {'$regex': re.compile('^a', re.I)}})
for i in res:
    print(i)

client.close()
