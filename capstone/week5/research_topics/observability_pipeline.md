## Observability Pipeline

The idea is to automate an observability pipeline using various tools. The pipeline would mimic the EFK or ELK stacks. 

#### What is the ELK Stack?

The ELK stack is an acronym used to describe a stack that comprises of three popular projects: Elasticsearch, Logstash, and Kibana. Often referred to as Elasticsearch, the ELK stack gives you the ability to aggregate logs from all your systems and applications, analyze these logs, and create visualizations for application and infrastructure monitoring, faster troubleshooting, security analytics, and more (https://aws.amazon.com/what-is/elk-stack/).  

##### **E = Elasticsearch**

Elasticsearch is a distributed search and analytics engine built on Apache Lucene. Support for various languages, high performance, and schema-free JSON documents makes Elasticsearch an ideal choice for various log analytics and search use cases (https://aws.amazon.com/what-is/elk-stack/).

On January 21, 2021, Elastic NV announced that they would change their software licensing strategy and not release new versions of Elasticsearch and Kibana under the permissive Apache License, Version 2.0 (ALv2) license. Instead, new versions of the software will be offered under the Elastic license, with source code available under the Elastic License or SSPL. These licenses are not open source and do not offer users the same freedoms. For a secure, high-quality, fully open source search and analytics suite, you can use the [OpenSearch](https://opensearch.org/) project, a community-driven, ALv2 licensed fork of open source Elasticsearch and Kibana (https://aws.amazon.com/what-is/elk-stack/).

##### **L = Logstash**

Logstash is an open-source data ingestion tool that allows you to collect data from a variety of sources, transform it, and send it to your desired destination. With pre-built filters and support for over 200 plugins, Logstash allows users to easily ingest data regardless of the data source or type (https://aws.amazon.com/what-is/elk-stack/).

Logstash is a light-weight, open-source, server-side data processing pipeline that allows you to collect data from a variety of sources, transform it on the fly, and send it to your desired destination. It is most often used as a data pipeline for Elasticsearch, an open-source analytics and search engine. Because of its tight integration with Elasticsearch, powerful log processing capabilities, and over 200 pre-built open-source plugins that can help you easily index your data, Logstash is a popular choice for loading data into Elasticsearch (https://aws.amazon.com/what-is/elk-stack/).

###### Easily load unstructured data

Logstash allows you to easily ingest unstructured data from a variety of data sources including system logs, website logs, and application server logs. 

###### Pre-built filters

Logstash offers pre-built filters, so you can readily transform common data types, index them in Elasticsearch, and start querying without having to build custom data transformation pipelines.

###### Flexible plugin architecture

With over 200 plugins already available on Github, it is likely that someone has already built the plugin you need to customize your data pipeline. But if none is available that suits your requirements, you can easily create one yourself (https://aws.amazon.com/what-is/elk-stack/).

##### **K = Kibana**

Kibana is a data visualization and exploration tool used for log and time-series analytics, application monitoring, and operational intelligence use cases. It offers powerful and easy-to-use features such as histograms, line graphs, pie charts, heat maps, and built-in geospatial support. Also, it provides tight integration with Elasticsearch, a popular analytics and search engine, which makes Kibana the default choice for visualizing data stored in Elasticsearch (https://aws.amazon.com/what-is/elk-stack/).

On January 21, 2021, Elastic NV announced that they would change their software licensing strategy and not release new versions of Elasticsearch and Kibana under the permissive Apache License, Version 2.0 (ALv2) license. Instead, new versions of the software will be offered under the Elastic license, with source code available under the Elastic License or SSPL. These licenses are not open source and do not offer users the same freedoms. To ensure that the open source community and our customers continue to have a secure, high-quality, fully open source search and analytics suite, we introduced the [OpenSearch](https://web.archive.org/web/20221006230230/https://opensearch.org/) project, a community-driven, ALv2 licensed fork of open source Elasticsearch and Kibana. The OpenSearch suite consists of a search engine, OpenSearch, and a visualization and user interface, OpenSearch Dashboards (https://aws.amazon.com/what-is/elk-stack/).

You can run Apache 2.0 licensed Kibana versions (up until version 7.10.2) on-premises, on Amazon EC2, or on Amazon OpenSearch Service. OpenSearch Dashboards is an open source alternative to Kibana, which is also available to self-manage. It was derived from the last open source version of Kibana (7.10.2) and contains many advancements and is well supported via the OpenSearch Project. With on-premises or Amazon EC2 deployments, you are responsible for provisioning the infrastructure, installing Kibana or OpenSearch Dashboards software, and managing the infrastructure. With Amazon OpenSearch Service, Kibana or OpenSearch Dashboards are deployed automatically with your domain as a fully managed service, automatically taking care of all the heavy-lifting to manage the cluster (https://aws.amazon.com/what-is/elk-stack/).

###### Interactive charts

Kibana offers intuitive charts and reports that you can use to interactively navigate through large amounts of log data. You can dynamically drag time windows, zoom in and out of specific data subsets, and drill down on reports to extract actionable insights from your data.

###### Mapping support

Kibana comes with powerful geospatial capabilities so you can seamlessly layer in geographical information on top of your data and visualize results on maps.

###### Pre-built aggregations and filters

Using Kibana’s pre-built aggregations and filters, you can run a variety of analytics like histograms, top-N queries, and trends with just a few clicks.

###### Easily accessible dashboards

You can easily set up dashboards and reports and share them with others. All you need is a browser to view and explore the data (https://aws.amazon.com/what-is/elk-stack/).

#### How does the ELK stack work?

1. Logstash ingests, transforms and sends the data to the right destination.
2. Elasticsearch indexes, analyzes, and searches the ingested data.
3. Kibana visualizes the results of the analysis.

#### Why is the ELK stack important?

The ELK Stack fulfills a need in the log analytics space. As more and more of your IT infrastructure move to public clouds, you need a log management and analytics solution to monitor this infrastructure as well as process any server logs, application logs, and clickstreams. The ELK stack provides a simple yet robust log analysis solution for your developers and DevOps engineers to gain valuable insights on failure diagnosis, application performance, and infrastructure monitoring – at a fraction of the price.

#### What is the EFK Stack?

It is similar to the ELK stack except instead of using Logstash it uses Fluentd.

#### Open Source Alternatives

* Using a combination of Fluentd or Fluent Bit with SigNoz (https://signoz.io/docs/userguide/fluentbit_to_signoz/; https://signoz.io/docs/userguide/fluentd_to_signoz/)
* Using Fluentd with Prometheus (https://docs.mirantis.com/mcp/q4-18/mcp-operations-guide/lma/configure-stacklight/configure-logging-system-components/configure-fluentd/generate-metrics-from-logs.html)
* Using Fluent Bit with Grafana Cloud (https://calyptia.com/2021/08/11/use-fluent-bit-to-send-logs-and-metrics-to-grafana-cloud/)

#### What is Fluentd?

Fluentd calls itself an open source data collector for unified logging layer. It allows you to unify data collection and consumption for a better use and understanding of data (https://www.fluentd.org/).

Fluentd is a data collection tool.

Fluentd deals with core concerns and leaves specific use cases up to plugins.

##### Unified Logging with JSON

Fluentd tries to structure data as JSON as much as possible: this allows Fluentd to **unify** all facets of processing log data: collecting, filtering, buffering, and outputting logs across **multiple sources and destinations** ([Unified Logging Layer](http://www.fluentd.org/blog/unified-logging-layer)). The downstream data processing is much easier with JSON, since it has enough structure to be accessible while retaining flexible schemas (https://www.fluentd.org/architecture).

##### Pluggable Architecture

Fluentd has a flexible plugin system that allows the community to extend its functionality. Our 500+ community-contributed plugins connect dozens of [data sources](https://www.fluentd.org/datasources) and [data outputs](https://www.fluentd.org/dataoutputs). By leveraging the plugins, you can start making better use of your logs right away (https://www.fluentd.org/architecture).

#### What is SigNoz?

SigNoz is an open-source application performance monitoring tool that helps you monitor your applications and troubleshoot problems. SigNoz uses distributed tracing to gain visibility into your software stack.

With SigNoz, you can do the following:

- Monitor application metrics such as latency, requests per second, error rates
- Monitor infrastructure metrics such as CPU utilization or memory usage
- Track user requests across services
- Set alerts on metrics
- Find the root cause of the problem by going to the exact traces which are causing the problem
- See detailed flame graphs of individual request traces

(https://signoz.io/docs/).

#### What the Data Observability Pipeline might look like, using Fluentd and Grafana

Here's a rough outline of how you could build a data observability pipeline with Fluentd and Grafana:

1. Collect log data from various sources such as application servers, databases, and cloud services using Fluentd.
2. Filter, parse, and transform the log data using Fluentd plugins, to ensure that the data is in a format that can be ingested by Grafana.
3. Store the transformed log data in a data store such as Elasticsearch, InfluxDB, or MySQL.
4. In Grafana, connect to the data store where the log data is stored, and create visualizations, such as charts, tables, and graphs, to help you understand the log data and identify trends, patterns, and anomalies.
5. Create dashboards in Grafana that bring together the various visualizations and provide a comprehensive view of your log data, which can be valuable for troubleshooting, performance optimization, and decision-making.

By using Fluentd and Grafana together, you can build a data observability pipeline that provides a unified view of your logs, metrics, and traces, which can be very useful for debugging, troubleshooting, and optimizing your applications and infrastructure.

---

## Setting up an EFK Stack

#### Installing Docker and Docker Compose on Digital Ocean Droplet

https://computingforgeeks.com/install-docker-ce-on-linux-systems/

https://adamtheautomator.com/docker-compose-tutorial/#h-installing-docker-compose

#### Setting up an EFK Stack on Digital Ocean Droplet

https://adamtheautomator.com/efk-stack/

##### PermissionError: [Errno 13] Permission denied when running `docker-compose up -d`

https://feitam.es/how-to-fix-in-docker-and-docker-compose-the-error-permissionerror-errno-13-permission-denied-in-the-fastest-way-and-possibly-unorthodox/

#### Setting up an ELK Stack on Mac

https://logz.io/blog/elk-mac/

##### To install Elasticsearch and Kibana you'll need to do it with `brew tap`

https://www.elastic.co/guide/en/elasticsearch/reference/7.17/brew.html

https://www.elastic.co/guide/en/kibana/7.17/brew.html



