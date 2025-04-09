# 修改配置文件（推荐）

1. 找到 MongoDB 的配置文件（通常位于 /etc/mongod.conf 或安装目录下的 mongod.conf）
2. 修改网络绑定设置：
    ```
    net:
        port: 27017
        bindIp: 0.0.0.0  # 允许所有IP连接，或指定特定IP如 192.168.1.100
    ```
3. 重启 MongoDB 服务：
   ```
   sudo systemctl restart mongod
   ```