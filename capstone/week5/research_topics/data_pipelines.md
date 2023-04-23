## Data Pipelines

#### What is a Data Pipeline?

A data pipeline is a means of moving data from one place (the source) to a destination (such as a data warehouse). Along the way, data is transformed and optimized, arriving in a state that can be analyzed and used to develop business insights (https://www.snowflake.com/guides/data-pipeline).

A data pipeline is any set of automated workflows that extract data from multiple sources (https://aiven.io/blog/7-challenges-that-data-pipelines-must-solve). A data pipeline essentially *is* the steps involved in aggregating, organizing, and moving data. Modern data pipelines automate many of the manual steps involved in transforming and optimizing continuous data loads (https://www.snowflake.com/guides/data-pipeline).

#### Why do Data Pipelines Exist?

Consider an organization that wants to analyze its data but those data are spread out across multiple systems and services. The data is siloed in separate data stores. Doing data analysis becomes a challenge in such a scenario (https://www.snowflake.com/guides/data-pipeline). 

In order for the data to be analyzed in its entirety, the data needs to be aggregated into a single place. By consolidating data from various silos into a single source of truth, an organization is able to ensure consistent data quality and to perform quick data analysis for business insights. This is what data pipelines do (https://www.snowflake.com/guides/data-pipeline).

The ability to do data analysis is at the center of the question of why data pipelines exist.

#### Types of Data Pipelines

There exist two main types of data pipelines, batch processing and streaming data (https://www.ibm.com/topics/data-pipeline).

##### Batch processing

As the name implies, batch processing loads “batches” of data into a repository during set time intervals, which are typically scheduled during off-peak business hours. This way, other workloads aren’t impacted as batch processing jobs tend to work with large volumes of data, which can tax the overall system. Batch processing is usually the optimal data pipeline when there isn’t an immediate need to analyze a specific dataset (e.g. monthly accounting) (https://www.ibm.com/topics/data-pipeline).  

Batch processing jobs form a workflow of sequenced commands, where the output of one command becomes the input of the next command. For example, one command may kick off data ingestion, the next command may trigger filtering of specific columns, and the subsequent command may handle aggregation. This series of commands will continue until the data is completely transformed and written into data repository (https://www.ibm.com/topics/data-pipeline).

##### Streaming data

Unlike batching processing, streaming data is leveraged when it is required for data to be continuously updated. For example, apps or point of sale systems need real-time data to update inventory and sales history of their products; that way, sellers can inform consumers if a product is in stock or not. A single action, like a product sale, is considered an “event”, and related events, such as adding an item to checkout, are typically grouped together as a “topic” or “stream.” These events are then transported via messaging systems or message brokers, such as the open-source offering, Apache Kafka (https://www.ibm.com/topics/data-pipeline).  

Since data events are processed shortly after occurring, streaming processing systems have lower latency than batch systems, but aren’t considered as reliable as batch processing systems as messages can be unintentionally dropped or spend a long time in queue. Message brokers help to address this concern through acknowledgements, where a consumer confirms processing of the message to the broker to remove it from the queue (https://www.ibm.com/topics/data-pipeline).

#### Data Pipeline Architecture

Three core steps make up the architecture of a data pipeline (https://www.ibm.com/topics/data-pipeline).

**1. Data ingestion:** Data is collected from various data sources, which includes various data structures (i.e. structured and unstructured data). Within streaming data, these raw data sources are typically known as producers, publishers, or senders. While businesses can choose to extract data only when they are ready to process it, it’s a better practice to land the raw data within a cloud data warehouse provider first. This way, the business can update any historical data if they need to make adjustments to data processing jobs (https://www.ibm.com/topics/data-pipeline). 

**2. Data Transformation:** During this step, a series of jobs are executed to process data into the format required by the destination data repository. These jobs embed automation and governance for repetitive workstreams, like business reporting, ensuring that data is cleansed and transformed consistently. For example, a data stream may come in a nested JSON format, and the data transformation stage will aim to unroll that JSON to extract the key fields for analysis (https://www.ibm.com/topics/data-pipeline).

**3. Data Storage:** The transformed data is then stored within a data repository, where it can be exposed to various stakeholders. Within streaming data, this transformed data are typically known as consumers, subscribers, or recipients (https://www.ibm.com/topics/data-pipeline). 



#### Challenges Faced by Data Pipelines

1. Getting the data where it needs to be
2. Hosting (and storing) the data
3. Flexing the data (you need to be able to flex your data today: analytics data pipes must be elastic enough to accommodate all kinds of data with few constraints on schema or type)
4. Scaling with the data
5. Moving the data around
6. Mashing up and transforming the data (means getting competitive insights on all of the data)
7. Visualizing everything (data needs to be available in a form that could be further queried and analyzed, and eventually visualized) (https://aiven.io/blog/7-challenges-that-data-pipelines-must-solve)

##### Infrastructure Challenges

* **Integrating new data sources:** data pipelines collect data from multiple distributed devices and make it available in a single access point. Data pipelines should be able to integrate new data sources as well as accommodate the data from the new sources. The format of the data produced by the new sources may not be compatible with the data pipeline standards (https://research.chalmers.se/publication/523476/file/523476_Fulltext.pdf).
* **Data pipeline scalability:** The ability of a data pipeline to scale with the increased amount of ingested data, while keeping the cost low is a real challenge experienced by the data pipeline developers (https://research.chalmers.se/publication/523476/file/523476_Fulltext.pdf).

##### Data Quality Challenges

* **Missing data files:** Data files can be lost completely or partially during the transmission from one node to another. Fault detection mechanism can identify the exact point of disappearance. However, obtaining the missing files once again is a complicated task (https://research.chalmers.se/publication/523476/file/523476_Fulltext.pdf).

##### Other Challenges

* **Reverse engineering the data model:** Data pipelines are meant to provide analysts with the data assets they need to make sense of their data and support decisions. This requires a deep understanding of the underlying [schema](https://www.fivetran.com/blog/what-is-a-database-schema) or data model for whatever source you’re extracting data from. Unfortunately, the raw data exposed through an API isn’t always neatly organized into models that are usable or even intelligible to a human (https://www.fivetran.com/blog/10-data-pipeline-challenges-your-engineers-will-have-to-solve).
* **Schema drift handling:** The data model that you painstakingly reverse engineered is [likely to change](https://www.fivetran.com/blog/reliable-data-replication-in-the-face-of-schema-drift) at some point, too. Modern cloud-based applications are in a constant state of change as SaaS providers add new features and build increasingly comprehensive data models. At any time, your typical SaaS API endpoint may add new columns and tables or fundamentally reorganize the entire schema (https://www.fivetran.com/blog/10-data-pipeline-challenges-your-engineers-will-have-to-solve). 

##### Streaming / Real-Time Ingestion Challenges

* Streaming data ingestion, also known as real-time ingestion, refers to the process of continuously collecting, parsing, and processing large volumes of data as they are generated, often in near real-time. This can be a challenge because the data is typically generated at high speeds and in high volumes, and there is often a need to process it as quickly as possible in order to gain insights or take action in a timely manner.
* One of the main challenges of streaming data ingestion is the need to scale the ingestion pipeline to handle the high volume of data. This may require the use of distributed systems and distributed processing frameworks, such as Apache Spark or Apache Flink, which can parallelize the ingestion and processing of data.
* Another challenge is ensuring the reliability and fault tolerance of the ingestion pipeline, as it must be able to handle failures and continue processing data without interruption. This may require the use of techniques such as data replication, checkpointing, and fault-tolerant processing.
* Finally, [streaming data ingestion systems](https://hevodata.com/learn/real-time-data-ingestion-tools/) must often deal with the challenge of data variety, as the data may be generated in a variety of formats and may need to be transformed and integrated with other data sources before it can be analyzed or acted upon.

#### Model Projects

* Apache Airflow
* Stitch
* FiveTran
* Pentaho Data Integration
* **Embulk**
* **Fluentd**
* **Logstash**

#### Data Ingestion Tools

- [Amazon Kinesis](https://aws.amazon.com/kinesis/) - Easily collect, process, and analyze video and data streams in real time.
- [Apache Gobblin](https://github.com/apache/gobblin) - A framework that simplifies common aspects of big data such as data ingestion.
- [Apache Kafka](https://github.com/apache/kafka) - Open-source distributed event streaming platform used by thousands of companies.
- [Apache Pulsar](https://github.com/apache/pulsar) - Distributed pub-sub messaging platform with a flexible messaging model and intuitive API.
- [Embulk](https://github.com/embulk/embulk) - A parallel bulk data loader that helps data transfer between various storages.
- [Fluentd](https://github.com/fluent/fluentd) - Collects events from various data sources and writes them to files.
- [Google PubSub](https://cloud.google.com/pubsub) - Ingest events for streaming into BigQuery, data lakes or operational databases.
- [Nakadi](https://github.com/zalando/nakadi) - A distributed event bus that implements a RESTful API abstraction on top of Kafka-like queues.
- [Pravega](https://github.com/pravega/pravega) - An open source distributed storage service implementing Streams.
- [RabbitMQ](https://www.rabbitmq.com/) - One of the most popular open source message brokers.

---

#### Streaming Data Pipelines

* Data is sent from a source to a target as the data happens in real time, as a stream.
* Ingesting data as it is created.
* Not just getting data from A to B, but doing some kind of transformation on the data in the process.

As a quick definition, stream processing is the realtime or near-realtime processing of data “in motion”. Unlike batch processing, where data is collected over time and then analyzed, stream processing enables you to query and analyze continuous data streams, and react to critical events within a brief timeframe (usually milliseconds) (https://ably.com/blog/a-look-at-8-top-stream-processing-platforms).

Stream processing goes hand in hand with [event streaming](https://ably.com/topic/event-streaming). Let’s now briefly explain what we mean by that. For example, [Apache Kafka](https://kafka.apache.org/), a popular open-source [pub/sub](https://ably.com/topic/pub-sub) messaging solution, is primarily used to enable the flow of data between back-end apps and services. You have services publishing (writing) events to Kafka topics, and other services consuming (reading) events from Kafka - all in real time. This is called event streaming (https://ably.com/blog/a-look-at-8-top-stream-processing-platforms).

#### Use Cases for Stream Processing

- Realtime fraud detection & payments
- IoT sensor data
- Realtime dashboards, e.g., [medical BI dashboard](https://ably.com/case-studies/experity)
- Log, traffic, and network monitoring
- Context-aware online advertising & user behavior tracking
- Geofencing and vehicle tracking
- Cybersecurity

(https://ably.com/blog/a-look-at-8-top-stream-processing-platforms).

Some real-life examples of streaming data include use cases in every industry, including real-time stock trades, up-to-the-minute retail inventory management, social media feeds, multiplayer game interactions, and ride-sharing apps (https://www.confluent.io/learn/data-streaming/).

#### Why Stream Processing Exists?

Today's data is generated by an infinite amount of sources - IoT sensors, servers, security logs, applications, or internal/external systems. It’s almost impossible to regulate structure, data integrity, or control the volume or velocity of the data generated (https://www.confluent.io/learn/data-streaming/).  

While traditional solutions are built to ingest, process, and structure data before it can be acted upon, streaming data architecture adds the ability to consume, persist to storage, enrich, and analyze data in motion (https://www.confluent.io/learn/data-streaming/).

As such, applications working with data streams will always require two main functions: storage and processing. Storage must be able to record large streams of data in a way that is sequential and consistent. Processing must be able to interact with storage, consume, analyze and run computation on the data (https://www.confluent.io/learn/data-streaming/).

This also brings up additional challenges and considerations when working with legacy databases or systems. Many platforms and tools are now available to help companies build streaming data applications (https://www.confluent.io/learn/data-streaming/).

##### Benefits of Stream Processing

Data collection is only one piece of the puzzle. Today’s enterprise businesses simply cannot wait for data to be processed in batch form. Instead, everything from fraud detection and stock market platforms, to ride share apps and e-commerce websites rely on real-time event streams (https://www.confluent.io/learn/data-streaming/).

Paired with streaming data, applications evolve to not only integrate data, but process, filter, analyze, and react to event as they happen in real-time. This opens a new plethora of use cases such as real-time fraud detection, Netflix recommendations, or a seamless shopping experience across multiple devices that updates as you shop (https://www.confluent.io/learn/data-streaming/).

In short, any industry that deals with large volumes of real-time data can benefit from continuous, real-time event stream processing platforms (https://www.confluent.io/learn/data-streaming/).

#### Challenges for Real-Time Applications

**Scalability**: When system failures happen, log data coming from each device could increase from being sent a rate of kilobits per second to megabits per second and aggregated to be gigabits per second. Adding more capacity, resources and servers as applications scale happens instantly, exponentially increasing the amount of raw data generated. Designing applications to scale is crucial in working with streaming data (https://www.confluent.io/learn/data-streaming/).

**Ordering**: It is not trivial to determine the sequence of data in the data stream and very important in many applications. A chat or conversation wouldn’t make sense out of order. When developers debug an issue by looking an aggregated log view, it’s crucial that each line is in order. There are often discrepancies between the order of the generated data packet to the order in which it reaches the destination. There are also often discrepancies in timestamps and clocks of the devices generating data. When analyzing data streams, applications must be aware of its assumptions on ACID transactions (https://www.confluent.io/learn/data-streaming/).

**Consistency and Durability**: Data consistency and data access is always a hard problem in data stream processing. The data read at any given time could already be modified and stale in another data centre in another part of the world. Data durability is also a challenge when working with data streams on the cloud (https://www.confluent.io/learn/data-streaming/).

**Fault Tolerance & Data Guarantees**: these are important considerations when working with data, stream processing, or any distributed systems. With data coming from numerous sources, locations, and in varying formats and volumes, can your system prevent disruptions from a single point of failure? Can it store streams of data with high availability and durability? (https://www.confluent.io/learn/data-streaming/).







