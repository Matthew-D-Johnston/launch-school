## Event Streaming and Event Stream Processing

#### An Overview of Event Streaming

Event streaming is an implementation of the [publish/subscribe architecture pattern](https://ably.com/topic/pub-sub) (pub/sub) with certain specific characteristics. The pub/sub pattern involves the following elements:

- Message: discrete data a publisher wishes to communicate to a subscriber.
- Publisher: puts messages in a message broker in a particular topic.
- Subscriber: reads messages from a message broker's particular topic.
- Message broker: a system with the ability to store messages from publishers and make them available to subscribers
- Channel or Topic: a subset of events that share a category. The terms topic and channel are used interchangeably in the industry. In this blog post, we'll refer to these as **topics.**

![img](https://images.ctfassets.net/ee3ypdtck0rk/2O6r09sErkbKmBVglCAjO1/1082c0aba4daf7082ddd4068fa60490c/pub-sub-pattern-example.png?w=1688&h=580&q=50&fm=png)

(https://ably.com/topic/event-streaming).

What makes event streaming particular as an implementation of pub/sub is that:

- Messages are events.
- Messages (within a topic) are ordered, typically based on a relative or absolute notion of time.
- Subscribers/Consumers can subscribe to read events from a particular point in the topic.
- The messaging framework supports temporal durability. Events are not removed once they are "processed". Instead, the removal happens after a certain amount of time, such as "after 1 hour".

(https://ably.com/topic/event-streaming).

##### What is an Event?

An event stores information about a state change in the system that has "business meaning" (https://ably.com/topic/event-streaming).  

Events represent a change of state, but they do not specify how that state change should modify the system. Instead, that is up to consumers to implement (https://ably.com/topic/event-streaming).

##### What is an Event Stream?

An event stream is a sequence of events, meaning order between events matters. Events flow through the system in a specific direction: from producers to consumers (https://ably.com/topic/event-streaming).

![img](https://images.ctfassets.net/ee3ypdtck0rk/1W6b91jfnBAvCQI1eowBNu/7312244b0244b6221bb4e786529ad030/pub-sub-pattern-at-scale.png?w=2540&h=1214&q=50&fm=png)

As producer events occur in producers, they are published to a topic. A topic is typically a categorization for a particular type of event. Subscribers interested in events of a particular category subscribe to that topic (https://ably.com/topic/event-streaming).  

As events are published to the topic, the broker identifies the subscribers for the topic and makes the events available to them. Publishers and subscribers need not know about each other (https://ably.com/topic/event-streaming).

#### What is Event Stream Processing?

**Event stream processing** (ESP) is the practice of taking action on a series of data points that originate from a system that continuously creates data. The term “event” refers to each data point in the system, and “stream” refers to the ongoing delivery of those events. A series of events can also be referred to as “streaming data” or “data streams.” Actions that are taken on those events include aggregations (e.g., calculations such as sum, mean, standard deviation), analytics (e.g., predicting a future event based on patterns in the data), transformations (e.g., changing a number into a date format), enrichment (e.g., combining the data point with other data sources to create more context and meaning), and ingestion (e.g., inserting the data into a database) (https://hazelcast.com/glossary/event-stream-processing/).

#### What Problem is Event Streaming Attempting to Solve?

One of the inherent challenges with [microservices](https://tanzu.vmware.com/microservices) is the coupling that can occur between the services. In a conventional ask, don’t tell architecture, data is gathered on demand. Service A asks Services B, C, and D, “What’s your current state?” This assumes B, C, and D are always available to respond. However, if they moved or they’re offline, they can’t respond to Service A’s query (https://tanzu.vmware.com/event-streaming).

To compensate, [microservice architectures](https://tanzu.vmware.com/developer/guides/what-is-microservices-architecture/) tend to include workarounds (such as retries) to deal with any ill effects caused by changes in deployment topology or network outages. This adds an extra layer of complexity and cost (https://tanzu.vmware.com/event-streaming).

Event streaming attempts to solve this problem by inverting the communication process among services. An event-driven architecture utilizes a *tell*, don’t ask approach, in which Services B, C, and D *publish* continuous streams of data as events. Service A subscribes to these event streams—processing the facts, collating the results, and caching them locally. However, Service A only needs to act, or perform its function, when it is delivered a specific type of event (https://tanzu.vmware.com/event-streaming).

Using event streams in this way can deliver a number of benefits, including:

| ◼    |      | Systems that more closely mimic real-world processes, because software teams have carefully considered the optimal flow. |
| ---- | ---- | ------------------------------------------------------------ |
| ◼    |      | Increased utilization of scale-to-zero functions (or [serverless](https://tanzu.vmware.com/serverless) computing), because more services can remain idle until they’re needed. |
| ◼    |      | Improved flexibility, because new requirements or features can be captured in loosely coupled microservices instead of rewriting the business logic of a large monolith. |

(https://tanzu.vmware.com/event-streaming).

#### Event Stream Processing vs. Batch Processing

Event stream processing is often viewed as complementary to [batch processing](https://hazelcast.com/glossary/micro-batch-processing/). Batch processing is about taking action on a large set of static data (“data at rest”), while event stream processing is about taking action on a constant flow of data (“data in motion”). Event stream processing is necessary for situations where action needs to be taken as soon as possible. This is why event stream processing environments are often described as “real-time processing“ (https://hazelcast.com/glossary/event-stream-processing/).

#### Use Cases for Event Stream Processing

Use cases such as [payment processing](https://hazelcast.com/use-cases/payment-processing/), [fraud detection](https://hazelcast.com/use-cases/fraud-detection/), anomaly detection, predictive maintenance, and [IoT analytics](https://hazelcast.com/use-cases/internet-of-things/) all rely on immediate action on data. All of these use cases deal with data points in a continuous stream, each associated with a specific point in time. These are classic event stream processing examples because the order and timing of the data points help with identifying patterns and trends that represent an important insight for users (https://hazelcast.com/glossary/event-stream-processing/).

Event stream processing is also valuable when data granularity is critical. For example, the actual changes to a stock price are often more important to a trader than the stock price itself, and event stream processing lets you track all the changes along the way to make better trading decisions. The practice of change data capture (CDC), in which all individual changes to a database are tracked, is another event stream processing use case. In CDC, downstream systems can use the stream of individual updates to a database for purposes such as identifying usage patterns that can help define optimization strategies, as well as tracking changes for auditing requirements (https://hazelcast.com/glossary/event-stream-processing/).