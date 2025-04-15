import redis

client = redis.Redis(
    host='192.168.171.136',
    port=6379,
    decode_responses=True,
    password='root',
    db=0
)

"""新增数据"""
client.sadd('set1', '1', '2', '3', '4')  # 第一个是集合的键，剩下的都是值
client.sadd('set2', '0', '2', '3', '4')  # 第一个是集合的键，剩下的都是值

"""查看数据"""""
print("返回集合类型：", client.smembers('set1'))  # 返回set
print("返回元组(0, 列表)：", client.sscan('set1'))  # 返回数据书元组，0是固定，然后是列表形式的数据

"""交集"""
print("交集：", client.sinter(['set1', 'set2']))

"""并集"""
print("并集", client.sunion(['set1', 'set2']))

"""差集"""
print("set1比set2的差集：", client.sdiff(['set1', 'set2']))
print("set2比set1的差集：", client.sdiff(['set2', 'set1']))

"""做完差集之后保存到新的集合"""
client.sdiffstore('set3', ['set1', 'set2'])
print("存储为新的集合：", client.smembers('set3'))

client.close()
