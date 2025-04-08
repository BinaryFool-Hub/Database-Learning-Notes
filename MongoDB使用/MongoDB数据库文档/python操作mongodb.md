- https://codeleading.com/article/10862069010/

  https://blog.csdn.net/The_Time_Runner/article/details/96165410

  # python 使用 pymongo 操作 MongoDB 数据库

  官方文档： https://pymongo.readthedocs.io/en/stable/

  ## 安装

  直接使用 pip 就可以安装

  

  ```
  python -m pip install pymongo
  ```

  如果想要安装特定版本，也可以指定安装

  

  ```
  python -m pip install pymongo==4.3.3
  ```

  

  ## 链接数据库

  确保电脑上安装了 MongoDB，并且可以进行访问

  ### 建立连接

  第一步是创建一个 pymongo 的实例对象

  ```
  # 导入 pymongo 模块
  import pymongo
  
  client = pymongo.MongoClient("localhost", 27017)
  
  # 也可以使用  MongoDB URI 格式链接
  # client = MongoClient("mongodb://localhost:27017/")
  ```

  

  ### 链接数据库

  MongoDB 可以拥有多个数据库，使用 pymongo 链接数据库的时候，可以使用 `MongoClend` 的实例属性直接访问数据库

  

  ```
  db = client.test_database
  ```

  

  如果数据库的名字无法使用属性进行访问（例如`test-databases`），则可以改用字典的方式进行访问：

  

  ```
  db = client["test-database"]
  ```

  ### 获取文档集合

  文档集合是 MongoDB 的一组文档，大概相当于 MySQL 中的数据表，pymong 中获取文档集合与获取数据库的工作方式相同：

  

  ```
  collection = db.test_collection
  ```

  

  或者使用字典的方式进行访问

  

  ```
  collection = db["test-collection"]
  ```

  ## 文档

  MongoDB 中的数据使用类似 JSON 格式进行存储。在 pymongo 中，我们使用字典来表示文档。例如，以下字典可用于表示博客文章：

  python

  ```
  import datetime
  
  post = {
      "author": "正心",
      "text": "我的第一篇博客文章!",
      "tags": ["mongodb", "python", "pymongo"],
      "date": datetime.datetime.now(tz=datetime.timezone.utc),
  }
  ```

  

  请注意，文档中的内容包含 Python 对象（例如：`datetime.datetime` 实例），这些类型将自动的与 [BSON](https://bsonspec.org/) 进行类型转化

  ### 插入文档

  要将文档插入文档集合中，我们可以使用 `insert_one()` 方法：

  ```
  # 获取文档集合
  posts: Collection = db.posts
  
  # 插入文档数据
  post1 = posts.insert_one(post)
  print(post1.inserted_id)
  ```

  

  插入文档时，如果文档尚未包含 `_id` 键，则会自动添加特殊键 `_id` 。 `_id` 的值在整个集合中必须是唯一的（类似 MySQL 的自增主键）。 `insert_one()` 返回 `InsertOneResult` 的实例。有关 `_id` 的更多信息，请参阅[有关 _id 的文档](https://www.mongodb.com/docs/manual/reference/method/ObjectId/)。

  插入第一个文档后，posts 集合实际上已经在服务器上创建了。我们可以通过列出数据库中的所有集合来验证这一点：

  

  ```
  print(db.list_collection_names())
  # out: ['posts']
  ```

  

  ### 查询单个文档

  MongoDB 中可以执行的最基本的查询类型是 [`find_one()`](https://pymongo.readthedocs.io/en/stable/api/pymongo/collection.html#pymongo.collection.Collection.find_one) 。此方法返回与查询匹配的单个文档（如果没有匹配项，则返回 `None` ）。当您知道只有一个匹配文档或只对第一个匹配项感兴趣时，它非常有用。这里我们使用 `find_one()` 从 posts 集合中获取第一个文档：

  

  ```
  import pprint
  pprint.pprint(posts.find_one())
  ```

  

  输出内容如下

  

  ```
  {'_id': ObjectId('64c0bfbe009a17edbee53ac7'),
   'author': '正心',
   'date': datetime.datetime(2023, 7, 26, 6, 24, 59, 57000),
   'tags': ['mongodb', 'python', 'pymongo'],
   'text': '我的第一篇博客文章!'}
  ```

  

  结果与我们之前插入的文档是匹配的。

  如果我们尝试使用不同的作者，例如“艾略特”，我们将不会得到结果：

  

  ```
  print(posts.find_one({"author": "艾略特"}))
  # out: None
  ```

  

  ### 通过 id 查找

  我们还可以通过 `_id` 查找文档，在我们的示例中它是一个 ObjectId：

  

  ```
  post_id = post1.inserted_id
  pprint.pprint(posts.find_one({"_id": post_id}))
  ```

  

  输出内容

  

  ```
  {'_id': ObjectId('64c0bfbe009a17edbee53ac7'),
   'author': '正心',
   'date': datetime.datetime(2023, 7, 26, 6, 24, 59, 57000),
   'tags': ['mongodb', 'python', 'pymongo'],
   'text': '我的第一篇博客文章!'}
  ```

  

  批量插入数据

  

  ```
  new_posts = [
      {
          "author": "Mike",
          "text": "Another post!",
          "tags": ["bulk", "insert"],
          "date": datetime.datetime(2009, 11, 12, 11, 14),
      },
      {
          "author": "Eliot",
          "title": "MongoDB is fun",
          "text": "and pretty easy too!",
          "date": datetime.datetime(2009, 11, 10, 10, 45),
      },
  ]
  result = posts.insert_many(new_posts)
  print(result.inserted_ids)
  # out: [ObjectId('64c0c0c7177ce078c7f7a571'), ObjectId('64c0c0c7177ce078c7f7a572')]
  ```

  

  在刚刚这个示例中，有一些事情需要注意

  1. `insert_many()` 的结果现在返回两个 `ObjectId` 实例，每个实例对应一个插入的文档。
  2. `new_posts[1]` 的内容与其他文档不同 - 没有 `"tags"` 字段，而是添加了一个新字段 `"title"` 。这说明 MongoDB 没有固定格式。

  ### 查询多个文档

  要获取多个文档作为查询结果，我们使用 `find()` 方法。 `find()` 返回一个 `Cursor` 实例，它允许我们迭代所有匹配的文档。例如，我们可以迭代 `posts` 集合中的每个文档：

  

  ```
  for post in posts.find():
      pprint.pprint(post)
  ```

  

  输出内容如下

  

  ```
  {'_id': ObjectId('64c0c0c7177ce078c7f7a570'),
   'author': '正心',
   'date': datetime.datetime(2023, 7, 26, 6, 44, 23, 462000),
   'tags': ['mongodb', 'python', 'pymongo'],
   'text': '我的第一篇博客文章!'}
  {'_id': ObjectId('64c0c0c7177ce078c7f7a571'),
   'author': 'Mike',
   'date': datetime.datetime(2009, 11, 12, 11, 14),
   'tags': ['bulk', 'insert'],
   'text': 'Another post!'}
  {'_id': ObjectId('64c0c0c7177ce078c7f7a572'),
   'author': 'Eliot',
   'date': datetime.datetime(2009, 11, 10, 10, 45),
   'text': 'and pretty easy too!',
   'title': 'MongoDB is fun'}
  ```

  

  就像我们对 `find_one()` 所做的那样，我们可以将文档传递给 `find()` 来限制返回的结果。在这里，我们只获取作者为“正心”的文档：

  

  ```
  for post in posts.find({"author": "正心"}):
      pprint.pprint(post)
  ```

  

  输出结果为

  

  ```
  {'_id': ObjectId('64c0c0c7177ce078c7f7a570'),
   'author': '正心',
   'date': datetime.datetime(2023, 7, 26, 6, 44, 23, 462000),
   'tags': ['mongodb', 'python', 'pymongo'],
   'text': '我的第一篇博客文章!'}
  ```

  

  ### 范围查询

  MongoDB 支持许多不同类型的高级查询。例如，让我们执行一个查询，将结果限制为早于特定日期的帖子，但也按作者对结果进行排序：

  python

  ```
  d = datetime.datetime(2009, 11, 12, 12)
  for post in posts.find({"date": {"$lt": d}}).sort("author"):
      pprint.pprint(post)
  ```

  

  ## 其他案例

  大部分逻辑与之前学习的 MongoDB 指令一样，建议配合官方文档的案例使用。

  https://pymongo.readthedocs.io/en/stable/examples/index.html