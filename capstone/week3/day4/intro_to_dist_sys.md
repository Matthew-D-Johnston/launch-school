## Intro to Distributed Systems

#### Core Pillars of Distributed Systems:

* Consistency: you always get the most recent data from the system when you request it.
* Availability: you can always access the system, even if the data you get back is not the most up-to-date.
* Partition Tolerance: the system can operate even when separated by the network.

#### Monolith:

* when an entire system is located on one machine or group of machines in one location.
* well-suited for small applications and systems that don't need to worry about global users or handling tons of requests.
* consistent and available.
* everything is located in one place.
* What happens when you grow?—vertical scaling at first! But eventually this becomes expensive.

#### Benefits of a Distributed System

* potentially cheaper past a certain point.
* allows you to have a modular system.
* you can now modify and scale each component independently of each other.
* you can swap out components with replacements.
* decouple your services, making it so that each component has its specific job to perform.

#### Issues with Distributed Systems

* require a lot of forethought and focus on architecture to get right.
* have to figure out how to pass data correctly between each component and whether you need to modify the data before passing it off.
* unreliable networks; something out of our control.
* with replicated databases, it can be a pain to handle having the correct data everywhere.
* can be difficult to debug issues when you need to consider how components work together and data is passed between each one.
* more opportunities for bottlenecks and single points of failure.

#### Components of a Distributed System:

##### Web / Proxy Server

* HTTP handling
* takes in client requests.
* routes requests to the proper backend component.
* returns the response to the client.
* solves the problem of "I have this request, which backend piece do I send it to?"

##### Databases

* Solves the problem of "How do we store our data over time?"
* There are many different types of databases, and some distributed systems can use several types at once!
* Each type has specific use cases with various nuances.
* Generally, we divide them into SQL databases and NoSQL databases.
* SQL dbs allow you to easily analyze and slice + dice your data but don't easily scale horizontally.
* NoSQL dbs do easily scale horizontally, but are not great for analytics.

##### Cache

* In-memory data store.
* Used to store data that is most frequently requested.
* Takes load off the databases.
* Can be placed in many different areas of a system.
* Solves the problem of "How do I speed up the client requests for certain data?"
* Cache invalidation is HARD.
* When cache gets full, you have to figure out which data to remove to free up space (least recently used LRU is most popular).

##### Load Balancer

* Evenly distributes incoming requests across machines, most often servers or databases.
* Can be placed in multiple areas of a system depending on where you need it.
* Solves the problem of "How do I make sure that none of my machines receive more requests than they can handle?"

##### Queue

* Takes requests and holds them until they can be processed.
* Requests are taken off the queue based on when they were entered (First In, First Out (FIFO)).
* Solves the problem of "How do I manage requests when my servers are too busy?"
* Best used for asynchronous requests—users send the request off and told "Your request has been received".