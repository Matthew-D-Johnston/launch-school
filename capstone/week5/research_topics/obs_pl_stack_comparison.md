## Observability Pipeline Stack Comparison

### Introduction

Observability is a huge topic in cloud-native environments. One must collect, understand, and investigate millions of logs from different sources to understand what’s happening at an application’s runtime. Log stacks address all those concerns and are typically composed of multiple applications with dedicated responsibilities (https://www.thorsten-hans.com/logging-in-kubernetes-with-loki-and-plg-stack/). 

Three log stacks include ELK, EFK, and PLG.

---

### ELK Stack

The ELK stack is an acronym used to describe a stack that comprises of three popular projects: Elasticsearch, Logstash, and Kibana. Often referred to as Elasticsearch, the ELK stack gives you the ability to aggregate logs from all your systems and applications, analyze these logs, and create visualizations for application and infrastructure monitoring, faster troubleshooting, security analytics, and more (https://aws.amazon.com/what-is/elk-stack/).

#### **E = Elasticsearch**

Elasticsearch is a distributed search and analytics engine built on Apache Lucene. Support for various languages, high performance, and schema-free JSON documents makes Elasticsearch an ideal choice for various log analytics and search use cases. [Learn more »](https://aws.amazon.com/what-is/elasticsearch/)

On January 21, 2021, Elastic NV announced that they would change their software licensing strategy and not release new versions of Elasticsearch and Kibana under the permissive Apache License, Version 2.0 (ALv2) license. Instead, new versions of the software will be offered under the Elastic license, with source code available under the Elastic License or SSPL. These licenses are not open source and do not offer users the same freedoms. For a secure, high-quality, fully open source search and analytics suite, you can use the [OpenSearch](https://opensearch.org/) project, a community-driven, ALv2 licensed fork of open source Elasticsearch and Kibana (https://aws.amazon.com/what-is/elk-stack/).

#### **L = Logstash**

Logstash is an open-source data ingestion tool that allows you to collect data from a variety of sources, transform it, and send it to your desired destination. With pre-built filters and support for over 200 plugins, Logstash allows users to easily ingest data regardless of the data source or type. 

Logstash is a light-weight, open-source, server-side data processing pipeline that allows you to collect data from a variety of sources, transform it on the fly, and send it to your desired destination. It is most often used as a data pipeline for Elasticsearch, an open-source analytics and search engine. Because of its tight integration with Elasticsearch, powerful log processing capabilities, and over 200 pre-built open-source plugins that can help you easily index your data, Logstash is a popular choice for loading data into Elasticsearch (https://aws.amazon.com/what-is/elk-stack/).

##### Easily load unstructured data

Logstash allows you to easily ingest unstructured data from a variety of data sources including system logs, website logs, and application server logs. 

##### Pre-built filters

Logstash offers pre-built filters, so you can readily transform common data types, index them in Elasticsearch, and start querying without having to build custom data transformation pipelines.

##### Flexible plugin architecture

With over 200 plugins already available on Github, it is likely that someone has already built the plugin you need to customize your data pipeline. But if none is available that suits your requirements, you can easily create one yourself (https://aws.amazon.com/what-is/elk-stack/).

#### **K = Kibana**

Kibana is a data visualization and exploration tool used for log and time-series analytics, application monitoring, and operational intelligence use cases. It offers powerful and easy-to-use features such as histograms, line graphs, pie charts, heat maps, and built-in geospatial support. Also, it provides tight integration with Elasticsearch, a popular analytics and search engine, which makes Kibana the default choice for visualizing data stored in Elasticsearch.

On January 21, 2021, Elastic NV announced that they would change their software licensing strategy and not release new versions of Elasticsearch and Kibana under the permissive Apache License, Version 2.0 (ALv2) license. Instead, new versions of the software will be offered under the Elastic license, with source code available under the Elastic License or SSPL. These licenses are not open source and do not offer users the same freedoms. To ensure that the open source community and our customers continue to have a secure, high-quality, fully open source search and analytics suite, we introduced the [OpenSearch](https://web.archive.org/web/20221006230230/https://opensearch.org/) project, a community-driven, ALv2 licensed fork of open source Elasticsearch and Kibana. The OpenSearch suite consists of a search engine, OpenSearch, and a visualization and user interface, OpenSearch Dashboards.

You can run Apache 2.0 licensed Kibana versions (up until version 7.10.2) on-premises, on Amazon EC2, or on Amazon OpenSearch Service. OpenSearch Dashboards is an open source alternative to Kibana, which is also available to self-manage. It was derived from the last open source version of Kibana (7.10.2) and contains many advancements and is well supported via the OpenSearch Project. With on-premises or Amazon EC2 deployments, you are responsible for provisioning the infrastructure, installing Kibana or OpenSearch Dashboards software, and managing the infrastructure. With Amazon OpenSearch Service, Kibana or OpenSearch Dashboards are deployed automatically with your domain as a fully managed service, automatically taking care of all the heavy-lifting to manage the cluster (https://aws.amazon.com/what-is/elk-stack/).

##### Interactive charts

Kibana offers intuitive charts and reports that you can use to interactively navigate through large amounts of log data. You can dynamically drag time windows, zoom in and out of specific data subsets, and drill down on reports to extract actionable insights from your data.

##### Mapping support

Kibana comes with powerful geospatial capabilities so you can seamlessly layer in geographical information on top of your data and visualize results on maps.

##### Pre-built aggregations and filters

Using Kibana’s pre-built aggregations and filters, you can run a variety of analytics like histograms, top-N queries, and trends with just a few clicks.

##### Easily accessible dashboards

You can easily set up dashboards and reports and share them with others. All you need is a browser to view and explore the data (https://aws.amazon.com/what-is/elk-stack/).

#### How does the ELK stack work?

1. Logstash ingests, transforms and sends the data to the right destination.
2. Elasticsearch indexes, analyzes, and searches the ingested data.
3. Kibana visualizes the results of the analysis.



---

### EFK Stack

The EFK stack is almost identical to the ELK stack, except that Logstash is replaced by Fluentd.  

#### Logstash vs Fluentd

Fluentd was built on the idea of logging in JSON wherever possible (which is a practice we totally agree with!) so that log shippers down the line don’t have to guess which substring is which field of which type.

As a result, there are [logging libraries](https://sematext.com/blog/logging-libraries-vs-log-shippers/#toc-logging-libraries-0) for virtually every language, meaning you can easily plug in your custom applications to your logging pipeline.

##### Fluentd Advantages

Like most Logstash plugins, Fluentd plugins are in Ruby and very easy to write. So there are lots of them, pretty much any source and destination has a plugin (with varying degrees of maturity, of course). This, coupled with the “fluent libraries” means you can easily hook almost anything to anything using Fluentd. Also, Fluentd is now a CNCF project, so the [Kubernetes integration](https://docs.fluentd.org/v/0.12/articles/kubernetes-fluentd) is very good.

##### Fluentd Disadvantages

Because in most cases you’ll get **structured data through Fluentd**, it’s not made to have the **flexibility of other shippers on this list** (Filebeat excluded). You can still parse unstructured via regular expressions and filter them using tags, for example, but you don’t get features such as local variables or full-blown conditionals.

Also, while performance is fine for most use-cases, it’s not in on the top of this list: buffers exist only for outputs (like in syslog-ng), single-threaded core and the Ruby GIL for plugins means ultimate performance on big boxes is limited, but resource consumption is acceptable for most use-cases.

**For small/embedded devices**, you might want to look at [Fluent Bit](https://fluentbit.io/), which is to Fluentd similar to how Filebeat is for Logstash. Except that Fluent Bit is single-threaded, so throughput will be limited.

##### Fluentd Typical use-cases

Fluentd is a good fit when you have diverse or exotic sources and destinations for your logs, because of the number of plugins.

Also, if most of the sources are custom applications, you may find it easier to work with fluent libraries than coupling a logging library with a log shipper. Especially if your applications are written in multiple languages – meaning you’d use multiple logging libraries, which may behave differently.

To summarize the differences between Logstash and Fluentd:

|                    | **Logstash**                          | **Fluentd**               |
| ------------------ | ------------------------------------- | ------------------------- |
| **Resource usage** | high                                  | low                       |
| **Variables**      | yes                                   | no                        |
| **Inputs**         | many                                  | many                      |
| **Outputs**        | many                                  | many                      |
| **Queue**          | memory, disk. For filters and outputs | Memory, disk. For outputs |
| **Libraries**      | nothing specific                      | many                      |

(https://sematext.com/blog/logstash-alternatives/#logstash-vs-fluentd).

---

### PLG Stack

The PLG stack is comprised of Promtail, Loki, and Grafana. Let's look at each in more detail below.

#### Promtail

[Promtail](https://grafana.com/docs/loki/latest/clients/promtail/) is responsible for data ingestion into Loki. It’s implemented as a `DaemonSet`, which means an instance of Promtail runs on every node of your Kubernetes cluster. The `DaemonSet` periodically reads logs from all containers (`stdout` and `stderr`) running on that particular Kubernetes node. On top of localizing and reading the log streams, Promtail can attach labels to logs before pushing them to Loki (https://www.thorsten-hans.com/logging-in-kubernetes-with-loki-and-plg-stack/).

#### Loki

[Loki](https://grafana.com/oss/loki/) is the heart of the PLG stack. It’s a data store optimized for logs. In contrast to other log aggregation systems, Loki does not index log messages itself. Instead, it indexes labels assigned with every log. We can query logs stored in Loki using [LogQL](https://grafana.com/docs/loki/latest/logql/), a query language inspired by PromQL. With LogQL, we can not just dive through millions of logs in seconds. We can also extract metrics from logs with ease (https://www.thorsten-hans.com/logging-in-kubernetes-with-loki-and-plg-stack/).  

One of the main differences to conventional logging systems is that Loki indexes just the metadata rather than the logs’ whole contents. Therefore, the index becomes smaller, which reduces memory consumption and ultimately lowers costs. One drawback of this design is that queries might be less performant than having everything indexed and loaded in memory (https://codersociety.com/blog/articles/loki-kubernetes-logging).

#### Grafana

[Grafana](https://grafana.com/oss/grafana/) is used to visualize logs stored in Loki. Loki integrates seamlessly with Grafana. We can build individual dashboards in Grafana based on application logs and metrics computed from those logs (https://www.thorsten-hans.com/logging-in-kubernetes-with-loki-and-plg-stack/).

#### Tradeoffs

* While one can use Kibana and Elasticsearch to make advanced data analysis and visualizations, the Loki-based logging stack focuses on being light-weight and easy to operate (https://codersociety.com/blog/articles/loki-kubernetes-logging).
* Loki: **Light-weight:** It only indexes metadata instead of the full log messages like EFK is doing. This results in less expensive RAM instances required for Loki deployments (https://codersociety.com/blog/articles/loki-kubernetes-logging).
* Loki: **Uses Object storage:** It uses object storage like Amazon S3 or GCS, which is usually cheaper than using block storage (https://codersociety.com/blog/articles/loki-kubernetes-logging).
* Loki: **Scales horizontally:** It can run as a single binary locally or for small scale operations and can easily be scaled horizontally for large scale operations (https://codersociety.com/blog/articles/loki-kubernetes-logging).



#### Loki vs. Elasticsearch

##### Storage

Log data is often huge, with every application, host machine, and infrastructure component generating its own set of log streams. And storage can quickly become costly. So it’s important to understand how Loki and Elasticsearch store log data.

Loki only indexes the metadata(labels) of logs. Once the indexing is done, the log data is compressed and stored in object stores like S3 and GCS. The compressed log data is called a chunk. Since only a set of labels is indexed for each log stream, the index created is small. Both index and chunks can be stored on the object store from Loki 2.0.

Elasticsearch indexes the full contents of stored documents. The data is stored on-disk as unstructured JSON objects. Elasticsearch makes documents fully searchable but at the cost of requiring more storage space (https://signoz.io/blog/loki-vs-elasticsearch/).

##### Indexing 

The biggest difference between Loki and Elasticsearch is how they index data. While Loki is designed to keep indexing low, Elasticsearch indexes all data in every field, and each indexed field has a dedicated, optimized data structure. Since indexes are low in Loki, it is more cost-effective and performant. But it loses the rich text search capabilities that Elasticsearch provides (https://signoz.io/blog/loki-vs-elasticsearch/).

##### Promtail vs. Logstash

Loki uses Promtail to discover log files. Promtail is specifically designed for Loki. It discovers log files stored on disk and forwards them to Loki. It primarily does three things: discovers targets, attaches labels to the log stream, and pushes them to the Loki instance.

Logstash is used to collect and forward logs to Elasticsearch. Logstash is a data processing engine. Logstash can send data to a number of destinations, not just Elasticsearch. It can collect data from different sources, process it, and ship it to a destination.

Logstash uses input plugins to ingest data from different sources. Configuring Logstash is a bit more complex than Promtail. Promtail is an agent that needs to be deployed to every machine that has applications to be monitored (https://signoz.io/blog/loki-vs-elasticsearch/).

##### User Interface - Grafana vs. Kibana

Loki is developed by Grafana Labs, the company behind the popular Grafana dashboards. You can use Grafana to query and visualize the log data stored in Loki. If you are familiar with Prometheus and Grafana setup, it will be easier for you to visualize log data in Grafana. Grafana was originally built to visualize time-series data.  

The ELK stack uses Kibana as its data visualization layer. Kibana is more suited to visualizing data with context as Elasticsearch enables full-text search.  

Both Grafana and Kibana are popular dashboarding tools. The difference between them mainly lies in their genesis. Kibana was built to visualize data of any kind. Grafana started out as a fork of Kibana to focus mainly on time-series data (https://signoz.io/blog/loki-vs-elasticsearch/).

#### Choosing between Loki and Elasticsearch

Choosing between Loki and Elasticsearch depends on your use cases and the resources available. While Loki is resource efficient, it does not give the rich search capabilities given by Elasticsearch. You also have to factor in the cost and resource requirements. Elasticsearch needs more resources as compared to Loki.

If you are starting out your log analytics journey and want something to start quickly, Loki can be a good option. At the same time, Elasticsearch makes more sense for larger-scale and enterprise teams.

You can also try out [SigNoz](https://signoz.io/). SigNoz can be a good choice for users who don’t have the resources to support the Elasticsearch stack and want better querying capabilities than Loki (https://signoz.io/blog/loki-vs-elasticsearch/).

---

### Alternatives

#### SigNoz

SigNoz is a full-stack open source APM that you can use as an alternative to Loki and Elasticsearch. SigNoz uses a columnar database ClickHouse to store logs, which is very efficient at ingesting and storing logs data. Columnar databases like ClickHouse are very effective in storing log data and making it available for analysis.

Big companies like Uber have [shifted](https://www.uber.com/en-IN/blog/logging/) from the Elastic stack to ClickHouse for their log analytics platform. Cloudflare too was using Elasticsearch for many years but [shifted to ClickHouse](https://blog.cloudflare.com/log-analytics-using-clickhouse/) because of limitations in handling large log volumes with Elasticsearch.

While Loki is also resource efficient, it does not give you advanced querying capabilities on high cardinality data. SigNoz utilizes the underlying columnar database to let users run advanced queries faster.

SigNoz uses [OpenTelemetry](https://opentelemetry.io/) for instrumenting applications. OpenTelemetry, backed by [CNCF](https://www.cncf.io/), is quickly becoming the world standard for instrumenting cloud-native applications.

The logs tab in SigNoz has advanced features like a log query builder, search across multiple fields, structured table view, JSON view, etc.

You can also view logs in real time with live tail logging.  

With advanced Log Query Builder, you can filter out logs quickly with a mix and match of fields (https://signoz.io/blog/loki-vs-elasticsearch/).

* **A Lightweight Open Source ELK alternative:** https://signoz.io/blog/elk-alternative-open-source/