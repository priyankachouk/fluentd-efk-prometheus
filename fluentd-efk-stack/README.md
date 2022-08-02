**fluentd** is an open-source data collector for a unified logging layer. Fluentd allows you to unify data collection and consumption for better use and understanding of data.Once installed on a server, it runs in the background to collect, parse, transform, analyze and store various types of data.

Fluentd was created by Sadayuki Furuhashi as a project of the Mountain View-based firm Treasure Data. Written primarily in Ruby, its source code was released as open-source software in October 2011.

The "core idea of Fluentd is to be the unifying layer between different types of log inputs and outputs".

 

![image](https://user-images.githubusercontent.com/50665675/163952903-59a5b015-445d-4bb5-a1aa-dba1016bf3ce.png)





Fluentd scraps logs from a given set of sources, processes them (converting into a structured data format) and then forwards them to other services like Elasticsearch, object storage etc.

Fluent Bit is a log processor and log forwarder which is being developed as a CNCF sub project under the umbrella of Fluentd project.

Fluentd is written in C and Ruby and built as a Ruby gem so it consumes some amount of memory resources. On the other hand, since Fluent Bit is written only in C and has no dependencies, the consumed memory usage much decreased compared to Fluentd which makes it easy to run on the embedded Linux and container environment.

Fluentd is a fully free and fully open-source log collector that instantly enables you to have a 'Log Everything' architecture with .






![image](https://user-images.githubusercontent.com/50665675/163549254-435c8bc4-41d0-4517-95ee-0f45023f9c28.png)






Fluentd treats logs as JSON, a popular machine-readable format. It is written primarily in C with a thin-Ruby wrapper that gives users flexibility.
Fluentd's scalability has been proven in the field: its largest user currently collects logs from 50,000+ servers.

Prefer this link to learn more in details about Fluentd: 

https://docs.fluentd.org/quickstart


**Config File Syntax**

This is describes the basic concepts of Fluentd configuration file syntax.

The Lifecycle of a Fluentd Event


The configuration file allows the user to control the input and output behavior of Fluentd by:  1) selecting input and output plugins; and, 2) specifying the plugin parameters. The file is required for Fluentd to operate properly.


**Config File Location:**


If you install Fluentd using the td-agent packages, the config file should be at /etc/td-agent/td-agent.conf.

$ sudo vi /etc/td-agent/td-agent.conf


If you install Fluentd using the Ruby Gem, you can create the configuration file using the following commands:

$ sudo fluentd --setup /etc/fluent
$ sudo vi /etc/fluent/fluent.conf


Docker
For a Docker container, the default location of the config file is /fluentd/etc/fluent.conf. 
To mount a config file from outside of Docker, use a bind-mount.

$docker run -ti --rm -v /path/to/dir:/fluentd/etc fluentd -c /fluentd/etc/<conf-file>

  

Character Encoding:

Fluentd assumes configuration file is UTF-8 or ASCII.


**List of Directives**


The configuration file consists of the following directives:

**source** directives determine the input sources

**match** directives determine the output destinations

**filter** directives determine the event processing pipelines

**system** directives set system-wide configuration

**label** directives group the output and filter for internal routing

@include directives include other files




**Detailed information about Fluentd:**


**Lifecycle of a Fluentd**

The configuration file is the fundamental piece to connect all things together, as it allows to define which Inputs or listeners Fluentd will have and set up common matching rules to route the Event data to a specific Output.


**Plugin Overview**

**Input Plugins** : Input plugins extend Fluentd to retrieve and pull event logs from the external sources. An input plugin typically creates a thread, socket, and a listening socket. It can also be written to periodically pull data from the data sources.


**Output Plugins** : Fluentd v1.0 output plugins have three (3) buffering and flushing modes:

Non-Buffered mode does not buffer data and write out results immediately.

Synchronous Buffered mode has "staged" buffer chunks (a chunk is a
collection of events) and a queue of chunks, and its behavior can be
controlled by <buffer> section.
  
Asynchronous Buffered mode also has "stage" and "queue", but
the output plugin will not commit writing chunks in methods
synchronously, but commit them later.
  
  
  
**Buffer Plugins** : Buffer plugins are used by output plugins.
  
  For example, out_s3 uses buf_file by default to store incoming stream temporally before transmitting to S3.
Buffer plugins are, as you can tell by the name, pluggable. So you can choose a suitable backend based on your system requirements.
  
  
**Filter Plugins** : Filter plugins enable Fluentd to modify event streams. Some use cases are:
  
1)Filtering out events by grepping the value of one or more fields.
  
2)Enriching events by adding new fields.
  
3)Deleting or masking certain fields for privacy and compliance.
  
  
  
  
**Formatter Plugins** :  Sometimes, the output format for an output plugin does not meet one's needs.
                        Fluentd has a pluggable system called Formatter that lets the user extend and re-use custom output formats.

  Ex: 
  
      <match foo.bar>
        @type file
        path /path/to/file
        <format>
          @type json
        </format>
      </match>
  
  

**Config: Common Parameters** :
  
**Parameters for all the Plugins:**
  

**@type**
  
The @type parameter specifies the type of the plugin.
  
    <source>
      @type my_plugin_type
    </source>

    <filter>
      @type my_filter
    </filter>
  
  
 **@id**
  
The @id parameter specifies a unique name for the configuration. It is used as paths for buffer, storage, logging and for other purposes.
  
    <match>
      @type file
      @id service_www_accesslog
      path /path/to/my/access.log
      # ...
    </match>
  
  
  **Plugin Parameters that Emit Events:**

  
  The @label parameter is to route the input events to <label> sections, the set of the <filter> and <match> subsections under <label>.
  
      <source>
      @type ...
      @label @access_logs
      # ...
    </source>

    <source>
      @type ...
      @label @system_metrics
      # ...
    </source>

    <label @access_log>
      <match **>
        @type file
        path ...
      </match>
    </label>

    <label @system_metrics>
      <match **>
        @type file
        path ...
      </match>
    </label>
  
  
  NOTE: The values for the @label parameter MUST start with @ character.
  

