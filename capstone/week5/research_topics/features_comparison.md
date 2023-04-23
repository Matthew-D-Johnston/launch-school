## Features Comparison

### DataDog

Feature Products on Main Site (https://www.datadoghq.com/)

* Logs
  * Log Management
  * Sensitive Data Scanner
  * Audit Trail
  * Observability Pipelines
* APM
  * Distributed Tracing
  * Continuous Profiler
  * Database Monitoring
  * CI Visibility
  * Service Catalog
  * Universal Service Monitoring

Features according to https://signoz.io/blog/datadog-vs-newrelic/

- Application Performance Monitoring (https://signoz.io/blog/datadog-vs-newrelic/)
  * DataDog's APM provides end-to-end distributed tracing connecting frontend devices to databases.
  * Some of the key features of DataDog APM includes:
    - Distributed tracing can track requests from user sessions to services and databases.
    - Users can correlate their distributed traces to infrastructure and network metrics.
    - With DataDog's APM, you can ingest 100% of your traces from the last 15 minutes. You can then retain error and high latency traces
    - You can inspect code-level performance and break down slow requests.
- Log Management (https://signoz.io/blog/datadog-vs-newrelic/)
  * DataDog log management provides capabilities to search and analyze logs at any scale.
  * Some of the key features of DataDog Log Management includes:
    - Provides logging without limits, can ingest 100% of your logs before indexing.
    - Provides log processing pipelines for 170+ common technologies
    - Filter logs with a time range, tags, and full-text search
    - Provides aggregation of indexed logs
- Network monitoring
- Browser or end-user monitoring



---

### New Relic

- Application Performance Monitoring (https://signoz.io/blog/datadog-vs-newrelic/)
  * New Relic's APM covers performance monitoring for many programming languages and combines metrics from mobile and browser apps to services and databases.
  * Some of the key features of New Relic APM includes:
    - Auto-instrumentation of eight programming languages: Java, .Net, Node.js, PHP, Python, Ruby, Go and C/C++
    - Distributed tracing and sampling options for a wide range of technology stack
    - Correlation of tracing data with other aspects of application infrastructure and user monitoring
    - Fully managed cloud-native experience with on-demand scalability
- Log Management (https://signoz.io/blog/datadog-vs-newrelic/)
  * With New Relic Log Management, you can easily ingest any text-based data.
  * Some of the key features of New Relic log management include:
    - Custom charts and visualization for log data
    - Quick search response times for any volume of log data
    - Provides machine learning capabilities to detect issues from your log data automatically
- Network monitoring
- Browser or end-user monitoring

---

### OpenTelemetry

[OpenTelemetry](https://opentelemetry.io/) is an open source, vendor-neutral observability framework that provides tools, APIs, and SDKs to collect and standardize telemetry data from cloud-native applications and services (https://www.datadoghq.com/blog/ingest-opentelemetry-traces-metrics-with-datadog-exporter/?_gl=1*v0tf0b*_ga*MjkyODY3NzgyLjE2NzYzODA5NTk.*_ga_KN80RDFSQK*MTY3NjM4MDk1OS4zLjEuMTY3NjM4MTUwOC41OS4wLjA.).

OpenTelemetry is a vendor-agnostic instrumentation library. It provides a set of tools, APIs, and SDKs to create and manage telemetry data (logs, metrics, and traces) (https://signoz.io/blog/opentelemetry-vs-jaeger/).

OpenTelemetry will enable any company—with any stack, any infrastructure platform, and any monitoring provider—to gather observability data from all their systems, including distributed traces, metrics, and, eventually, logs (https://www.datadoghq.com/blog/opentelemetry-instrumentation/?_gl=1*w8xo*_ga*MjkyODY3NzgyLjE2NzYzODA5NTk.*_ga_KN80RDFSQK*MTY3NjM4MDk1OS4zLjAuMTY3NjM4MDk2MC41OS4wLjA.).

#### What is OpenTelemetry?

OpenTelemetry is an open-source project under the Cloud Native Computing Foundation ([CNCF](https://www.cncf.io/)) that aims to standardize the generation and collection of telemetry data. Telemetry data includes logs, metrics, and traces.

It is a collection of APIs, SDKs, and client libraries that is used to generate telemetry data from your application code. The data you collect with OpenTelemetry is vendor-agnostic and can be exported in many formats.

The biggest advantage of using OpenTelemetry is that you have the freedom to choose a backend of your choice. You don’t get locked into a vendor, and engineering teams can get ramped up on a single technology to generate telemetry data.

To integrate OpenTelemetry with your application code, you can use the OpenTelemetry client libraries of the required programming language. OpenTelemetry also provides a collector known as OTel (OpenTelemetry) collector that can be used to process and export telemetry data in multiple formats (https://signoz.io/blog/opentelemetry-vs-jaeger/).

#### OpenTelemetry Features

* OpenTelemetry provides instrumentation. Instrumentation is the process of enabling your application code to generate telemetry data.
* Using OpenTelemetry libraries, you can generate logs, metrics, and traces.
* OpenTelemetry can only be used to generate and collect data. It does not provide a storage layer.
* OpenTelemetry does not provide any web UI components.
* Supports exporting telemetry data in multiple data formats to a backend of choice.
* Cross-language capabilities with the ability to produce telemetry data in consistent formats across all major programming languages.

#### OpenTelemetry vs. DataDog and New Relic

OpenTelemetry can be used in conjunction with DataDog and New Relic. For example, New Relic supports the native OpenTelemetry Protocol (OTLP) for exporting telemetry data. This allows you to use the vendor neutral components developed by the OpenTelemetry community to export your data to New Relic (https://docs.newrelic.com/docs/more-integrations/open-source-telemetry-integrations/opentelemetry/opentelemetry-introduction/#how-it-works).

---

### Logz

Features:

* Log Management
* Distributed Tracing

---

### Elastic





---

### SigNoz

