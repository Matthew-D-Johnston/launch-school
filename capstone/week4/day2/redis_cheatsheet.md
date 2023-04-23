## Redis Cheat Sheet

Redis is an open source, in-memory key-value data structure store, which can be used as a database, cache, or message broker. It’s a NoSQL database ([Redis](https://redis.com/nosql/what-is-nosql/)).

Redis, which stands for Remote Dictionary Server, is a fast, open source, in-memory, key-value data store ([Amazon](https://aws.amazon.com/redis/)).

#### What data model does your NoSQL database use?

Redis employs an in-memory key-value data model ([Redis](https://redis.com/nosql/what-is-nosql/)).

**Key-value stores** are the least complex of the NoSQL databases. They are a collection of key-value pairs, and their simplicity makes them the most scalable of NoSQL databases types. Key-value can be a string, a number, and an entirely new set of key-value pairs encapsulated in an object. Use cases include shopping carts, user preferences, and leaderboards ([Redis](https://redis.com/nosql/what-is-nosql/)).

**In-memory** databases are data stores that are purpose-built to rely on DRAM for data storage to enable sub-millisecond responses. This is in contrast to most NoSQL and SQL databases that store data on disk or SSD/flash memory. It means that each time you query an in-memory database or update data in a database, you only access the main memory. There’s no disk involved in these operations. And this is good, because the main memory is much faster than any disk. In-memory databases can also retain persistent data by keeping each operation on a disk in a transaction log or a snapshot. Use cases include leaderboards, session stores, and real-time analytics ([Redis](https://redis.com/nosql/what-is-nosql/)).

#### Does it handle scaling and replication easily?

Redis is scalable and can implement replication. Whether it's easy or not is another question.

Redis employs a primary-replica architecture and supports asynchronous replication where data can be replicated to multiple replica servers. This provides improved read performance (as requests can be split among the servers) and faster recovery when the primary server experiences an outage ([Amazon](https://aws.amazon.com/redis/)).

Redis is an in-memory database, which means that the whole dataset should reside in the memory (RAM). This can be costly if you are planning to have large datasets. So, scaling can be expensive.

#### Does it prefer consistency or availability?

Redis offers a primary-replica architecture in a single node primary or a clustered topology. This allows you to build highly available solutions providing consistent performance and reliability ([Amazon](https://aws.amazon.com/redis/)).

Redis was not built to be a durable and consistent database ([Amazon](https://aws.amazon.com/redis/)).

For open source Redis, there is weak consistency, but Redis Enterprise’s [Active](https://redis.com/redis-enterprise/technology/active-active-geo-distribution/)–[Active Geo-Distribution](https://redis.com/redis-enterprise/technology/active-active-geo-distribution/) provides strong eventual consistency ([Redis](https://redis.com/blog/database-consistency/)).

Redis Enterprise is a self-managed, real-time data platform that unlocks the [full potential of Redis at scale](https://redis.com/redis-enterprise-software/overview/), ensuring five-nines (5-9s) high availability ([Redis](https://redis.com/redis-enterprise/technology/highly-available-redis/)).

#### What are its biggest use cases?

All Redis data resides in memory, which enables low latency and high throughput data access. Unlike traditional databases, In-memory data stores don’t require a trip to disk, reducing engine latency to microseconds. Because of this, in-memory data stores can support an order of magnitude more operations and faster response times. The result is blazing-fast performance with average read and write operations taking less than a millisecond and support for millions of operations per second ([Amazon](https://aws.amazon.com/redis/)).

Redis is fast, which makes it a popular choice for caching, session management, gaming, leaderboards, real-time analytics, geospatial, ride-hailing, chat/messaging, media streaming, and pub/sub apps ([Amazon](https://aws.amazon.com/redis/)).

#### What are drawbacks and shortcomings of the database?

###### Persistence

Persistence can impact performance since Redis will use memory dump to create snapshots used for persistency. Depending on your configuration of the fsync linux command, taking snapshots can slow the database down (https://alronz.github.io/Factors-Influencing-NoSQL-Adoption/site/Redis/Results/Strengths%20and%20Weaknesses/).

###### Query and Aggregation

Redis isn't intended for rich queries since it is a key-value database. There is no internal full-text search support and it is difficult to model relationships using Redis. Additionally, aggregate functions such as sum, average aren’t supported and need to be handled in the client side (https://alronz.github.io/Factors-Influencing-NoSQL-Adoption/site/Redis/Results/Strengths%20and%20Weaknesses/).

###### Security

Redis supports only basic security options. Redis doesn't provide any access control and this should be provided by a separate authorization layer. Redis doesn't also support any encryption mechanism and this should be implemented also using a separate layer such as SSL proxy (https://alronz.github.io/Factors-Influencing-NoSQL-Adoption/site/Redis/Results/Strengths%20and%20Weaknesses/).

---

**What data model does your NoSQL database use?**

In-memory key-value

**Does it handle scaling and replication easily?**

Yes. It does because redis is designed like that. They use automated clustering to make sharding easier. It uses hash slot to ensure keys are distributed consistently.

**Does it prefer consistency or availability?**

It prefers availability. It has 99.999% availability. For open source Redis there is weak consistency.

**What are its biggest use cases?**

- Real-time data store
- Caching & session storage
- Streaming & messaging

**What are drawbacks and shortcomings of the database?**

Redis is used for in-memory data storage. It is not designed for persistent data storage. Using redis's solution for persistent data storage could slow data retrieval.

Redis is not intended for rich query because we are using key:value as data model

Redis is an in-memory database, meaning that the whole dataset resides in memory (RAM). This can be costly for large datasets, meaning scaling can be expensive.



**Resources**

https://aws.amazon.com/redis/

https://architecturenotes.co/redis/

https://redis.io/docs/about/