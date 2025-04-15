import redis

client = redis.Redis(
    host='192.168.171.136',
    port=6379,
    decode_responses=True,
    password='root',
    db=0
)

"""新增数据"""
# name表示键名，后续的键值对表示第一个是值，第二个是权重分数
client.zadd('name', {'m1': 1, 'm2': 2, 'm3': 3})

"""获取有序集合元素个数"""
print(client.zcard('name'))

"""
将键和值一起输出(值和权重)
withscores=True 
"""
print(client.zrange('name', 0, -1, withscores=True))

client.close()
