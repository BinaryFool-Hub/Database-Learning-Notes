# pip install pymongo
import pymongo

# 连接MongoDB服务
# 没有刻意设置通常不需要账号密码
client = pymongo.MongoClient(
    host='192.168.171.128',
    port=27017,
    username="root",
    password="root"
)

print(client)  # 输出对象信息

# 关闭
client.close()
