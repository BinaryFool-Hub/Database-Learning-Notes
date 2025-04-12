# pip install pymongo
import pymongo

# 连接MongoDB服务
client = pymongo.MongoClient('192.168.171.128', 27017)

print(client)  # 输出对象信息

# 关闭
client.close()
