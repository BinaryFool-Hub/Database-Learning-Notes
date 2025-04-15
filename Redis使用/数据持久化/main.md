# 介绍

Redis数据库存储的数据是在内存中的，所以为什么读写数据这么快，但是当服务重启后就会消失，所以我们需要使用数据持久化这一技术来实现

RDB和AOF持久化是互补关系

# RDB持久化

RDB持久化配置(默认开启)

优点：RDB持久化文件，速度比较快，而且存储的是一个二进制文件，传输起来很方便。

缺点：RDB无法保证数据的绝对安全，有时候就是1s也会有很大的数据丢失。

Redis会将数据集的快照dump到dump.rdb文件中。此外，我们也可以通过配置文件来修改Redis服务器dump快照的频率，在打开6379.conf文件之后，我们搜索save，可以看到下面的配置信息
save 900 1 #在900秒(15分钟)之后，如果至少有1个key发生变化，则dump内存快照。        
save 300 10 #在300秒(5分钟)之后，如果至少有10个key发生变化，则dump内存快照。     
save 60 10000 #在60秒(1分钟)之后，如果至少有10000个key发生变化，则dump内存快照。

# AOF持久化

AOF(手动开启的)

appendonly yes

在Redis的配置文件中存在三种同步方式，它们分别是：

appendfsync always #每次有数据修改发生时都会写入AOF文件。

appendfsync everysec #每秒钟同步一次，该策略为AOF的缺省策略。

appendfsync no #从不同步。高效但是数据不会被持久化。

# redis数据恢复

参考网址：https://blog.csdn.net/wenbingy/article/details/137112992