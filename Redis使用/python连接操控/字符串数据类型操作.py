import redis
import time

client = redis.Redis(
    host='192.168.171.136',
    port=6379,
    decode_responses=True,
    password='root',
    db=0
)

"""
添加单条数据(不必要参数可选)
-- name: 存放的是key
-- value: 存放的是值
-- ex: 存放的是过期时间
"""
client.set(name='name', value='小明', ex=10)  # 添加数据
print("过期时间未达到：" + client.get(name='name'))  # 获取数据
time.sleep(10)  # 等待10秒查看是否还能获取到
print("过期时间达到了" + client.get(name='name'))  # 获取数据

"""
添加多条数据(不必要参数可选)
"""
client.mset({'name': '小明', 'age': 19, 'ex': 1})  # 添加多条数据
print("同时取多个值为：" + client.mget(['name', 'age']))  # 取多个值

client.close()
