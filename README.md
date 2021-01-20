![web](https://raw.githubusercontent.com/Pharma-collect/Server/main/img/pharmalogo.png)

[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=Pharma-collect_Server&metric=bugs)](https://sonarcloud.io/dashboard?id=Pharma-collect_Server)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=Pharma-collect_Server&metric=security_rating)](https://sonarcloud.io/dashboard?id=Pharma-collect_Server)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=Pharma-collect_Server&metric=alert_status)](https://sonarcloud.io/dashboard?id=Pharma-collect_Server)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=Pharma-collect_Server&metric=vulnerabilities)](https://sonarcloud.io/dashboard?id=Pharma-collect_Server)

# Architecture

![web](https://raw.githubusercontent.com/Pharma-collect/Server/main/img/server.png)

# Description

## Data Flow

### Traefik

Traefik is a reverse-proxy and load balancer, this mean all requests are redirected to the corresponding service, requests are redirected to the least used instance to allow better management of resources

![web](https://raw.githubusercontent.com/Pharma-collect/Server/main/img/traefik_dashboard.png)

For more details, go to their [websites](https://doc.traefik.io/traefik/)

### Laravel

Laravel is a web application framework with expressive, elegant syntax. We’ve already laid the foundation — freeing you to create without sweating the small things.

For,more details, go to their [websites](https://laravel.com/)

### Node.js

Node.js is a Web Backend Framework, it will process the requests coming from the Frontend, The Authentication, The communication with the database.

For more details, go to their [websites](https://nodejs.org/en/) or our [repository](https://github.com/Pharma-collect/Web_server)

### PhpMyAdmin

phpMyAdmin is a free software tool written in [PHP](https://php.net/), intended to handle the administration of [MySQL](https://www.mysql.com/) over the Web. phpMyAdmin supports a wide range of operations on MySQL and MariaDB. Frequently used operations (managing databases, tables, columns, relations, indexes, users, permissions, etc) can be performed via the user interface, while you still have the ability to directly execute any SQL statement.

For more details, go to their [websites](https://www.phpmyadmin.net/)

### MariaDB

MariaDB Server is one of the most popular open source relational databases. It’s made by the original developers of MySQL and guaranteed to stay open source. It is part of most cloud offerings and the default in most Linux distributions.

For more details, go to their [websites](https://mariadb.org/)

## CI/CD

### Jenkins

Jenkins is used to build and test your product continuously, so developers can continuously integrate changes into the build. Jenkins is the most popular open source CI/CD tool on the market today and is used in support of DevOps, alongside other cloud native tools.

Jenkins will

1. Triggers commit in the main branch of all pharmacollect repository's

2. Build, tag and push docker images

3. Deploy the new versions

for more details, go to their [websites](https://www.jenkins.io/)

## Metrics tools

Traefik expose some prometheus metrics that Grafana use to craft some dashboard

### Grafana Dashboard

![web](https://raw.githubusercontent.com/Pharma-collect/Server/main/img/grafana.png)

## Cybersecurity

### Sonarcloud

Sonarcloud is the Static Analysis Secure Tool use in the entire project, he catch all vulnerabilities and help with the code quality

![web](https://raw.githubusercontent.com/Pharma-collect/Server/main/img/sonar.png)

### Suricata

Suricata is a free and open source, mature, fast and robust network threat detection engine.

The Suricata engine is capable of real time intrusion detection (IDS), inline intrusion prevention (IPS), network security monitoring (NSM) and offline pcap processing.

Suricata inspects the network traffic using a powerful and extensive rules and signature language, and has powerful Lua scripting support for detection of complex threats.

For more details, go to their [websites](https://suricata-ids.org/)

### Wazuh

Wazuh is a free, open source and enterprise-ready security monitoring solution for threat detection, integrity monitoring, incident response and compliance.

We run wazuh with elasticsearch and kibana

![web](https://raw.githubusercontent.com/Pharma-collect/Server/main/img/wazuh.png)

For more details, go to their [websites](https://wazuh.com/)

### TLS and SSL  

All requests are secure, we use https protocol.

For this project, we used a Let's Encrypt wildcard certificates provided by a Custom DNS named Traefik.me

# Get the environment

## Prerequisite

To install the pharmacollect environment, you'll need:

- [ ] Docker

- [ ] docker-compose

- [ ] Root access on the server

## Install

### Application

Then run the following command:

    git clone https://github.com/Pharma-collect/Server.git
    
    cd Server

    cp .env-example .env  ##You should change default password on .env and mariadb_config/init.sql files

    docker-compose -f app.yml up -d

That's it ! Enjoy !

You can add more **metrics/monitoring** containers:

### Metrics

    docker-compose -f metrics.yml up -d

Then you can access Grafana Dashboard on http://localhost:3000 by default with **admin:admin** credentials

### Monitoring

You need to increase `max_map_count` on your Docker host:

    sysctl -w vm.max_map_count=262144

Then:

    docker-compose -f cyber.yml up -d

Then you can access Kibana Dashboard on https://www.localhost:6443/ by default with **admin:admin** credentials
  
## Docker Images

All Docker images used in this project are available in [Dockerhub](https://hub.docker.com/) as pharmacollect/images:tag

- pharmacollect/node
- pharmacolelct/phpmyadmin
- pharmacollect/mariadb
- pharmacollect/payment
- pharmacollect/webfr
- pharmacollect/webbo
