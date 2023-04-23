## Caches

#### What is a cache?

##### A few definitions:

* A cache is a hardware or software component that stores data so that future requests for that data can be served faster; the data stored in a cache might be the result of an earlier computation or a copy of data stored elsewhere.

* In computing, a cache is a high-speed data storage layer which stores a subset of data, typically transient in nature, so that future requests for that data are served up faster than is possible by accessing the data's primary storage location.
* A cache is a special storage space for temporary files that makes a device, browser, or app run faster and more efficiently.

##### Some key terms:

* cache hit: occurs when the requested data can be found in a cache.
* cache miss: occurs when the requested data cannot be found in a cache.



#### Why do we want to use a cache?

* A cache's primary purpose is to increase data retrieval performance by reducing the need to access the underlying slower storage layer.
* Caching is used to reduce the time and resources needed to generate a result. Instead of fetching data from its source or generating a response each time it is requested, caching builds the result once and stores it in cache.
* Caching is a very important technique for scalability.

##### A Tradeoff:

* There is an inherent trade-off between size and speed (given that a larger resource implies greater physical distances).
* Trading off capacity for speed, a cache typically stores a subset of data transiently, in contrast to databases whose data is usually complete and durable.



#### What are the pros and cons to adding a cache to a system?

##### pros

* caching increases performance and scalability at low cost
* Caching is fairly simple and can usually be added to an existing application without expensive rearchitecture

##### cons

* Data can become stale in the cache and that stale data could be served instead of the latest version of the data.
* There is some overhead in all the business logic that needs to be used to ensure that data is somewhere between being fast and being stale. This means more code which adds to complexity.



#### What techniques are used to add and remove data from a cache?

#### Adding:

Five popular database caching strategies include: cache-aside, read-through, write-through, write-back, and write-around.

##### Cache-aside:

In a [cache-aside](https://www.prisma.io/dataguide/intro/database-glossary#cache-aside) arrangement, the database cache sits next to the database. When the application requests data, it will check the cache first. If the cache has the data (a cache hit), then it will return it. If the cache does not have the data (a cache miss), then the application will query the database. The application then stores that data in the cache for any subsequent queries.

##### Read-through:

In a [read through cache](https://www.prisma.io/dataguide/intro/database-glossary#read-through-caching) arrangement, the cache sits between the application and the database. It can be envisioned like a straight line from application to database with the cache in the middle. In this strategy, the application will always speak with the cache for a read, and when there is a cache hit, the data is immediately returned. In the case of a cache miss, the cache will populate the missing data from the database and then return it to the application. For any data [writes](https://www.prisma.io/dataguide/intro/database-glossary#write-operation), the application will still go directly to the database.

##### Write-through:

A [write-through caching](https://www.prisma.io/dataguide/intro/database-glossary#write-through-caching) strategy differs from the previously two mentioned because instead of writing data to the database, it will write to the cache first and the cache immediately writes to the database. The arrangement can still be visualized like the read-through strategy, in a straight line with the application in the middle.

##### Write-back:

[Write-back](https://www.prisma.io/dataguide/intro/database-glossary#write-back-caching) works almost exactly the same as the write-through strategy except for one key detail. In a write-back strategy, the application again writes directly to the cache. However, the cache does not immediately write to the database, and it instead writes after a delay.

##### Write-around:

A [write-around caching](https://www.prisma.io/dataguide/intro/database-glossary#write-around-caching) strategy will be combined with either a cache-aside or a read-through. In this arrangement, data is always written to the database and the data that is read goes to the cache. If there is a cache miss, then the application will read to the database and then update the cache for next time.

#### Removing:

##### Least Recently Used:

Cache servers usually use the LRU algorithm to decide which objects should be removed from cache once they reach a memory limit. Any time you want to store a new object in the cache, the cache server checks if there is enough memory to add it in. If there is no space left, it removes the objects that were least recently used to make enough space for your new object.

##### Least Frequently Used:

Counts how often an item is needed. Those that are used least often are discarded first.

##### Random Replacement:

Randomly selects a candidate item and discards it to make space when necessary.

##### Simple queue-based policies:

Examples include FIFO: the cache evicts the blocks in the order they were added.



#### Caches are non-persistent data stores, while databases are persistent. What does this mean?

Caches store data temporarily while data stored in a database is meant to persist until it is updated or overwritten.

#### What are the pros and cons of using memory vs. disk to store data?

* Retrieving data from memory is faster than retrieving data from disk storage.
* However, data stored in memory is temporary, whereas data stored on disk is more permanent.
* Memory is relatively more expensive than disk storage.