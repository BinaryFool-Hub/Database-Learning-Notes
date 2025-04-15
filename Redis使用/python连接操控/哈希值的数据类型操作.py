import redis

client = redis.Redis(
    host='192.168.171.136',
    port=6379,
    decode_responses=True,
    password='root',
    db=0
)

"""新增数据"""
# 在语法、语句文件中介绍到了，类似于python里面的字典中的字典
# 键 字段 值
client.hset('user1', 'name', '小明')
client.hset('user1', 'age', '18')

"""取值"""
print(client.hget('user1', 'name'))

"""多个值一起操作"""
# 版本原因hmset可能弃用，但是还可用，会出现警告
client.hmset('user1', {'name': '小明', 'age': 26})  # 新增多个值
print(client.hgetall('user1'))  # 获取全部

client.close()
