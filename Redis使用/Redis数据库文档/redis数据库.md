# redis介绍

## Redis 是什么

REmote DIctionary Server(Redis) 是一个由 Salvatore Sanfilippo 写的 key-value 存储系统。Redis 提供了一些丰富的数据结构，包括 lists、sets、ordered sets 以及 hashes ，当然还有和 Memcached 一样的 strings 结构。Redis 当然还包括了对这些数据结构的丰富操作。

Redis 常被称作是一款数据结构服务器（data structure server）。Redis 的键值可以包括字符串（strings）类型，同时它还包括哈希（hashes）、列表（lists）、集合（sets）和 有序集合（sorted sets）等数据类型。

对于这些数据类型，你可以执行原子操作。例如：对字符串进行附加操作（append）；递增哈希中的值；向列表中增加元素；计算集合的交集、并集与差集等。

## Redis 的优点

- 性能极高 : Redis能读的速度是110000次/s,写的速度是81000次/s 。
- 丰富的数据类型：Redis 支持二进制案例的 Strings, Lists, Hashes, Sets 及 Ordered Sets 数据类型操作。
- 原子：Redis 的所有操作都是原子性的，同时 Redis 还支持对几个操作全并后的原子性执行。
- 丰富的特性：Redis 还支持 publish/subscribe, 通知, key 过期等等特性。

使用 Redis 只需要下载对应的软件包开箱即用，截止目前（2023）最新的版本有 6.* 可用

## redis应用场景

- 缓存系统(ehcache/memcached)
  - 由于 Redis 是将数据存储在内存中的, 所以我们可以使用 Redis 来实现内存缓存
  - 对于经常会被查询，但是不经常被修改或者删除的数据, 存储到 Redis 中
- 排行榜
  - 由于 Redis 支持集合（Set）和有序集合（Sorted Set）所以是的我们在实现排行榜的时候变的非常简单
- 计数器
  - 由于Redis提供了incr/decr指令, 使得我们在实现计数器时非常简单 点赞  取消 redis实现的
  - 转发数/评论数/播放数/访问数/... ...
- 存储社交关系
  - 由于Redis支持存储集合类型数据, 由于社交关系不会经常发生改变。所以很多社交网站会使用Redis来存储社交关系
  - 在一些大型系统中，巧妙地实现一些特定的功能：session共享、购物车
- 消息队列系统
- 进程 携程 消息队列      (用于去加密交流的信息)
  - Redis天生支持发布订阅模式, 所以天生就是实现消息队列系统的材料
- 只要你有丰富的想象力，redis可以用在可以给你无限的惊喜…….(爬虫的redis分布式 高并发   scrapy 异步框架  异步高并发处理)

## Redis在互联网公司的应用

- String：缓存、限流、计时器、分布式锁、分布式 Session
- Hash：存储用户信息、用户页面访问量、组合查询
- List：微博关注人时间列表、简单队列
- Set：赞、踩、标签、好友关系
- Zset：排行榜

## 推荐阅读

- [redis官方网站](https://redis.io/)
- [redis中文官网](http://redis.cn/)

## Redis 安装

### Linux

#### 在线安装

直接输入命令



```
sudo apt install redis-server
```



安装完成后，Redis服务器会自动启动。 使用



```
ps -aux|grep redis
```



命令可以看到服务器系统进程默认端口6379

配置文件为/etc/redis/redis.conf(在线安装推荐)或者 /usr/local/redis/redis.conf(手动安装)

首先



```
sudo vi /etc/redis/redis.conf
```



开启Redis的远程连接 注释掉绑定地址

```
# bind 127.0.0.1
```

修改Redis的默认端口 `port 6379`

添加Redis的访问账号 Redis服务器默认是不需要密码的，假设设置密码为123456。



```
config set requirepass 123456
```



如此，便将密码设置成了123456 设置之后，可通过以下指令查看密码



```
config get requirepass
```



密码设置之后，当你退出再次连上redis的时候，就需要输入密码了，不然是无法操作的。这里有两种方式输入密码，一是连接的时候直接输入密码，而是连接上之后再输入密码，分别如下所示：



```
auth 123456
```



**配置完成后重新启动服务器**

sudo service redis-server

start 启动服务

restart 重启服务

stop 停止服务



```
sudo /etc/init.d/redis-server restar
sudo service redis-server restart
sudo redis-server /etc/redis/redis.conf
```



#### 从源码开始安装

进入 root 目录，并下载 Redis 的程序包：



```
sudo su
wget http://download.redis.io/redis-stable.tar.gz
```



在目录下，解压安装包，生成新的目录 redis-4.0.14：



```
tar -xzvf redis-stable.tar.gz
```

进入解压之后的目录，进行编译：



```
cd redis-stable
make
```



说明：如果没有明显的错误，则表示编译成功。

1、查看重要文件

在 Redis 安装完成后，注意一些重要的文件，可用 **ls** 命令查看。

- 服务端：src/redis-server
- 客户端：src/redis-cli
- 默认配置文件：redis.conf

2、设置环境变量

为了今后能更方便地打开 Redis 服务器和客户端，可以将 src 目录下的 redis-server 和 redis-cli 添加进环境变量所属目录里面。



```
cp redis-server /usr/local/bin/
cp redis-cli /usr/local/bin/
```



添加完成后在任何目录下输入 `redis-server` 可启动服务器，输入 `redis-cli` 可启动客户端。

3、运行测试

在前面的步骤设置完成后可以运行测试，确认 Redis 的功能是否正常：



```
cd /root/redis-2.8.4
make test
```



运行测试需要花费一定的时间。

### windows 安装

官方没用直接给出Windows的安装包，这是微软自己编写提供给大家使用的，但是还是推荐大家使用官方的Linux版本

点击: https://github.com/microsoftarchive/redis/releases

然后选择 msi 文件

下载完成后双击打开安装（安装过程中一定要添加到 path 环境）

#### 使用 phpstudy 进行安装

在软件管理里面直接安装

## pycharm 使用

像使用 MySQL 一样，添加一个数据库的链接即可。









# Redis数据类型

Redis 不仅仅是简单的 key-value 存储器，同时也是一种 data structures server。传统的 key-value 是指支持使用一个 key 字符串来索引 value 字符串的存储，而 Redis 中，value 不仅仅支持字符串，还支持更多的复杂结构，包括列表、集合、哈希表等。

现在我们一一讲解：Redis keys 是采用二进制安全，这就意味着你可以使用任何二进制序列作为重点，比如："foo" 可以联系一个 JPEG 文件；空字符串也是一个有效的密钥。

Redis 字符串是二进制安全的，这意味着一个 Redis 字符串能包含任意类型的数据，例如： 一张经过 base64 编码的图片或者一个序列化的对象。通过这样的方式，Redis 的字符串可以支持任意形式的数据，但是对于过大的文件不适合存入 redis，一方面系统内存有限，另外一方面字符串类型的值最多能存储 512M 字节的内容。

**知识点**

- Redis 是以 key-value 的形式存储数据的
- key 无论如何都是字符串类型
- Value 支持如下的五种数据类型
  - 字符串(String)
  - 哈希(Hash)
  - 列表(list)
  - 无序集合(sets)
  - 有序集合(sorted sets)

## String（字符串）

格式: key value

示例: name zhengxin

## List（列表）

list就相当于编程开发中的链表或者数组



```
格式: key value1 value2 value3
示例: names lnj zs ls ww
```



注意点: list是有序的

## Set（集合）

键是String, 值set

一堆无序的数据

注意点: 存储的数据不能重复

## Zset(有序集合)。

一堆有序的数据, 通过权重和实现排序

注意点: 存储的数据不能重复

## Hash（哈希）

格式: key field value 示例:



```
user name lnj
user age  33
user gender man
user ...  ...
```



hash就相当于编程开发中的Map或者对象

注意点: Hash是无序的











# 字符串类型操作

1.默认数据库

默认情况下Redis给我们创建了16个数据库(0~15), 如果使用的时候没有明确的选中使用哪个数据库, 那么默认使用第0个

2.切换数据库

select 1

## 增删改查

[redisdoc.com](https://docs.qingdengedu.com/02.advanced/advanced/redis/redisdoc.com) 所有语法文档

- 新增

```
set key value
set name zx
```



- 查询



```
get key
get name
```



- 修改



```
set key value
```



如果 key 已经存在就是修改

- 删除



```
del key
del name
```



## 高级设置

- 不管key是否存在都设置(不存在就新增, 存在就覆盖)



```
set key value
```



- 只有key不存在才设置(新增)



```
setnx key value
```



- 只有key存在才设置(更新)



```
set key value xx
```



- 批量添加值



```
mset key value key value
mset name zx age 98 score 100
```



- 批量查询值



```
mget key key key
mget name age score
```



## 其它操作

- 设置新值返回旧值



```
getset key newValue
```



- 给旧值追加数据



```
append key value
```



- 计算value字符串长度



```
strlen key
```



注意点: 中文问题

- 获取指定下标范围的值



```
getrange key start end
```



- 从指定下标开始设置字符串的值



```
setrange key offset value
```



## 自增自减操作

- incr
  - 作用: 给指定 key 的对应的 Value 自增 1, 如果 key 不存在会自动新增, 并从 0 开始自增 1
  - 格式: `incr key`
- decr
  - 作用: 给指定 key 的对应的 Value 自减1, 如果 key 不存在会自动新增, 并从 0 开始自减 1
  - 格式: `decr key`
- incrby
  - 作用: 给指定 key 的对应的 Value 增加指定值, 如果 key 不存在会自动新增, 并从 0 开始增加
  - 格式: `incrby key number`
- decrby
  - 作用: 给指定 key 的对应的 Value 减少指定的值, 如果 key 不存在会自动新增, 并从 0 开始减少
  - 格式: `decrby key number`
- incrbyfloat
  - 作用: 给指定key的对应的Value增加指定值, 如果key不存在会自动新增, 并从0开始增加
  - 格式: `incrbyfloat key float`

## set 完整内容

参数含义:

- set : 设置一个键值对内容
- key : 键名
- value : 值内容
- `[EX seconds]` : 设置指定的过期时间，以秒为单位。(可选) `set a 5 EX 5`
- `[PX milliseconds]` : 设置指定的过期时间，以毫秒为单位。(可选)
- NX : 只有键key不存在的时候才会设置key的值
- XX : 只有键key存在的时候才会设置key的值

**总结**

- **set** 设置值
- **get** 获取值
- **mset** 设置多个值
- **mget** 获取多个值
- **append** 添加字符
- **del** 删除
- **incr/decr** 增加/减少

## 通用命令

- 查询当前数据库中所有的key

```
keys *
```



- 清空当前数据库(开发操作)



```
flushdb
```



- 清空所有数据库(离职操作)



```
flushall
```



注意点:由于Redis是单线程的, 而以上操作都是非常耗时的, 所以不推荐在企业开发中使用

- 计算当前数据库 key 的总数



```
dbsize
```



注意点: `dbsize` 并不是通过遍历统计得到当前数据库 `key` 的总数, 而是每次操作时内部会自动统计 所以 `dbsize` 并不是一个耗时的操作, 我们可以在企业开发中大胆的使用

- 查看 value 数据类型



```
type key
```



- 判断指定 key 是否存在

shell

```
exists key
```



注意点: 如果存在返回1, 如果不存在返回0

- 设置 key 过期时间



```
expire key seconds
```



注意点: 如果没有添加过期时间就是添加, 如果已经添加过了过期时间就是修改

- 查看 key 过期时间



```
ttl key
```



- 取消 key 过期时间



```
persist key
```



注意点: 如果 key 不存在或者已经被删除会返回-2, 如果 key 存在并且过期时间已经被删除会返回-1













# List类型

## 增删改查

Redis 列表是简单的字符串列表，按照插入顺序排序。你可以添加一个元素到列表的头部（左边）或者尾部（右边），lpush 命令插入一个新的元素到头部，而 rpush 命令插入一个新元素到尾部。当这两个操作中的任一操作在一个空的 Key 上执行时就会创建一个新的列表。相似的，如果一个列表操作清空一个列表，那么对应的 key 将被从 key 空间删除。

### 增加

**lpush/rpush** 队列左边或者右边增加内容



```
rpush key value
lpush key value
```



```
rpush mylist A
rpush mylist B
lpush mylist first
lrange mylist 0 -1
```



### 查询

**lrange** 获取指定长度的内容

- 查询指定范围数据



```
lrange key startIndex endIndex
```



- 查询指定索引数据



```
lindex key index
```



**注意**：lrange 需要两个索引，0 表示 list 开头第一个，-1 表示 list 的倒数第一个，即最后一个。-2 则是 list 的倒数第二个，以此类推。

### 修改



```
lset key index value
```



注意 index 从 0 开始

### 删除

- lpop 删除左边元素



```
lpop key
```



- rpop删除右边元素



```
rpop key
```



- lrem 删除指定个数的指定元素



```
lrem key count value
```



- count > 0 : 从表头开始向表尾搜索，移除与 value 相等的元素，数量为 count
- count < 0 : 从表尾开始向表头搜索，移除与 value 相等的元素，数量为 count 的绝对值
- count = 0 : 移除表中所有与 value 相等的值

- ltrim 按照索引剪切列表



```
ltrim key start end
```



## 其它操作

- 追加数据



```
lpush key value1,value2,...
```





```
rpush key value1,value2,...
```



- 插入数据



```
linsert key before|after oldValue newValue
```



- 获取列表长度



```
llen key
```



**总结**

- **lpush/rpush** 队列左边或者右边增加内容
- **lrange** 获取指定长度的内容
- **ltrim** 对一个列表进行修剪(trim)，保留指定区间内的元素，不在指定区间之内的元素都将被删除。
- **lpop/rpop** 从队列左边或者右边弹出内容
- **lpushx/rpushx** key存在时才插入数据, 不存在是不做任何处理

## List 阻塞操作

理解阻塞操作对一些请求操作有很大的帮助，关于阻塞操作的作用，这里举一个例子。

假如你要去楼下买一个汉堡，一个汉堡需要花一定的时间才能做出来，非阻塞式的做法是去付完钱走人，过一段时间来看一下汉堡是否做好了，没好就先离开，过一会儿再来，而且要知道可能不止你一个人在买汉堡，在你离开的时候很可能别人会取走你的汉堡，这是很让人烦的事情。

阻塞式就不一样了，付完钱一直在那儿等着，不拿到汉堡不走人，并且后面来的人统统排队。

Redis 提供了阻塞式访问 brpop 和 blpop 命令。用户可以在获取数据不存在时阻塞请求队列，如果在时限内获得数据则立即返回，如果超时还没有数据则返回 null。

## List 常见应用场景

分析 List 应用场景需要结合它的特点，List 元素是线性有序的，很容易就可以联想到聊天记录，你一言我一语都有先后，因此 List 很适合用来存储聊天记录等顺序结构的数据。

一个列表最多可以包含 4294967295（2 的 32 次方减一） 个元素，这意味着它可以容纳海量的信息，最终瓶颈一般都取决于服务器内存大小。

事实上，在高级的企业架构当中，会把缓存服务器分离开来，因为数据库服务器和缓存服务器的特点各异，比如对于数据库服务器应该用更快、更大的硬盘，而缓存专用服务器则偏向内存性能，一般都是 64GB 起步。











# Set类型操作

## Redis 无序集合

Redis 集合（Set）是一个无序的字符串集合。你可以以 O(1) 的时间复杂度 (无论集合中有多少元素时间复杂度都是常量）完成添加、删除以及测试元素是否存在。

Redis 集合拥有令人满意的不允许包含相同成员的属性，多次添加相同的元素，最终在集合里只会有一个元素，这意味着它可以非常方便地对数据进行去重操作，一个 Redis 集合的非常有趣的事情是它支持一些服务端的命令从现有的集合出发去进行集合运算，因此你可以在非常短的时间内进行合并（unions）, 求交集（intersections）, 找出不同的元素（differences of sets）。

- **sadd/srem** 添加/删除元素
- **sismember** 判断是否为set的一个元素
- **smembers** 返回该集合的所有成员
- **sdiff** 返回一个集合与其他集合的差异
- **sinter** 返回几个集合的交集
- **sunion** 返回几个集合的并集

## 增删改查

### 新增

```
sadd key value1, [value2, ...]
```



### 查询

- 返回集合中所有元素

```
smembers key
```



注意点:由于Redis是单线程的, 而以上操作都是非常耗时的, 所以当元素比较多时需要慎用

- 返回集合中N个元素

```
srandmember key [count]
```



- 删除 随机删除N个元素

```
spop key
```



- 删除集合中的指定元素

```
srem key value1, [value2, ...]
```



## 其它操作

### 追加元素

- sadd: key不存在就新增, 存在就追加
- sadd: 追加的元素不存在就追加, 追加的元素存在会自动忽略

### 统计元素个数

```
scard key
```

- 判断集合中是否有指定元素

```
sismember key member
```



### 集合运算

Redis中的集合是支持集合间的操作的, 也就是求交集,并集和差集

- 交集



```
sinter key [key, ...]
```





```
{1, 2, 3} ∩ {2, 3, 4} = {2, 3}
```



- 并集

```
sunion  key [key, ...]
```





```
{1, 2, 3} ∪ {2, 3, 4} = {1, 2, 3, 4}
```



- 差集

```
sdiff key [key, ...]
```



```
{1, 2, 3} - {2, 3, 4} = {1}
{2, 3, 4} - {1, 2, 3} = {4}
```



## 应用场景

- 抽奖
  - `srandmember key [count]`
- 绑定标签
  - `sadd key value1, [value2, ...]`
- 社交关系
  - `sinter key [key, ...]`
  - `sunion key [key, ...]`
  - `sdiff key [key, ...]`









# Zset类型操作



## Redis 有序集合

Redis 有序集合与普通集合非常相似，是一个没有重复元素的字符串集合。不同之处是有序集合的每一个成员都关联了一个权值，这个权值被用来按照从最低分到最高分的方式排序集合中的成员。集合的成员是唯一的，但是权值可以是重复的。

使用有序集合你可以以非常快的速度（O(log(N))）添加、删除和更新元素。因为元素是有序的, 所以你也可以很快的根据权值（score）或者次序（position）来获取一个范围的元素。访问有序集合的中间元素也是非常快的，因此你能够使用有序集合作为一个没有重复成员的智能列表。在有序集合中，你可以很快捷的访问一切你需要的东西：有序的元素，快速的存在性测试，快速访问集合的中间元素！简而言之使用有序集合你可以完成许多对性能有极端要求的任务，而那些任务使用其它类型的数据库真的是很难完成的。

zadd 与 sadd 类似，但是在元素之前多了一个参数，这个参数便是用于排序的。形成一个有序的集合。



```
> zadd hackers 1940 "Alan Kay"
> zadd hackers 1957 "Sophie Wilson"
> zadd hackers 1953 "Richard Stallman"
> zadd hackers 1949 "Anita Borg"
> zadd hackers 1965 "Yukihiro Matsumoto"
> zadd hackers 1914 "Hedy Lamarr"
> zadd hackers 1916 "Claude Shannon"
> zadd hackers 1969 "Linus Torvalds"
> zadd hackers 1912 "Alan Turing"
```



查看集合：zrange 是查看正序的集合，zrevrange 是查看反序的集合。0 表示集合第一个元素，-1 表示集合的倒数第一个元素。



```
> zrange hackers 0 -1
> zrevrange hackers 0 -1
```



使用 withscores 参数返回记录值。

```
> zrange hackers 0 -1 withscores
```



## 增删改查

### 新增

```
zadd key 权重 value 权重 value
```

### 查询

- 查询指定排名范围内的数据

```
zrange key start end
```



- 查询指定权重范围内的数据

```
zrangebyscore key 权重 权重
```



- 查询指定元素权重

```
zscore key element
```

- 查询指定权重范围内元素个数

shell

```
zcount key minscore maxscore
```

- 查询集合中元素个数

shell

```
zcard key
```

### 删除

- 删除指定元素

```
zrem key value
```



- 删除指定排名范围元素

```
zremrangbyrank key start end
```



- 删除指定权重范围元素

```
zremrangbyscore key minscore maxscore
```



## 其它操作

- 增加或减少元素权重



```
zincrby key score element
```



- 从高到低的操作
- zrevrange
- zrev...

## 应用场景

- 存储排行榜数据









# 哈希类型操作



## Redis-Hash类型

Redis Hashes 是字符串字段和字符串值之间的映射，因此它们是展现对象的完美数据类型。例如一个有名、姓、年龄等等属性的用户：一个带有一些字段的 hash 仅仅需要一块很小的空间存储，因此你可以存储数以百万计的对象在一个小的 Redis 实例中。哈希主要用来表现对象，它们有能力存储很多对象，因此你可以将哈希用于许多其它的任务。

- **hset/hget** 设置/获取散列值
- **hmset/hgetall** 设置/获取多对散列值
- **hsetnx** 如果散列已经存在,则不设置
- **hkeys/hvals** 查看散列的keys/valus
- **hlen** 返回散列指定的域(field)
- **hexists** 判断是否存在

## 增删改查

### 增加

```
hset key field value
```





```
hset user name it666
hset user age 34
```



### 查询

```
hget key field
```





```
hget user name
```



### 修改

如果字段不存在就是新增, 如果字段存在就是修改



```
hset key field value
hset user name it666
```



### 删除

- 删除指定的字段

```
hdel key field
hdel user name
```



- 删除对应key所有的数据



```
del key
del user
```



## 高级操作

- 批量新增

```
hmset key field1 value1 field2 value2

hmset user name lnj age 34 score 100
```



- 批量查询

```
hmget key field1 field2 field3

hmget user name age score
```



- 工具指令

```
hlen key  # 返回key存储的hash表中有多少条数据
hlen user


hexists key field  # 判断指定的 key 存储的 Hash 中是否有指定的字段
hexists user name  # 返回 1 表示存在
hexists user gender  # 返回 0 表示不存在
```



## 其它操作

- 查询所有 field

```
hkeys key

hkeys user
```



- 查询所有value

```
hvals key

hvals user
```



- 查询所有的field和value

```
hgetall key

hgetall user
```











# 发布订阅

## 什么是发布订阅 ?

在发布订阅中有三个角色: 发布者(publisher)/订阅者(subscriber)/频道(channel)

只要发布者将消息发送到对应的频道中, 那么所有的订阅者都能收到这个消息, 这个就是Redis的发布订阅

现实生活中的发布订阅:

'张三和李四'去'商店'买鞋, 但是最近炒鞋的人比较多, 要买的鞋子已经卖完了 于是商店老板就让张三和李四先加粉丝群, 到货了会在群里通知

这里的商店老板就是发布者 这里的粉丝群就是频道 这里的张三李四就是订阅者

只要张三和李四加了粉丝群, 只要老板在粉丝群里发送消息, 那么张三和李四就能收到老板发送的消息

- 订阅频道

```
subscribe channel [channel …]
```



- 发布消息

```
publish channel message
```



- 退订频道

```
unsubscribe [channel [channel …]]
```









# Redis 数据持久化

内存和磁盘的区别除了速度差别以外，还有就是内存中的数据会在重启之后消失，持久化的作用就是要将这些数据长久存到磁盘中以支持长久使用。

Redis 是一个支持持久化的内存数据库，Redis 需要经常将内存中的数据同步到磁盘来保证持久化。

Redis 支持两种持久化方式：

1、`snapshotting`（快照）：将数据存放到文件里，默认方式。

是将内存中的数据以快照的方式写入到二进制文件中，默认文件 dump.rdb，可以通过配置设置自动做快照持久化的方式。可配置 Redis 在 n 秒内如果超过 m 个 key 被修改就自动保存快照。比如：

`save 900 1`：900 秒内如果超过 1 个 key 被修改，则发起快照保存。

`save 300 10`：300 秒内如果超过 10 个 key 被修改，则快照保存。

2、`Append-only file`（缩写为 aof）：将读写操作存放到文件中。

由于快照方式在一定间隔时间做一次，所以如果 Redis 意外 down 掉的话，就会丢失最后一次快照后的所有修改。

aof 比快照方式有更好的持久化性，是由于使用 aof 时，redis 会将每一个收到的写命令都通过 write 函数写入到文件中，当 redis 启动时会通过重新执行文件中保存的写命令来在内存中重新建立整个数据库的内容。

由于 os 会在内核中缓存 write 做的修改，所以可能不是立即写到磁盘上，这样 aof 方式的持久化也还是有可能会丢失一部分数据。可以通过配置文件告诉 redis 我们想要通过 fsync 函数强制 os 写入到磁盘的时机。

配置文件中的可配置参数：



```
appendonly yes //启用 aof 持久化方式

# appendfsync always //收到写命令就立即写入磁盘，最慢，但是保证了数据的完整持久化

appendfsync everysec //每秒钟写入磁盘一次，在性能和持久化方面做了很好的折中

# appendfsync no //完全依赖 os，性能最好，持久化没有保证
```



在 redis-cli 的命令中，`save` 命令是将数据写入磁盘中。



```
> help save
> save
```



1.Redis数据持久化

- 默认情况下 Redis 是将数据保存在内存中的, 保存在内存中的数据有一个特点, 那就是机器重启之后数据就会丢失
- 所以为了避免服务器重启死机等问题发生的时候, Redis 中保存的数据丢失, Redis 提供了数据持久化功能

2.什么是数据持久化

- 数据持久化就是将内存中的数据写入到磁盘中
- Redis和大部分主流数据库(MySQL/MongoDB/...)一样, 支持 RDB 和 AOF 持久化

## RDB(快照)

将内存中所有内容写入到一个文件中

### 触发生成 RDB 三种机制

- 手动执行save命令
  - 同步执行
  - 如果已经存在旧的RDB文件, 会利用新的覆盖旧的
- 手动执行bgsave命令
  - 异步执行
  - 如果已经存在旧的RDB文件, 会利用新的覆盖旧的
- 通过配置文件自动生成
  - 通过配置文件指定自动生成条件, 一旦满足条件就会自动执行 bgsave 生成RDB文件



```
dir ./                  # RDB文件保存的路径
dbfilename dump.rdb     # RDB文件的名称
# save 900 1              # 自动生成条件
# save 300 10
# save 60  10000
stop-writes-on-bgsave-error yes #bgsave发生错误是否停止写入
rdbcompression yes              # 是否采用压缩模式写入
rdbchecksum yes                 # 是否对生成的RDB文件进行校验
```



- 自动生成弊端
  - 无法控制生成的频率, 如果频率过高会导致性能消耗较大
- 推荐配置



```
dir /rdbdiskpath                # 由于备份是比较占用磁盘空的, 所以推荐使用一个比较大的磁盘路径
dbfilename dump-${prot}.rdb     # 由于一台服务器上可能部署多个 Redis , 所以可以给 RDB 文件添加端口号作为区分
stop-writes-on-bgsave-error yes # bgsave 发生错误是否停止写入
rdbcompression yes              # 是否采用压缩模式写入
rdbchecksum yes                 # 是否对生成的 RDB 文件进行校验
```



### RDB存在的问题

- 不可控、数据丢失
  - 服务器宕机之前的数据, 如果未写入RDB文件就会丢失 示例:



```
set name lnj
save or bgsave or 自动保存
set name zs
set name ls
set name ww
宕机
```



- 耗时、耗性能
  - RDB是一次性把内存中所有的内容写入到磁盘中, 是一个比较重的操作 如果需要写入的数据比较多, 那么就比较耗时
  - RDB每次都是把内存中的所有内容全部写入到磁盘中, 哪怕内存中的数据已经写入过了也会再次完整写入, 重复写入相同的数据, 也比较浪费I/O资源
  - 如果通过save命令写入, 会阻塞后续命令执行 如果是通过bgsave写入, 不会阻塞后续命令执行, 会开启子进程去专门负责写入, 但是开启子进程会消耗内存空间
  - ... ...

## AOF(日志)

将每一条操作Redis的指令都写入到文件中

### 触发生成AOF三种机制

- always
  - 每条命令都写入一条命令到文件中
  - 优点: 不会丢失数据
  - 缺点: 磁盘I/O消耗较大
- everysec
  - 每隔1秒写入一次, 也就是先收集1秒钟的命令, 然后再一次性写入到文件中
  - 优点: 磁盘I/O消耗相对较小
  - 缺点: 可能丢失1秒数据
- no
  - 让操作系统决定什么时候写入, 操作系统想什么时候写入就什么时候写入
  - 不可控, 可能丢失大量数据

1.AOF文件重写

- 随着时间的推移AOF文件会越来越大
  - 文件越来越大带来的问题就是-磁盘消耗越来越大
  - 文件越来越大带来的问题就是-写入速度会越来越慢
  - 文件越来越大带来的问题就是-恢复的时间越来越慢
  - ... ...
- 所以AOF提供了重写的机制
  - 我们可以对AOF文件中保存的内容进行优化
  - 从而降低文件的体积
  - 从而提升文件的恢复速度
- 在AOF的重写机制中
  - 可以将自动去除冗余命令
  - 可以自动删除没有用的命令
  - ... ...
- 例如:
  - 优化前: set name lnj; set name zs; set name ls;
  - 优化后: set name ls;
  - 优化前: incr count; incr count; incr count; incr count;
  - 优化后: set count 4;
  - 优化前: expire name 3
  - 优化后: 3秒后由于数据已经被删除, 所以这条命令不用保存
  - ... ...

### 触发 AOF 重写两种机制

- bgrewriteaof 命令
  - 开启一个新的子进程, 根据内容中的数据生成命令写入到 AOF 文件中
- 配置文件设置



```
auto-aof-rewrite-min-size 200mb   # AOF文件体积达到多大时进行重写
auto-aof-rewrite-percentage 100   # 对比上一次重写后, 增长了百分之多少再次进行重写
                                  # 例如上一次重写后大小是100MB, 如果设置为50, 那么下一次就是增长0.5倍(150M)之后再重写
                                  # 例如上一次重写后大小是100MB, 如果设置为100, 那么下一次就是增长两倍(200M)之后再重写
```



- AOF 推荐配置



```
appendonly yes                           # 是否使用 AOF
appendfilename "appendonly-${prot}.aof"  # AOF 文件名称
appendfsync everysec                     # 写入命令的同步机制
dir /rdbdiskpath                         # 保存 AOF 文件路径
auto-aof-rewrite-min-size 64mb           # AOF 文件重写体积
auto-aof-rewrite-percentage 100          # AOF 文件增长率
no-appendfsync-on-rewrite yes            # AOF 重写时是否正常写入当前操作的命令
```



## RDB 和 AOF 对比

- AOF 优先级高于 RDB
  - 如果 Redis 服务器同时开启了 RDB 和 AOF, 那么宕机重启之后会优先从 AOF 中恢复数据
- RDB 体积小于 AOF
  - 由于 RDB 在备份的时候会对数据进行压缩, 而 AOF 是逐条保存命令, 所以 RDB 体积比 AOF 小
- RDB 恢复速度比 AOF 恢复速度快
  - 由于 AOF 是通过逐条执行命令的方式恢复数据, 而 RDB 是通过加载预先保存的数据恢复数据，所以 RDB 的恢复速度比 AOF 快
- AOF 数据安全性高于RDB
  - 由于 AOF 可以逐条写入命令, 而 RDB 只能定期备份数据, 所以 AOF 数据安全性高于 RDB
- 所以综上所述, 两者各有所长, 两者不是替代关系而是互补关系















# python  操作  Redis



## Redis-py

## redis连接

redis 提供两个类 Redis 和 StrictRedis 用于实现 Redis 的命令，StrictRedis 用于实现大部分官方的命令，并使用官方的语法和命令，Redis 是 StrictRedis 的子类，用于向后兼容旧版本的 redis-py。

redis 连接实例是线程安全的，可以直接将 redis 连接实例设置为一个全局变量，直接使用。如果需要另一个 Redis 实例（or Redis 数据库）时，就需要重新创建 redis 连接实例来获取一个新的连接。同理，python 的 redis 没有实现select命令。

安装 redis

```
pip install redis
```



连接redis，加上decode_responses=True，写入的键值对中的value为str类型，不加这个参数写入的则为字节类型。

```
# 导入 redis 模块，通过 python 操作 redis 也可以直接在 redis 主机的服务端操作缓存数据库
import redis

# host 是 redis 主机，需要 redis 服务端和客户端都启动 redis 默认端口是 6379

r = redis.Redis(
    host='127.0.0.1',
    port=6379,
    decode_responses=False,  # 默认读取是二进制的
)

print(r)
```



## String 字符串操作

```
set(name, value, ex=None, px=None, nx=False, xx=False)
```

在 Redis 中设置值，默认，不存在则创建，存在则修改

```
import redis

r = redis.Redis(host='127.0.0.1', port=6379, decode_responses=False)

print(r)
# key 是 "name" value 是 "正心" 将键值对存入 redis 缓存
r.set('name', '正心')
r.set('age', '18')

print(r.get('name'))
print(r.get('name').decode())
```



### 过期时间

**参数：**

ex，过期时间（秒） 这里过期时间是3秒，3秒后p，键 hobby 的值就变成 None

px，过期时间（豪秒） 这里过期时间是3豪秒，3毫秒后，键 hobby 的值就变成 None

```
"""设置过期时间 ex"""
r.set('code', '123456', ex=3)
time.sleep(1)
print(r.get('code'))
time.sleep(1)
time.sleep(1)
print(r.get('code'))
```



**setex(name, time, value)**

参数： time，过期时间（数字秒 或 timedelta对象）

```
r.setex('code:0001', 3, '123456')
```



**psetex(name, time_ms, value)**

参数： time_ms，过期时间（数字毫秒 或 timedelta对象）

```
r.psetex('code:0001', 3000, '123456')
time.sleep(3)
print(r.get('name'))  # 5000毫秒后，取值就从 apple 变成 None
```



**参数：**

nx，如果设置为True，则只有name不存在时，当前set操作才执行 （新建）

xx，如果设置为True，则只有name存在时，当前set操作才执行 （修改）



```
"""操作数据"""
# 如果键 age 不存在，就添加一个新的；如果键 age 已经存在，就不进行修改

# 不存在就创建，存在就不进行修改
r.set('age', '19', nx=True)  # 不存在就会创建
print(r.get('age'))

# 如果键 gender 已经存在，就进行修改；如果键不存在，就不修改
r.set('gender', '女', xx=True)
```



setnx(name, value) 设置值，只有name不存在时，执行设置操作（添加）



```
r.set('gender', '男', nx=True)
r.setnx('gender', '男')
```



### 批量操作

批量设置值: `mset(*args, **kwargs)`

```
r.mset({'name': '正心', 'age': '18'})
```



批量获取: `mget(keys, *args)` 如：

```
print(r.mget(['name', 'age', 'hobby']))  # 一次取出多个键对应的值
```



### 自增

```
incr(self, name, amount=1)
```

自增 name 对应的值，当 name 不存在时，则创建 name＝amount ，否则，则自增。

参数：`amount`, 自增数（必须是整数）

```
r.set('total', 10)
r.incr('total')
r.incr('total', amount=1)  # 自增数（必须是整数）
print(r.mget("total"))
```



```
decr(self, name, amount=1)
```

自减 name 对应的值，当 name 不存在时，则创建 name＝amount，否则，则自减。

参数： `amount` ,自减数（整数)

```
r.decr("total", amount=3)  # 递减3
r.decr("total", amount=1)  # 递减1
print(r.mget("total"))
```



```
append(key, value)
```

在 redis name 对应的值后面追加内容

参数：`value`, 要追加的字符串



```
r.set('name', '正心')
r.append('name', ':zhengxin')
print(r.get('name'))  # 正心:zhengxin
```



### 案例-页面点击

假定我们对一系列页面需要记录点击次数。

例如论坛的每个帖子都要记录点击次数，而点击次数比回帖的次数的多得多。如果使用关系数据库来存储点击，可能存在大量的行级锁争用。所以，点击数的增加使用redis的INCR命令最好不过了。 当redis服务器启动时，可以从关系数据库读入点击数的初始值（例如某一篇文章被访问了1次）

```
# 观看（view），点赞（click），投币（coin），转发（share）
r.set('article:000001:click', 1)
r.set('article:000002:click', 1)
r.set('article:000003:click', 1)
r.set('article:000004:click', 1)
```



每当有一个页面点击，则使用INCR增加点击数即可。

```
r.incr('article:000002:click')
```



页面载入的时候则可直接获取这个值

```
print(r.mget(['article:000001:click', 'article:000002:click', 'article:000003:click', 'article:000004:click']))
```



```
incrbyfloat(self, name, amount=1.0)
```

自增 `name` 对应的值，当 `name` 不存在时，则创建 `name＝amount` ，否则，则自增。

参数： `amount`,自增数（浮点型）

```
r.set("foo1", "123.0")
r.set("foo2", "221.0")
print(r.mget("foo1", "foo2"))
r.incrbyfloat("foo1", amount=2.0)
r.incrbyfloat("foo2", amount=3.0)
print(r.mget("foo1", "foo2"))
```



### 字符串其他操作

```
getrange(key, start, end)
```

获取子序列（根据字节获取，非字符） 参数：

- `name`，Redis 的 name
- `start`，起始位置（字节）
- `end`，结束位置（字节） 如： "君惜大大" ，0-3表示 "君"

```
r.set("cn_name", "君惜大大")  # 汉字
# 取索引号是 0-2 前3位的字节 君 切片操作 （一个汉字3个字节 1个字母一个字节 每个字节8bit）
print(r.getrange("cn_name", 0, 2))
# 取所有的字节 君惜大大 切片操作
print(r.getrange("cn_name", 0, -1))
# 字母
r.set("en_name", "junxi")
# 取索引号是 0-2 前3位的字节 jun 切片操作 （一个汉字3个字节 1个字母一个字节 每个字节8bit）
print(r.getrange("en_name", 0, 2))
# 取所有的字节 junxi 切片操作
print(r.getrange("en_name", 0, -1))
```



```
setrange(name, offset, value)
```

修改字符串内容，从指定字符串索引开始向后替换（新值太长时，则向后添加） 参数：

- `offset`，字符串的索引，字节（一个汉字三个字节）
- `value`，要设置的值

```
r.setrange("en_name", 1, "ccc")
# jccci 原始值是junxi 从索引号是1开始替换成ccc 变成 jccci
print(r.get("en_name"))
```



```
strlen(name)
```

返回 name 对应值的字节长度（一个汉字3个字节）

```
print(r.strlen("foo"))  # 4 'goo1'的长度是4
```



## list 列表操作

### 增加

增加（类似于list的append，只是这里是从左边新增加）--没有就新建

1、增加（从右边增加）--没有就新建

```
lpush(name,values)
```

```
r.flushdb()  # 清空数据库

"""列表的基本操作"""
r.rpush("arr", 11, 22, 33, 44, 55)  # 表示从右向左操作
print(r.llen('arr'))  # 列表长度
print(r.lrange('arr', 0, 3))  # 切片取出值，范围是索引号 0-3
```



2、往已经有的 name 的列表的左边添加元素，没有的话无法创建

```
lpushx(name,value)
```

在 name 对应的 list 中添加元素，只有 name 已经存在时，值添加到列表的最左边

```
# lpushx 当列表有内容时，没有的话就不添加
r.lpushx("arr", 00)
print(r.llen("arr"))  # 0
print(r.lrange("arr", 0, -1))  # []
```



3、新增（固定索引号位置插入元素）

```
linsert(name, where, refvalue, value))
```

在 name 对应的列表的某一个值前或后插入一个新值

参数：

- `where`，BEFORE 或 AFTER
- `refvalue`，标杆值，即：在它前后插入数据
- `value`，要插入的数据



```
r.linsert("arr", "before", "11", "00")  # 往列表中左边第一个出现的元素"11"前插入元素"00"
print(r.lrange('arr', 0, -1))   # 切片取出值，范围是索引号0-最后一个元素
```



### 修改

修改（指定索引号进行修改）

```
r.lset(name, index, value)
```

对 name 对应的 list 中的某一个索引位置重新赋值

参数：

- `name`，redis 的 name
- `index`，list 的索引位置
- `value`，要设置的值

```
r.lset("arr", 0, -11)  # 把索引号是0的元素修改成-11
print(r.lrange("arr", 0, -1))
```



### 删除

1、删除（指定值进行删除）

```
r.lrem(name, count, value)
```

在name对应的list中删除指定的值

参数：

- `name`，redis的name
- `value`，要删除的值
- `num`， num=0，删除列表中所有的指定值；

num=2 ,从前到后，删除 2 个； num=1 ,从前到后，删除左边第 1 个

num=-2 ,从后向前，删除 2 个

```
r.lrem("arr", 1, '11')  # 将列表中左边第一次出现的"11"删除
print(r.lrange("arr", 0, -1))
r.lrem("arr", -1,"99")  # 将列表中右边第一次出现的"99"删除
print(r.lrange("arr", 0, -1))
r.lrem("arr",0,  "22")  # 将列表中所有的"22"删除
print(r.lrange("arr", 0, -1))
```



2、删除并返回

```
lpop(name)
```

在 name 对应的列表的左侧获取第一个元素并在列表中移除，返回值则是第一个元素

`rpop(name)` 表示从右向左操作

```
print(r.lpop("arr"))  # 删除列表最左边的元素，并且返回删除的元素
print(r.lrange("arr", 0, -1))
print(r.rpop("arr"))  # 删除列表最右边的元素，并且返回删除的元素
print(r.lrange("arr", 0, -1))
```



3、删除索引之外的值

```
ltrim(name, start, end)
```

在 `name` 对应的列表中移除没有在 `start-end` 索引之间的值

参数：

- `name`，redis 的 name
- `start`，索引的起始位置
- `end`，索引结束位置



```
r.ltrim("arr", 0, 2)  # 删除索引号是0-2之外的元素，值保留索引号是0-2的元素
print(r.lrange("arr", 0, -1))
```



4、取值（根据索引号取值）

```
lindex(name, index)
```

在 name 对应的列表中根据索引获取列表元素

```
print(r.lindex("arr", 0))  # 取出索引号是0的值

```

## set

**新增**

```
sadd(name,values)
```

name 对应的集合中添加元素

```
# 往集合中添加元素
r.sadd("set1", *'hello world !')
print('集合的长度:\t', r.scard("set1"))
print('集合中所有的成员', r.smembers("set1"))
```



**获取元素个数**

```
scard(name)
```

获取name对应的集合中元素个数，类似于len

```
print('集合的长度:\t', r.scard("set1"))
```



**获取所有成员**

```
smembers(name)
```

获取 name 对应的集合的所有成员

```
print('集合中所有的成员', r.smembers("set1"))
```



**获取集合中所有的成员--元组形式**

```
sscan(name, cursor=0, match=None, count=None)
```

```
print(r.sscan("set1"))
```



**获取集合中所有的成员--迭代器的方式**

```
sscan_iter(name, match=None, count=None)
```

同字符串的操作，用于增量迭代分批获取元素，避免内存消耗太大

```
for i in r.sscan_iter("set1"):
    print(i)
```



**移动**

```
smove(src, dst, value)
```

将某个成员从一个集合中移动到另外一个集合

```
r.smove("set2", "set3", 1)
print(r.smembers("set1"))
print(r.smembers("set2"))
```



**删除** 随机删除并且返回被删除值

```
spop(name)
```

从集合移除一个成员，并将其返回,说明一下，集合是无序的，所有是随机删除的

```
print(r.spop("set2"))  # 这个删除的值是随机删除的，集合是无序的
print(r.smembers("set2"))
```



**删除** 指定值删除

```
srem(name, values)
```

在 name 对应的集合中删除某些值

```
print(r.srem("set2", 1))  # 从集合中删除指定值 1
print(r.smembers("set2"))
```



### 集合运算

**差集**

```
sdiff(keys, *args)
```

在第一个 name 对应的集合中且不在其他 name 对应的集合的元素集合

```
r.sadd("set2", 1, 2, 3)
r.sadd("set3", 2, 3, 4)
print('set2:\t', r.smembers("set2"))
print('set3:\t', r.smembers("set3"))
print('set2 - set3:\t', r.sdiff("set2", "set3"))
print('set3 - set3:\t', r.sdiff("set3", "set2"))
```



**差集--差集存在一个新的集合中**

```
sdiffstore(dest, keys, *args)
```

获取第一个 name 对应的集合中且不在其他 name 对应的集合，再将其新加入到 dest 对应的集合中



```
r.sdiffstore("set4", "set2", "set3")
print('set4 = set2 - set3:\t', r.smembers("set4"))
```



**交集**

```
sinter(keys, *args)
```

获取多一个 name 对应集合的交集

```
print(r.sinter("set2", "set3"))  # 取2个集合的交集
```



**交集** 交集存在一个新的集合中

```
sinterstore(dest, keys, *args)
```

获取多一个 name 对应集合的并集，再将其加入到 dest 对应的集合中

```
r.sinterstore("set4", "set2", "set3")  # 取2个集合的交集
print(r.smembers("set4"))
```



**并集**

```
sunion(keys, *args)
```

获取多个 name 对应的集合的并集

```
print('set2 | set3:\t', r.sunion("set2", "set3"))
```



**并集--并集存在一个新的集合**

```
sunionstore(dest,keys, *args)
```

获取多一个name对应的集合的并集，并将结果保存到dest对应的集合中

```
"""并集"""
r.sunionstore("set4", "set3", "set2")
print('set4 = set3 | set2', r.smembers("set4"))
```



判断是否是集合的成员 类似in

```
sismember(name, value)
```

检查 value 是否是 name 对应的集合的成员，结果为 True 和 False

```
print('3 in set2:\t', r.sismember("set2", 3))
print('4 in set2:\t', r.sismember("set2", 4))
```



## Zset

Set 操作，Set 集合就是不允许重复的列表，本身是无序的

有序集合，在集合的基础上，为每元素排序；元素的排序需要根据另外一个值来进行比较，所以，对于有序集合，每一个元素有两个值，即：值和分数，分数专门用来做排序。

### 新增

**新增**

```
zadd(name, *args, **kwargs)
```

在 name 对应的有序集合中添加元素

```
import redis

r = redis.Redis(host='127.0.0.1', port=6379, decode_responses=True)
r.flushdb()

print('keys(*):\t', r.keys('*'))

# 添加两个有序几个
r.zadd("z_set1", {'m1': 22, 'm2': 44})

print('集合长度:\t', r.zcard("z_set1"))

# 获取有序集合中所有元素
print('z_range:\t', r.zrange("z_set1", 0, -1))

print('获取元素，不显示分数', r.zrevrange("z_set1", 0, -1))
print('获取元素和分数,分数倒序', r.zrevrange("z_set1", 0, -1, withscores=True))
```



**获取有序集合元素个数**

```
zcard(name)
```

获取 name 对应的有序集合元素的数量

```
print('集合长度:\t', r.zcard("z_set1"))
```



**获取所有元素**

```
r.zrange(name, start, end, desc=False, withscores=False, score_cast_func=float)
```

按照索引范围获取name对应的有序集合的元素 参数：

- `name`，redis的name
- `start`，有序集合索引起始位置（非分数）
- `end`，有序集合索引结束位置（非分数）
- `desc`，排序规则，默认按照分数从小到大排序
- `withscores`，是否获取元素的分数，默认只获取元素的值
- `score_cast_func`，对分数进行数据转换的函数

### 排序

**从大到小排序**(同zrange，集合是从大到小排序的)

```
zrevrange(name, start, end, withscores=False, score_cast_func=float)
```

```
# 获取有序集合中所有元素
print('z_range:\t', r.zrange("z_set1", 0, -1))

print('获取元素，不显示分数', r.zrevrange("z_set1", 0, -1))
print('获取元素和分数,分数倒序', r.zrevrange("z_set1", 0, -1, withscores=True))
```



**按照分数范围获取name对应的有序集合的元素**

```
zrangebyscore(name, min, max, start=None, num=None, withscores=False, score_cast_func=float)
```

```
for i in range(1, 30):
    element = 'n' + str(i)
    r.zadd("z_set2", {element: i})
print('z_set2:\t', r.zrevrange("z_set2", 0, -1))
print(r.zrangebyscore("z_set2", 15, 25))  # 在分数是15-25之间，取出符合条件的元素
print(r.zrangebyscore("z_set2", 12, 22, withscores=True))  # 在分数是12-22之间，取出符合条件的元素（带分数）
```



**按照分数范围获取有序集合的元素并排序（默认从大到小排序）**

```
zrevrangebyscore(name, max, min, start=None, num=None, withscores=False, score_cast_func=float)
```

```
# 在分数是22-11之间，取出符合条件的元素 按照分数倒序
print(r.zrangebyscore("z_set2", 12, 22, withscores=True))
```

**获取所有元素--默认按照分数顺序排序**

```
zscan(name, cursor=0, match=None, count=None, score_cast_func=float)
```

```
# 在分数是22-11之间，取出符合条件的元素 按照分数倒序
print(r.zscan("z_set2"))
```



**获取索引**

```
zrank(name, value)
```

获取某个值在 name对应的有序集合中的索引（从 0 开始）

更多：

`zrevrank(name, value)`，从大到小排序

```
"""获取索引"""
print(r.zrank("z_set2", "n1"))  # n1的索引号是0 这里按照分数顺序（从小到大）
print(r.zrank("z_set2", "n6"))  # n6的索引号是1

print(r.zrevrank("z_set2", "n1"))  # n1的索引号是29 这里安照分数倒序（从大到小）
```



### 删除

**删除指定值**

```
zrem(name, values)
```

删除 name 对应的有序集合中值是 values 的成员

```
# 删除指定值
r.zrem("z_set2", "n3")  # 删除有序集合中的元素n3 删除单个
print(r.zrange("z_set2", 0, -1))
```



**范围删除** 按照索引号来删除 zremrangebyrank(name, min, max) 根据排行范围删除

```
# 删除范围
r.zremrangebyrank("z_set3", 0, 1)  # 删除有序集合中的索引号是0, 1的元素
print(r.zrange("z_set3", 0, -1))
```



**删除**--根据分数范围删除

```
zremrangebyscore(name, min, max)
```

根据分数范围删除

```
# 删除范围
r.zremrangebyrank("z_set2", 0, 1)  # 删除有序集合中的索引号是0, 1的元素
print(r.zrange("z_set2", 0, -1))
```



获取值对应的分数

```
zscore(name, value)
```

获取 name 对应有序集合中 value 对应的分数

```
print(r.zscore("z_set2", "n27"))  # 获取元素 n27 对应的分数 27
```

1

## hash

### 新增

**单个增加--修改**

没有就新增，有的话就修改

```
hset(name, key, value)
```

name 对应的 hash 中设置一个键值对（不存在，则创建；否则，修改）

参数：

- `name`，redis 的name
- `key`，name 对应的 hash 中的 key
- `value`，name 对应的 hash 中的 value 注： `hsetnx(name, key, value)`,当 name 对应的 hash 中不存在当前 key 时则创建（相当于添加）

```
import redis

r = redis.Redis(host='127.0.0.1', port=6379, decode_responses=True)
r.flushdb()
print(r.keys('*'))

"""设置属性"""
r.hset("user1", "name", "正心")
r.hset("user1", "age", 16)
r.hset("user1", "hobby", '吃肉，喝酒')
print('hkeys("user1"):\t', r.hkeys("user1"))  # 取hash中所有的key
print('hvals("user1"):\t', r.hvals("user1"))  # 取hash中所有的key

print('获取单个值：\t', r.hget("user1", "name"))  # 单个取 hash 的 key 对应的值
print('获取多个值：\t', r.hmget("user1", "age", "hobby"))  # 多个取 hash 的 key 对应的值

r.hsetnx("user1", "age", 22)  # 只能新建
print(r.hget("user1", "age"))
```



**批量增加（取出）**

```
hmset(name, mapping)
```

在 name 对应的 hash 中批量设置键值对

参数：

- `name`，redis 的 name
- `mapping`，字典，如：`{'k1':'v1', 'k2': 'v2'}`

如：

```
r.hmset("user2", {"name": "张三", "age": 19, 'hobby': '赚钱'})
```



### 获取

**获取**`hget(name,key)`

在 name 对应的 hash 中获取根据 key 获取 value **批量获取**`hmget(name, keys, *args)`

在 name 对应的 hash 中获取多个 key 的值

参数:

- `name`，reids 对应的 name
- `keys`，要获取key集合，如：`['k1', 'k2', 'k3']`
- `*args`，要获取的key，如：`k1,k2,k3`

如：

```
print(r.hmget('user2', 'name'))  # 单个取出"user2"的value
print(r.hmget('user2', 'name', 'age'))  # 批量取出"user2"的的内容 方式 1
print(r.hmget('user2', ['name', 'age']))  # 批量取出"user2"的的内容 方式 2
```



**获取所有**

```
hgetall(name)
```

获取 name 对应 hash 的所有键值

```
print(r.hgetall('user2'))
```



得到所有键值对的格式 hash长度

**获取个数**`hlen(name)`

获取 name 对应的 hash 中键值对的个数

```
print(r.hlen('user2'))
```



**得到所有的keys** （类似字典的取所有keys）

```
hkeys(name)
```

获取 name 对应的 hash 中所有的 key 的值

```
print(r.hkeys("user2"))
```



**得到所有的value** （类似字典的取所有value）

```
hvals(name)
```

获取 name 对应的 hash 中所有的 value 的值

```
print(r.hvals("user2"))
```



**判断成员是否存在**（类似字典的in）

```
hexists(name, key)
```

检查 name 对应的 hash 是否存在当前传入的 key

```
print(r.hexists("user2", "gender"))  # False 不存在
print(r.hexists("user2", "hobby"))  # True 存在
```



**删除键值对**

```
hdel(name,*keys)
```

将 name 对应的 hash 中指定 key 的键值对删除

```
print(r.hgetall("user2"))
r.hset("user2", "hobby", "贪财")  # 修改已有的 hobby
r.hset("user2", "gender", "男")  # 新增键值对 k11
r.hdel("user2", "hobby")  # 删除一个键值对
print(r.hgetall("user2"))
```



## 其他常用操作

**删除**

```
delete(*names)
```

根据删除 redis 中的任意数据类型（string、hash、list、set、有序set）

```
r.delete("gender")  # 删除key为gender的键值对

```

**检查名字是否存在**

```
exists(name)
```

检测 redis 的 name 是否存在，存在就是 True，False 不存在

```
print(r.exists("zset1"))
```



**模糊匹配**

```
keys(pattern='*')
```

根据模型获取 redis 的 name

更多： `KEYS \*` 匹配数据库中所有 `key` 。 `KEYS h?llo` 匹配 `hello` ， `hallo` 和 `hxllo` 等。

`KEYS h*llo` 匹配 `hllo` 和 `heeeeello` 等。

```
KEYS h[ae]llo` 匹配 `hello` 和 `hallo` ，但不匹配 `hillo
```

```
print(r.keys("foo*"))
```



**设置超时时间**

```
expire(name ,time)
```

为某个 redis 的某个 name 设置超时时间

```
r.lpush("list5", 11, 22)
r.expire("list5", time=3)
print(r.lrange("list5", 0, -1))
time.sleep(3)
print(r.lrange("list5", 0, -1))
```



**重命名**

```
rename(src, dst)
```

对 redis 的 name 重命名

```
r.lpush("list5", 11, 22)
r.rename("list5", "list5-1")
```



**随机获取name**

```
randomkey()
```

随机获取一个 redis 的 name（不删除）

```
print(r.randomkey())
```



**获取类型**

```
type(name)
```

获取 name 对应值的类型

```
print(r.type("set1"))
print(r.type("hash2"))
```



**查看所有元素**

```
scan(cursor=0, match=None, count=None)
```

```
print(r.hscan("hash2"))
print(r.sscan("set3"))
print(r.zscan("zset2"))
print(r.getrange("foo1", 0, -1))
print(r.lrange("list2", 0, -1))
print(r.smembers("set3"))
print(r.zrange("zset3", 0, -1))
print(r.hgetall("hash1"))
```




**查看所有元素--迭代器**

```
scan_iter(match=None, count=None)
```

```
for i in r.hscan_iter("hash1"):
    print(i)

for i in r.sscan_iter("set3"):
    print(i)

for i in r.zscan_iter("zset3"):
    print(i)
```



**其他方法**

```
print(r.get('name'))  # 查询key为name的值
r.delete("gender")  # 删除key为gender的键值对
print(r.keys())  # 查询所有的Key
print(r.dbsize())  # 当前redis包含多少条数据
r.save()  # 执行"检查点"操作，将数据写回磁盘。保存时阻塞
# r.flushdb()        	# 清空r中的所有数据
```