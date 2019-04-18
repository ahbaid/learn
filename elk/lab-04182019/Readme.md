# ELK Lab 04-18-2019 Dublin, CA

## Elastic's Approach
Three Pillars of observability:
- Metrics
- Tracing
- Logging
Venn diagram intersections

## Lab Settings
* Username: elastic
* Password: xl8adzgpYw9P62aufc7XztSN
* Cloud-ID: ag-elk-ws1:dXMtd2VzdC0xLmF3cy5mb3VuZC5pbyQ2OTVhNzY4NGM5YjM0MzI3OGMyY2UyODViODc0NmQ4OSQ1ZDI2ZTE0NGJhZmI0YzNjYjRjMDgyMzI0YjQ1MTkwOQ==
* APM Server Secret Token: bqmx1C1OfwaClB3phk


## Ingestion - acquiring, enriching & transforming data
* Beats:
    - https://github.com/elastic/beats
    - lightweight data shippers
    - written in go, no jvm overhead
    - 70+ community beats
* Tutorials on elastic.co
* Demo at http://demo.elastic.co
* Logstash:
    - Ingest
    - Parse
    - Transform
    - Secure & encrypt inputs
    - Pipelines: input + filter + output

## Capturing & Visualizing Metrics & Logs
* Ingest multiple logs files and metrics into an Elastic stack.
* Download and install:
    - MetricBeat: https://www.elastic.co/downloads/beats/metricbeat 
    - Filebeat: https://www.elastic.co/downloads/beats/filebeat

## Metricbeat:
* Edit metricbeat.yml
    - cloud.id
    - cloud.auth
* list modules
~~~~bash
$ ./metricbeat modules list
Enabled:
system

Disabled:
aerospike
apache
~~~~
* setup system
~~~~bash
$ ./metricbeat -e setup system
....
Index setup complete.
Loading dashboards (Kibana must be running and reachable)
2019-04-18T11:55:28.878-0700    INFO    kibana/client.go:118    Kibana url: https://5d26e144bafb4c3cb4c082324b451909.us-west-1.aws.found.io:443
2019-04-18T11:55:29.280-0700    INFO    kibana/client.go:118    Kibana url: https://5d26e144bafb4c3cb4c082324b451909.us-west-1.aws.found.io:443
2019-04-18T11:55:59.752-0700    INFO    instance/beat.go:741    Kibana dashboards successfully loaded.
Loaded dashboards
~~~~
