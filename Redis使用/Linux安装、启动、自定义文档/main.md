# 介绍

Redis官方没用提供Windows的安装包，市面上看到的都是第三方编写仿照的，    
Redis官方只提供了Linux版本，所以推荐大家使用Linux版本

Redis官方链接：https://redis.io

**下面是使用Debian12来安装Linux操作过程，需要切换到root用户**

# 下载安装

最新的稳定版本始终可在固定的 https://download.redis.io/redis-stable.tar.gz  URL 及其 SHA-256 和 上获得。

## 准备数据和环境

### 创建文件夹存放软件(可选)

```
# 切换到跟层目录opt
cd /opt

# 创建文件夹redis
mkdir redis

# 进入到redis文件夹
cd redis
```

### 下载源码包

```
wget https://download.redis.io/redis-stable.tar.gz
```

### 下载依赖

```
apt install gcc
apt install pkg-config
```

## 解压源码包

```
tar -xzvf redis-stable.tar.gz
```

## 进入到解压后的目录

```
cd redis-stable
```

## 编译

```
# 如果没有make模块就执行下载
apt install make

# 执行编译
make
```

## 安装

```
# 安装到指定目录（推荐）
make PREFIX=/opt/redis install

# 直接安装，会存放的默认位置
make install
```

## 复制主配置文件

该文件存放了开发者的偏好设置

```
cp 你编译后的文件位置/redis.conf /opt/redis/bin/
```

## 删除不需要的文件

安装完成后编译的文件和源码包都不需要了，根据自己的偏好是否需要删除

```
rm -r 你的文件夹
```

# redis.conf 偏好配置文件设置

```
vim redis.conf
```

按下 i 键进行修改      
按下 esc 键进行执行命令输入`:wq`进行保存退出

## 局域网连接

把`bind 127.0.0.1 -::1`改成`bind 0.0.0.0 -::1`让局域网都可以连接。这样就需要设置秘密，限制非法连接

## 后台启动

把`daemonize no`改成`daemonize yes`让其可以在后台启动

## 设置账号密码

在Redis中，默认没有多用户账号系统，它只支持单一密码认证（通过requirepass设置）。也就是说，所有客户端连接时都使用同一个密码，没有独立的用户名概念。

在任意空行都可以写`requirepass 你的密码`
