import pymongo
import random

# 没有刻意设置通常不需要账号密码
client = pymongo.MongoClient(
    host='192.168.171.128',
    port=27017,
    username="root",
    password="root"
)

"""指定数据库，无则自动创建"""
# 方法一
db = client['test_databases']
# 方法二
# db = client.test

"""指定集合，无则自动创建"""
table = db["table"]

"""插入单条数据"""
data = {
    'author': '小明',
    'age': random.randint(3, 90),
    'text': '我的第一篇博客文章',
    'tags': ['python', 'mongodb', 'pymongo'],
}
table.insert_one(data)

"""插入多条数据"""
datas = [
    {
        'author': 'Abc',
        'text': '我的第一篇博客文章',
        'age': random.randint(3, 90),
        'tags': ['python', 'mongodb', 'pymongo'],
    },
    {
        'author': 'Abd',
        'text': '我的第一篇博客文章',
        'age': random.randint(3, 90),
        'tags': ['python', 'mongodb', 'pymongo'],
    },
    {
        'author': 'Ab1',
        'text': '我的第一篇博客文章',
        'age': random.randint(3, 90),
        'tags': ['python', 'mongodb', 'pymongo'],
    }
]
table.insert_many(datas)

client.close()
