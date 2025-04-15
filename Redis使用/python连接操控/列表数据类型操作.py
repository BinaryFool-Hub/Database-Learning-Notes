import redis

client = redis.Redis(
    host='192.168.171.136',
    port=6379,
    decode_responses=True,
    password='root',
    db=0
)

"""添加数据"""
# 第一个参数是键的名字，其余的都是值(可以多个)
client.lpush('list', 'a', 'b', 'c', 'd')  # lpush从顶部添加，rpush从底部添加, 没有则创建

"""获取长度"""
# 传入键的名字
print(client.llen(name='list'))

"""插入数据"""
# 插入的位置是基于refvalue参数和where参数决定的，在refvalue参数的什么位置where
# where： after  before
client.linsert(name='list', where='after', refvalue='b', value='插入的数据')

"""修改数据"""
# 把第0个索引的值改为12
print(client.lset(name='list', index=0, value='12'))

"""删除数据"""
client.lpop(name='list')  # lpop删除头部第一个数据,rpop删除尾部第一个数据
client.lrem(name='list', count=0, value='插入的数据')  # 更详情的看redis语法，这里是移出所有与`插入的数据`相同的数据

"""查看数据"""
# 也可以指定查看范围
print(client.lrange(name='list', start=0, end=-1))  # 查看全部数据

client.close()
