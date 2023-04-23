## SigNoz

SigNoz describes itself as both an open-source **application performance monitoring (APM)** tool and an open-source **observability** platform. 

As an APM tool, [SigNoz is designed](https://signoz.io/docs/) to help you monitor your applications and troubleshoot problems. It uses distributed tracing to gain visibility into your software stack. But SigNoz also says that it is more than an APM. This is where observability comes in.

Many modern application architectures are too complex to monitor and manage with just APM. You need to consider multiple data sources and various telemetry data types (not just metrics). You also need to think about logging. Each run time is likely emitting logs in different places, and you need a way to consolidate that data and evaluate it in the context of your application. And, as you add more services and microservices components to your architecture, when a user accesses one of these services and gets an error, you need to be able to trace that request across multiple services (https://newrelic.com/blog/best-practices/apm-vs-observability).

Observability is the ability to measure the internal states of a system by examining its outputs. A system is considered “observable” if the current state can be estimated by only using information from outputs (https://www.splunk.com/en_us/data-insider/what-is-observability.html).

Observability is the ability to understand a system’s internal state by analyzing the data it generates, such as logs, metrics, and traces—the three pillars of observability. It helps teams analyze what is happening in context across different environments so you can detect and resolve the underlying causes of issues (https://signoz.io/blog/observability-vs-monitoring/).

Observability also gives you the power to understand patterns and connections in your data that you hadn’t previously considered (https://newrelic.com/blog/best-practices/apm-vs-observability).

You can think of it this way: Observability (a noun) is the approach to how well you can understand your complex system. Application performance monitoring (a verb) is an action you take to help in that approach. Observability doesn't eliminate the need for APM. APM just becomes one of the techniques used to achieve observability (https://newrelic.com/blog/best-practices/apm-vs-observability).

As an observability platform, SigNoz enables the generation, collection, and aggregation of **logs**, **metrics**, and **traces** under a single dashboard and stored in a single database (https://signoz.io/blog/open-source-observability/).

![Observability net](https://d33wubrfki0l68.cloudfront.net/cda031488c05ef4d485de8d1c4ff65b888bd1f0d/d3e6f/img/blog/2022/07/o11y-net-trans.png)

#### Who is SigNoz For?

A [2020 survey](https://newrelic.com/resources/ebooks/more-perfect-software-gated) by Longitude Research found that 94% of software leaders believe observability is key to developing software (https://newrelic.com/resources/white-papers/observability-as-a-priority). 

Applications built on dynamic and distributed infrastructure are challenging to operate and maintain. A robust observability framework can help application owners stay on top of their software systems (https://signoz.io/blog/open-source-observability/).

SigNoz is designed to provide a way to correlate observability data for applications running across distributed systems or that use a microservice architecture.

Mobile apps, websites, and business applications are typical use cases for monitoring (https://www.dynatrace.com/news/blog/what-is-apm-2/).

---

#### SigNoz Architecture

![acrhitecture-diagram-clickhouse](https://d33wubrfki0l68.cloudfront.net/cd378d3ac834977c24b2a1942da8fabd0608d32b/a6ccb/assets/images/architecture-signoz-clickhouse-0f1ac4045a71b0b44ddbb9d36de8e069.svg)

#### SigNoz OpenTelemetry Collector

**OpenTelemetry Collector** can receive data in multiple formats. Here are some of the commonly used receivers:

- Jaeger Receiver
- Kafka Receiver
- OpenCensus Receiver
- OTLP Receiver
- Zipkin Receiver

One can send data from their applications directly to SigNoz Otel collector or external otel collectors can be used for collecting telemetry data & sending to SigNoz otel collector. These external otel collectors are then working effectively as an agent to collect data first and then send to SigNoz Otel collector (https://signoz.io/docs/architecture/).

##### How it Works

The first step in setting up observability with **OpenTelemetry** is **instrumentation**. The application code is instrumented with OpenTelemetry client libraries that help generate **telemetry** data like logs, metrics, and traces.

Once the telemetry data is generated, it can be exported directly to an observability backend or an OpenTelemetry Collector. The collector provides a vendor-neutral way to collect, process, and export your telemetry data(logs, metrics, and traces).  

OpenTelemetry collectors can be deployed in different ways. It can be deployed on each host machine as an agent. When the collector is deployed on host machines, you can directly collect host metrics like CPU usage, RAM, disk I/O metrics, etc.  

You can also run your OpenTelemetry Collector as a stand-alone service. The client libraries of OpenTelemetry have an exporter that can be configured to send the telemetry data to the collector. Usually, a mixed pattern of OpenTelemetry Collectors is recommended to handle scale.

![OpenTelemetry Architecture](https://d33wubrfki0l68.cloudfront.net/e1eccdb571333a1757187a406275c3edb3557e30/43c19/img/blog/2022/09/opentelemetry_architecture.webp)

 (https://signoz.io/blog/opentelemetry-collector-complete-guide/).

An OpenTelemetry collector has three main functions - collect, process, and export the telemetry data collected. Let us first understand why it is a critical component of your observability architecture.  

OpenTelemetry collector consists of three main components: Receivers, processors, and exporters.  

![Architecture of OpenTelemetry Collector](https://d33wubrfki0l68.cloudfront.net/8efb2c17d6627136d68b54552b89c42e28c3b259/4f5bb/img/blog/2022/09/collector_pipeline.webp)

(https://signoz.io/blog/opentelemetry-collector-complete-guide/).

##### Receivers

Receivers are used to get data into the collector. Currently, the collector supports over forty different types of receivers. You can use the receivers to configure ports and formats the collector can take data in. It could be push or pull-based.

You can receive data in multiple formats. It has a default OTLP format, but you can receive data in other popular open-source formats like Jaeger or Prometheus (https://signoz.io/blog/opentelemetry-collector-complete-guide/).

##### Processors

Processors are used to do any processing required on the collected data, like data massaging, data manipulation, or any change in the data as it flows through the collector. It can also be used to remove personally identifiable information (PII) data from the collected telemetry data, which can be very useful.

You can also do things like batching the data before sending it out, retrying in case the exporting fails, adding metadata, tail-based sampling, etc. (https://signoz.io/blog/opentelemetry-collector-complete-guide/).

##### Exporters

Exporters are used to export data to an observability backend like [SigNoz](https://signoz.io/?utm_source=blog&utm_medium=opentelemetry_colllector). You can send out data in multiple data formats. You can send different telemetry signals to different backend analysis tools. For example, you can send traces to Jaeger and metrics to Prometheus.

With the combination of these three components, OpenTelemetry Collector can be used to build data pipelines. Pipelines are configured via a YAML configuration file easily. This provides flexibility to teams managing their telemetry data (https://signoz.io/blog/opentelemetry-collector-complete-guide/).

#### ClickHouse

SigNoz uses a columnar database - ClickHouse (https://signoz.io/blog/logging-as-a-service/). We have chosen columnar databases as our main workhorse as we think observability is fundamentally an analytics and correlation problem. The main need is to find the source of the problem fast. And for this, writing queries on aggregates is very important. You should be able to drill down from a top-level view to a specific question quickly (https://signoz.io/blog/observability-net/).  

Recently, Uber also moved from [Elastic to ClickHouse](https://eng.uber.com/logging/) as their database for their logs infra because they found that 60-70% of their logs queries were aggregation queries and columnar databases are designed for such queries and perform much faster (https://signoz.io/blog/observability-net/). Big companies like [Uber](https://www.uber.com/en-IN/blog/logging/) and [Cloudflare](https://blog.cloudflare.com/log-analytics-using-clickhouse/) have shifted from Elasticsearch to ClickHouse for storing their log data (https://signoz.io/blog/logging-as-a-service/).

(Article from honeycomb on why a column data store is well suited for observability: https://www.honeycomb.io/blog/why-observability-requires-distributed-column-store).

Elasticsearch vs. ClickHouse???

#### Query Service

**Query Service** is the interface between Frontend and ClickHouse. It provides APIs to be consumed by frontend application and queries ClickHouse to fetch data and processes data before responding back to the frontend (https://signoz.io/docs/architecture/).

#### Frontend

**Frontend** is the UI, built in ReactJS and Typescript and provides advanced trace/span filtering capabilities and plot metrics to provide service overviews (https://signoz.io/docs/architecture/).

#### Alert Manager

**Alert Manager** evaluates different alert rules set by the users and triggers an alert if a threshold is crossed (https://signoz.io/docs/architecture/).



---

#### Key Terms

##### application performance monitoring (APM)

Application performance monitoring refers to the collection of tools and processes designed to help IT professionals ensure that enterprise applications meet the performance, reliability and valuable user experience (UX) required by employees, partners, and customers (https://www.techtarget.com/searchenterprisedesktop/definition/Application-monitoring-app-monitoring). 

IT teams typically adopt APM as a best practice to understand and improve system performance, by helping them identify when an application is slow or broken and then fix issues before they affect users. Through pre-configured alerts and visualizations, APM helps teams understand metrics like **response time**, **throughput**, and errors (https://newrelic.com/blog/best-practices/apm-vs-observability).

APM is one of the steps in a well-rounded **observability** practice that uses dashboards and alerts for known or expected failures (https://newrelic.com/blog/best-practices/apm-vs-observability). APM is a subset of observability that focuses on measuring the performance of an application.

In [application performance monitoring](https://www.ibm.com/products/instana), agents are deployed throughout the application environment and supporting infrastructure, to 'monitor' performance by sampling performance and performance-related metrics (sometimes called telemetry) usually as frequently as once every minute. Types of monitoring these agents perform include:

- **Digital experience monitoring** gathers performance metrics - such as load time, response time, uptime, downtime - from the user interface on the end-user device. (This used to be be called end-user experience monitoring, but was broadened to acknowledge that non-human entities, such as robots or other software components, also interact with the application and have performance expectations of their own). Digital experience monitoring usually supports real-user monitoring, which which monitors the experience of an actual user on the system, and synthetic monitoring, for performance testing in production and non-production environments.

  

- **Application monitoring** includes monitoring of the entire application stack - application framework (e.g., Java or .NET), operating system, database, APIs, middleware, web application server, UI - as well as IT infrastructure monitoring that samples factors such as CPU utilization, disk space, and network performance. Stack monitoring typically includes code-level tracing, which can help spot portions of code that might be causing a performance bottleneck.

  

- **Database monitoring** samples performance of SQL queries or procedures, in addition to the datase monitoring provided by application monitoring agents.

  

- **Availability monitoring** monitors the actual availability of application and hardware components (because applications can generate performance data even when they aren't accessible to the end user).

In addition to collecting performance data, these agents perform user-defined transaction profiling, tracing each transaction from the end-user UI or device through every application component or resource involved in the transaction. This information is used to determine application dependencies, and to create a topology map - a visualization of the dependencies between application and infrastructure components, ideally across on-premises, private cloud, public cloud (including any software-as-a-service or SaaS solutions) and or hybrid cloud environments. 

APM solutions typically provide a controller and centralized dashboard where the collected performance metrics are aggregated, analyzed and compared to established baselines. The dashboard alerts system administrators to deviations from baselines that indicate actual or potential performance issues; it also provides contextual information and actionable insights administrators can use to troubleshoot and resolve the issues (https://www.ibm.com/topics/application-performance-management).

##### instrumentation

Instrumentation refers to the measure of a product's performance, in order to diagnose errors and to write [trace](https://en.wikipedia.org/wiki/Tracing_(software)) information (https://en.wikipedia.org/wiki/Instrumentation_(computer_programming)).  

[Instrumentation](https://newrelic.com/blog/best-practices/observability-instrumentation) is the process of adding code to your application so you can understand its inner state. Instrumented applications measure what code is doing when it responds to active requests by collecting data such as metrics, events, logs, and traces ([MELT](https://newrelic.com/platform/telemetry-data-101)). In contrast to an application that isn’t instrumented and only uses point-in-time logs, an instrumented application tracks as much information as possible about the service’s operations and behavior. It provides more detail about what is happening, so you can see relationships between requests (https://newrelic.com/blog/best-practices/logging-vs-instrumentation). 

##### logs

A log, in a computing context, is *the automatically produced and time-stamped documentation of events relevant to a particular system* (https://www.techtarget.com/whatis/definition/log-log-file).  

Log files are the primary data source for network [observability](https://www.sumologic.com/glossary/observability/). A log file is a computer-generated data file that contains information about usage patterns, activities, and operations within an operating system, application, server or another device. Log files show whether resources are performing properly and optimally (https://www.sumologic.com/glossary/log-file/).  

Logs are structured and unstructured lines of text a system produces when certain codes run. In general, you can think of a log as a record of an event that happened within an application. Logs help uncover unpredictable and emergent behaviors exhibited by components of microservices architecture.

They’re easy to generate and instrument. And most application frameworks, libraries, and languages come with support for logging. Virtually every component of a distributed system generates logs of actions and events at any point.

Log files provide comprehensive system details, such as a fault, and the specific time when the fault occurred. By analyzing the logs, you can troubleshoot your code and identify where and why the error occurred. Logs are also useful for troubleshooting security incidents in load balancers, caches, and databases (https://iamondemand.com/blog/the-3-pillars-of-system-observability-logs-metrics-and-tracing/).

##### metrics

Metrics are a numerical representation of data that can be used to determine a service or component’s overall behavior over time. Metrics comprise a set of attributes (e.g., name, value, label, and timestamp).  

Unlike an event log, which records specific events, metrics are a measured value derived from system performance. Metrics are real time-savers because you can easily correlate them across infrastructure components to get a holistic view of system health and performance. They also enable easier querying and longer retention of data.

You can gather metrics on system uptime, response time, the number of requests per second, and how much processing power or memory an application is using, for example. Typically, SREs and ops engineers use metrics to trigger alerts whenever a system value goes above a specified threshold.  

For example, let’s say you want to monitor the requests per second in an HTTP service. You notice an abrupt spike in traffic, and you want to know what’s happening in your system. Metrics provide deeper visibility and insight that help you understand the cause of the spike. The spike could be due to an incorrect service configuration, malicious behavior, or issues with other parts of your system. In addition to providing visibility, you can also use the information to detect and determine the severity of issues (https://iamondemand.com/blog/the-3-pillars-of-system-observability-logs-metrics-and-tracing/).

##### observability

Observability is a holistic, dynamic practice to help you understand your complex systems and discover answers to possible issues you haven’t even thought of. Observability involves collecting data across multiple layers of software architecture, analyzing it in real-time, and asking questions about that data, tailored to specific signals—so you know what problems to focus on (https://newrelic.com/blog/best-practices/apm-vs-observability).  

Observability is the ability to measure the internal states of a system by examining its outputs. A system is considered “observable” if the current state can be estimated by only using information from outputs, namely sensor data (https://www.splunk.com/en_us/data-insider/what-is-observability.html).

Observability is the ability to understand a system’s internal state by analyzing the data it generates, such as logs, metrics, and traces—the three pillars of observability. It helps teams analyze what is happening in context across multi-cloud environments so you can detect and resolve the underlying causes of issues (https://signoz.io/blog/observability-vs-monitoring/).

[Observability](https://newrelic.com/blog/best-practices/what-is-observability) is about getting deep, technical insights into the state of your entire system, no matter how large or complex it is. It helps DevOps teams navigate the challenges of increased fragmentation in today’s distributed systems. Observability also gives you the power to understand patterns and connections in your data that you hadn’t previously considered (https://newrelic.com/blog/best-practices/apm-vs-observability).

You can think of it this way: Observability (a noun) is the approach to how well you can understand your complex system. Application performance monitoring (a verb) is an action you take to help in that approach. Observability doesn't eliminate the need for APM. APM just becomes one of the techniques used to achieve observability (https://newrelic.com/blog/best-practices/apm-vs-observability).

##### OpenTelemetry

[OpenTelemetry](https://opentelemetry.io/) is an open-source observability framework that aims to standardize the generation, collection, and management of telemetry data(Logs, metrics, and traces). It is incubated under Cloud Native Computing Foundation([Cloud Native Computing Foundation](https://www.cncf.io/)), the same foundation which incubated Kubernetes.

OpenTelemetry follows a [specification-driven](https://opentelemetry.io/docs/reference/specification/) development and provides client libraries to instrument applications in most programming languages. Once you have instrumented with OpenTelemetry, you should be able to collect various telemetry signals like logs, metrics, and traces from it (https://signoz.io/blog/opentelemetry-collector-complete-guide/).

##### response time

Response time refers to the amount of time it takes for a server to respond to a client’s request. Measured in milliseconds, the timer starts from the moment a client sends out a request and stops when the server sends back its first response (https://sematext.com/glossary/response-time/).

##### telemetry

Telemetry is the [in situ](https://en.wikipedia.org/wiki/In_situ) [collection of measurements](https://en.wikipedia.org/wiki/Data_collection) or other data at remote points and their automatic [transmission](https://en.wikipedia.org/wiki/Data_transmission) to receiving equipment ([telecommunication](https://en.wikipedia.org/wiki/Telecommunication)) for monitoring (https://en.wikipedia.org/wiki/Telemetry).  

Telemetry automatically collects, transmits and measures data from remote sources, using sensors and other devices to collect data. It uses communication systems to transmit the data back to a central location. Subsequently, the data is analyzed to monitor and control the remote system (https://www.sumologic.com/glossary/telemetry/).

##### throughput

Throughput is *a measure of how many units of information a system can process in a given amount of time*.

##### trace

Although logs and metrics might be adequate for understanding individual system behavior and performance, they rarely provide helpful information for understanding the lifetime of a request in a distributed system. To view and understand the entire lifecycle of a request or action across several systems, you need another observability technique called tracing.

A trace represents the entire journey of a request or action as it moves through all the nodes of a distributed system. Traces allow you to profile and observe systems, especially containerized applications, serverless architectures, or microservices architecture. By analyzing trace data, you and your team can measure overall system health, pinpoint bottlenecks, identify and resolve issues faster, and prioritize high-value areas for optimization and improvements.

[Traces are an essential pillar of observability](https://iamondemand.com/blog/open-source-distributed-tracing-why-you-need-it-how-to-get-started/) because they provide context for the other components of observability. For instance, you can analyze a trace to identify the most valuable metrics based on what you’re trying to accomplish, or the logs relevant to the issue you’re trying to troubleshoot (https://iamondemand.com/blog/the-3-pillars-of-system-observability-logs-metrics-and-tracing/).

---

### Why SigNoz?

Pranay and Ankit here. We’re founders of SigNoz ( [https://signoz.io](https://signoz.io/) ), an open source observability platform. We are building an open-core alternative to DataDog for companies that are security and privacy conscious, and are concerned about huge bills they need to pay to SaaS observability vendors (https://news.ycombinator.com/item?id=26079389).

* alternative to DataDog
* for companies that are security and privacy conscious as well as cost conscious.

The journey of SigNoz started with our own pain point. I was working in a startup in India. We didn’t use application monitoring (APM) tools like DataDog/NewRelic as it was very costly, though we badly needed it. We had many customers complaining about broken APIs or a payment not processing - and we had to get into war room mode to solve it. Having a good observability system would have allowed us to solve these issues much more quickly.

* needed an APM tool like DataDog/NewRelic, but those tools were very costly
* having a good observability system would have helped them solve issues more quickly

In our initial exploration, we tried setting up RED (Rate, Error and Duration) and infra metrics using Prometheus. But we soon realized that metrics can only give you an aggregate overview of systems. You need to debug why these metrics went haywire. This led us to explore Jaeger, an open source distributed tracing system.

* tried setting up RED (Rate, Error and Duration) and infra metrics using Prometheus.
* However, soon realized metrics only give you an aggregate overview of systems.
* You need to debug why the metrics went haywire.
* Hence, they explored Jaegar, an open source distributed tracing system.

Key issues with Jaeger were that there was no concept of metrics in Jaegers, and datastores supported by Jaeger lacked aggregation capabilities. For example, if you had tags of “customer_type: premium” for your premium customers, you couldn’t find p99 latency experienced by them through Jaeger.

* but no concept of metrics in Jaeger and datastores supported by Jaeger lacked aggregation capabilities.

We found that though there are many backend products - an open source product with UI custom-built for observability, which integrates metrics & traces, was missing.

* realized there was no open source product with UI custom-built for observability, and which integrates metrics & traces.

Also, some folks we talked to expressed concern about sending data outside of boundaries - and we felt that with increasing privacy regulations, this would become more critical. We thought there was scope for an open source solution that addresses these points.

* some people expressed concer about sending data outside boundaries.
* So we felt privacy could be addressed through an open source solution.

We chose Kafka and Druid because: 1. Any company which reaches a decent scale invariably uses some form of Kafka. And it is a trusted system which scales upto huge scale. 2. Community adoption and support. When choosing datastore, we also evaluated Apache Pinot & Clickhouse, but Druid seemed to have the best community. Also, it was proven to use at scale in places like Lyft

I agree though that these are not simple systems, and may be too much for smaller orgs. We are also evaluating supporting simpler datastores, but that would depend on what the community demands. Our architecture is modular so we are not strictly tied to druid and we can support other datastores if there is interest.

| what about an ELK stack?                                     |
| ------------------------------------------------------------ |
| ![img](https://news.ycombinator.com/s.gif)[ankitnayan](https://news.ycombinator.com/user?id=ankitnayan) [on Feb 9, 2021](https://news.ycombinator.com/item?id=26080309) \| [parent](https://news.ycombinator.com/item?id=26079389#26080108) \| [next](https://news.ycombinator.com/item?id=26079389#26082919) [[–\]](javascript:void(0)) Hey, I am one of the maintainers of SigNoz. ELK is tightly coupled to **Elastic which may not be the ideal database to handle opentelemetry data.** We wanted to be more of a platform where we can provide different DBs as plugins. Users can also build their own usecases by building more stream processing applications. |

---

### Cons of the ELK Stack

Furthermore, you might be in trouble if you set up your infrastructure correctly in the steps above. Logstash and Elasticsearch are memory intensive. If you tried to save time and money by installing them on the same tiny piece of hardware, they’ll step all over each other. And we haven’t even talked yet about a plan for updating versions or monitoring and patching security issues! (https://aws.amazon.com/opensearch-service/resources/the-benefits-of-the-elk-stack/).

### Alternatives to the ELK Stack

#### Logtail

[Logtail](https://betterstack.com/logtail) offers a much more resource efficient and thus cheaper and faster alternative to the ELK stack, thanks to custom-built technology and [**ClickHouse**](https://clickhouse.com/) powered storage. Logtail allows you to collect logs across your stack, leverage the collected data as much as possible and therefore, spend less time debugging and troubleshooting.

Using its Built-in Google Docs-like capabilities. You can archive important log fragments, comment, and share logs with your co-workers. You can also benefit from Logtail’s presence and absence notifications which help you spot any issues before they become severe. Logtail offers SQL-compatible queries and allows you to query your logs efficiently, or connect them to your BI tool directly for custom reports.

Logtail also offers a live log tail, allowing you to look up logs in the real-time, scroll, and analyze data with a single click using its well-designed and purpose-driven, dark mode UI. All of the data visualizations are handled by Grafana, which allows you to create custom and specific Charts and Dashboards.

Logtail can manage logs from any platform and deployment is a matter of minutes (https://betterstack.com/community/comparisons/elk-stack-alternatives/).

User experience compared to ELK and DataDog from Hacker News:

We tried Logtail in early beta and the experience was mind bending.

We used both ELK and Datadog before and over time I somehow stopped questioning why the logs are so slow. I thought we are simply hitting the theoretical limits of how fast searching in logs can be and unless there is a significant leap in hardware this is what we have to deal with. Then we tried Logtail and now we are migrating everything we can (https://news.ycombinator.com/item?id=28628515).

#### Loggly

Loggly is a log management and aggregation tool from SolarWinds. It is currently one of the most commonly used solutions on the market. Loggly is an agentless log analyzer gathering data directly from application servers. Using a token, or the standard Syslog with HTTP(s), Loggly can retrieve data from pre-existing software.

It can work with txt based logs from any source and support multiple languages and platforms. We can find support for Ruby, Java, Python JavaScript, PHP, Apache HTTP Server, Tomcat, MySQL, Syslog-ng, rsyslog, and many more. Loggly's primary focus is on solving and fixing operational problems. Customizable dashboards, documentation, and a vast array of useful tools make Loggly a powerful log analyzing tool (https://betterstack.com/community/comparisons/elk-stack-alternatives/).

#### Graylog

Graylog operates under multiple models. You can choose from either Graylog open - their open-source solution, Graylog Small Business, or Enterprise. The last option is Graylog cloud, offering the same experience as Graylog Enterprise, however, hosted on the cloud, saving you the funds needed for your own infrastructure.

Graylog gets the job done when parsing logs from any data source, data visualization, or analysis. It is based on Elasticsearch and MongoDB. The Dashboard comprises widgets, each providing you with different information coming from different datatypes. You can see counts, charts, graphs, views, and more.

Thanks to Graylog's multiple deployment options, you can run and manage it on your own, or have it hosted, which gives you more flexibility and control. The UI is definitely much better looking. However, Graylog's websites are not definitely a designer's paradise (https://betterstack.com/community/comparisons/elk-stack-alternatives/).

---

### Clickhouse

#### Who's using it?

Clickhouse has been used at companies like [Uber](https://eng.uber.com/logging/), Comcast, eBay, and Cisco for years, mostly for log analytics. We’re now seeing startups (e.g. [Tinybird](https://www.tinybird.co/), [Posthog](https://posthog.com/docs/self-host/runbook/clickhouse), [Logtail](https://betterstack.com/logtail)) adopting Clickhouse in their product because it’s open source, has amazing performance, and doesn’t tie you to an insanely expensive cloud service (looking at you BigQuery). Due to the ubiquity of SQL, it’s also easier to find developers to work on the product and integrate it with other tools (e.g. [Metabase](https://www.metabase.com/data_sources/click-house)). We choose Clickhouse at [Luabase](https://luabase.com/) for these same reasons and think it’ll become the de facto choice when you need an open source, blazing fast database (https://blog.luabase.com/clickhouse-for-data-nerds/).

#### Use Cases

The most important thing when using ClickHouse is to be clear that the scenarios in which you want to use it really are the right ones. Many users think that when a database is very fast for a specific use case, it can be extrapolated to other contexts (most of the time different) in which a previous analysis has not been carried out.

ClickHouse is an analytical database, as such, it should be used for such purposes, where the information is stored correctly, the data volumes are really large and the queries to be performed are not the typical traditional queries on several columns with multiple aggregations. ClickHouse is not the solution for this.

On the other hand, if your case is not one of the above, it is quite possible that ClickHouse can help you. Where ClickHouse shines is when you are looking for aggregation over a particular column in large volumes of data (https://www.trustradius.com/compare-products/clickhouse-vs-elasticsearch#user-ratings).

---

Yes, there are several solutions that provide both rehydration of logs and tracing capabilities, which can help you gain better visibility and insights into your applications and infrastructure. Some popular solutions that offer both tracing and log management capabilities are:

    Datadog: Datadog is a cloud-based monitoring and analytics platform that offers both tracing and logging capabilities. The platform provides real-time monitoring and tracing of distributed systems, as well as log processing and analysis to help you identify and resolve issues quickly.
    
    Elastic APM: Elastic APM is an application performance monitoring solution that offers distributed tracing, error tracking, and log analysis in a single platform. It integrates with the ELK stack, allowing you to correlate traces and logs to get a complete picture of your application's performance.
    
    Lightstep: Lightstep is a cloud-based observability platform that provides distributed tracing and log analysis capabilities. It offers real-time tracing of requests across microservices, as well as log processing and analysis to help you identify issues quickly.
    
    AWS X-Ray: AWS X-Ray is a service provided by Amazon Web Services (AWS) that offers distributed tracing and debugging of applications running on the AWS infrastructure. It provides a complete view of your application's performance, including tracing, logging, and metrics.
    
    Honeycomb: Honeycomb is a distributed tracing and observability platform that offers log management and analysis capabilities as well. It provides real-time tracing of requests across services, as well as log analysis to help you troubleshoot issues quickly.