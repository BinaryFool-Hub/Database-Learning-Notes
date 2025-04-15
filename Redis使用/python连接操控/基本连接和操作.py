import redis

"""
创建客户端连接
decode_responses：默认情况下，redis-py 返回的数据是 bytes 类型，
                  设置后，redis-py 会自动将返回的字节串解码为 Python 字符串（str）：
"""
client = redis.Redis(
    host='192.168.171.136',
    port=6379,
    decode_responses=True,  # 每一次读取都会自动解码
    password='root',  # 如果有设置就需要加上
    db=0  # 选择数据库（可选）
)

"""初始化当前数据库数据"""
client.flushdb()  # 删除当前数据库的所有内容

"""关闭连接"""
client.close()
