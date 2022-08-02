* **Logstash vs Fluentd vs Fluent Bit**

I’ll discuss the most popular log collectors, including Logstash, Fluentd, Fluent Bit here - 
Whether you already use an open-source log collector or are about to choose one or more for your environment,
it’s important to understand the key requirements of a log collector critical for your day-to-day operations. 




**Logstash**-----------------------------------------------------------------------


Logstash is among the most popular log collectors, and it’s a part of the ELK (Elasticsearch, Logstash, Kibana) stack.

Key Logstash strengths:

●      Handles structured and unstructured data.

●      Supports increased data security with the ability to exclude sensitive fields.

●      Supports hundreds of plugins which include input, filter, and output plugins. The filter plugins perform log processing such as aggregation and parsing.


Although Logstash is a reliable log collector with many options for processing log data.
Because Logstash is written in Java, it requires JVM support. If you’re planning to collect logs from embedded devices and IoT applications, 
it‘s not the best choice.




**Fluentd**--------------------------------------------------------------------------

Fluentd is a log collector with a small memory footprint that handles various log sources and destinations. 
Many supported plugins allow connections to multiple types of sources and destinations. 
Design wise — performance, scalability, and reliability are some of Fluentd's outstanding features.

Key Fluentd advantages:

*Supports many log sources and destinations

*Flexible and extensible parsing options, supporting a wide array of input formats

*Has a large ecosystem surrounding it, including hundreds of plugins plus the ability to write your own in Ruby

*Supports the Apache license, version 2.0

*Vendor neutrality (a CNCF project)

Fluentd is a good choice if you’re looking for vendor neutrality.
It’s also very popular to use with Kubernetes and containerized environments. 




**Fluent Bit**-------------------------------------------------------------------------


Fluent Bit works well in containerized environments such as Kubernetes clusters. Also, Fluent Bit can scale and still conserve resources because it has a small footprint. 
Although Fluent Bit is frequently used in Kubernetes environments, it can also be deployed on bare-metal servers, virtual machines, and embedded devices. 

Key Fluent Bit advantages:


*Lightweight design with minimal memory footprint (typically less than 1MB)

*Easy-to-scale architecture

*A pluggable architecture with a number of input, filter, and output plugins

*Supports metric-based as well as log-based payloads

*Supports sending logs to storage backends over a secure connection

*Supports the Apache license, version 2.0

*Vendor neutrality (a CNCF project)


Fluent Bit collects logs and metrics from various sources and sends them to different destinations as do other log collectors. 
Where Fluent Bit really shines is in embedded, edge, and other resource-constrained environments where a lean runtime paired with a wide array of input/output options is critical. 
Fluent Bit is not only a log collector but can also be used as a stream processor as well as a shipper for forwarding log data to Fluentd.


**Comparing Fluentd and Fluent Bit**---------------------------------------------------

Both Fluentd and Fluent Bit were developed by Treasure Data to help users build centralized, reliable and efficient logging pipelines. 
The vision behind Fluentd, and later on, Fluent Bit, was to help overcome some of the challenges involved in logging production environments — formatting unstructured data, aggregation from multiple data sources, resiliency and security.

While there are architectural and design similarities between the two tools, there are also some core differences that should be taken into consideration when picking between the two.

Below is a table summing up the differences between the two tools:





![image](https://user-images.githubusercontent.com/50665675/165493399-001bea4e-1912-4d00-939f-307078abed03.png)






Fluent-bit is fully designed and built on the top of the best ideas of fluentd architecture and general design.
Choosing which one to use depends on the end-user needs.


And it is very intersting to know that even that are possible to use both fluentd and fluentbit together to create a very efficient and high      		  performance log processing architecture for your environment.
	
	
The combination of Fluentd and Fluent Bit is becoming extremely popular in Kubernetes deployments because of the way they compliment each other — 
Fluent Bit acting as a lightweight shipper collecting data from the different nodes in the cluster and forwarding the data to Fluentd for aggregation, processing and routing to any of the supported output destinations.

----------------------------------------------------------------------------------------

