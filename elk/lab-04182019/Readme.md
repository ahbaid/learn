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
* run the agent
~~~~bash
ahbaidg@safa:~/github/learn/elk/lab-04182019/downloads/metricbeat-7.0.0-linux-x86_64$ nohup ./metricbeat -e 1>>metricbeat.log 2>&1 &
[1] 20736
ahbaidg@safa:~/github/learn/elk/lab-04182019/downloads/metricbeat-7.0.0-linux-x86_64$ jobs
[1]+  Running                 nohup ./metricbeat -e >> metricbeat.log 2>&1 &
ahbaidg@safa:~/github/learn/elk/lab-04182019/downloads/metricbeat-7.0.0-linux-x86_64$ ls -alrth metricbeat.log
-rw-rw-r-- 1 ahbaidg ahbaidg 7.3K Apr 18 11:58 metricbeat.log
~~~~

## Filebeat:
* list modules
~~~~bash
ahbaidg@safa:~/github/learn/elk/lab-04182019/downloads/filebeat-7.0.0-linux-x86_64$ ./filebeat modules list
Enabled:

Disabled:
apache
auditd
elasticsearch
haproxy
icinga
iis
iptables
kafka
kibana
logstash
mongodb
mysql
nginx
osquery
postgresql
redis
santa
suricata
system
traefik
zeek
~~~~
* update filebeat.yml with cloud.id and cloud.auth settings
* enable NGINX module
~~~~bash
ahbaidg@safa:~/github/learn/elk/lab-04182019/downloads/filebeat-7.0.0-linux-x86_64$ ./filebeat modules enable nginx
Enabled nginx
~~~~
* Download sample data nginx.log.zip (28M)
* Configure module.d/nginx.yaml
~~~~bash
ahbaidg@safa:~/github/learn/elk/lab-04182019$ cat downloads/filebeat-7.0.0-linux-x86_64/modules.d/nginx.yml | grep "var.paths"
    #var.paths:
    var.paths: ["/home/ahbaidg/github/learn/elk/lab-04182019/nginx.log"]
    #var.paths:
~~~~
* run module setup
~~~~bash
ahbaidg@safa:~/github/learn/elk/lab-04182019/downloads/filebeat-7.0.0-linux-x86_64$ ./filebeat -e setup nginx
....
2019-04-18T12:25:54.894-0700    INFO    instance/beat.go:741    Kibana dashboards successfully loaded.
Loaded dashboards
2019-04-18T12:25:54.894-0700    INFO    elasticsearch/client.go:165     Elasticsearch url: https://695a7684c9b343278c2ce285b8746d89.us-west-1.aws.found.io:443
2019-04-18T12:25:54.985-0700    INFO    elasticsearch/client.go:734     Attempting to connect to Elasticsearch version 7.0.0
2019-04-18T12:25:55.005-0700    INFO    kibana/client.go:118    Kibana url: https://5d26e144bafb4c3cb4c082324b451909.us-west-1.aws.found.io:443
Loaded machine learning job configurations
~~~~
* run the filebeats module
~~~~bash
ahbaidg@safa:~/github/learn/elk/lab-04182019/downloads/filebeat-7.0.0-linux-x86_64$ nohup ./filebeat -e 1>>filebeat.log 2>&1 &
[2] 9116

ahbaidg@safa:~/github/learn/elk/lab-04182019/downloads/filebeat-7.0.0-linux-x86_64$ tail -f filebeat.log 
2019-04-18T12:27:19.893-0700    INFO    [index-management.ilm]  ilm/std.go:134  do not generate ilm policy: exists=true, overwrite=false
2019-04-18T12:27:19.893-0700    INFO    [index-management]      idxmgmt/std.go:238      ILM policy successfully loaded.
2019-04-18T12:27:19.893-0700    INFO    [index-management]      idxmgmt/std.go:361      Set setup.template.name to '{filebeat-7.0.0 {now/d}-000001}' as ILM is enabled.
2019-04-18T12:27:19.893-0700    INFO    [index-management]      idxmgmt/std.go:366      Set setup.template.pattern to 'filebeat-7.0.0-*' as ILM is enabled.
2019-04-18T12:27:19.894-0700    INFO    [index-management]      idxmgmt/std.go:400      Set settings.index.lifecycle.rollover_alias in template to {filebeat-7.0.0 {now/d}-000001} as ILM is enabled.
2019-04-18T12:27:19.894-0700    INFO    [index-management]      idxmgmt/std.go:404      Set settings.index.lifecycle.name in template to {filebeat-7.0.0 map[policy:{"phases":{"hot":{"actions":{"rollover":{"max_age":"30d","max_size":"50gb"}}}}}]} as ILM is enabled.
2019-04-18T12:27:19.909-0700    INFO    template/load.go:129    Template already exists and will not be overwritten.
2019-04-18T12:27:19.909-0700    INFO    [index-management]      idxmgmt/std.go:272      Loaded index template.
2019-04-18T12:27:19.924-0700    INFO    [index-management]      idxmgmt/std.go:283      Write alias successfully generated.
2019-04-18T12:27:20.040-0700    INFO    pipeline/output.go:105  Connection to backoff(elasticsearch(https://695a7684c9b343278c2ce285b8746d89.us-west-1.aws.found.io:443)) established
2019-04-18T12:27:43.621-0700    INFO    [monitoring]    log/log.go:144  Non-zero metrics in the last 30s        {"monitoring": {"metrics": {"beat":{"cpu":{"system":{"ticks":160,"time":{"ms":169}},"total":{"ticks":1180,"time":{"ms":1190},"value":1180},"user":{"ticks":1020,"time":{"ms":1021}}},"handles":{"limit":{"hard":1048576,"soft":1024},"open":8},"info":{"ephemeral_id":"af9af61b-6c7d-485d-8870-aeabb53920fe","uptime":{"ms":30029}},"memstats":{"gc_next":50956304,"memory_alloc":43306024,"memory_total":175483288,"rss":78741504}},"filebeat":{"events":{"active":4117,"added":14358,"done":10241},"harvester":{"open_files":1,"running":1,"started":1}},"libbeat":{"config":{"module":{"running":0},"reloads":1},"output":{"events":{"acked":10240,"active":50,"batches":206,"total":10290},"read":{"bytes":194445},"type":"elasticsearch","write":{"bytes":11150521}},"pipeline":{"clients":4,"events":{"active":4117,"filtered":1,"published":14356,"retry":50,"total":14358},"queue":{"acked":10240}}},"registrar":{"states":{"current":1,"update":10241},"writes":{"success":206,"total":206}},"system":{"cpu":{"cores":2},"load":{"1":1.24,"15":1.12,"5":1.18,"norm":{"1":0.62,"15":0.56,"5":0.59}}}}}}
~~~~

