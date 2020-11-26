# Pharmacollect Server

[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=Pharma-collect_Server&metric=bugs)](https://sonarcloud.io/dashboard?id=Pharma-collect_Server)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=Pharma-collect_Server&metric=security_rating)](https://sonarcloud.io/dashboard?id=Pharma-collect_Server)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=Pharma-collect_Server&metric=alert_status)](https://sonarcloud.io/dashboard?id=Pharma-collect_Server)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=Pharma-collect_Server&metric=vulnerabilities)](https://sonarcloud.io/dashboard?id=Pharma-collect_Server)

# Architecture
![web](https://raw.githubusercontent.com/Pharma-collect/Server/main/img/server.jpeg)
# Description
## Data Flow
### Traefik
Traefik is a reverse-proxy and load balancer, this mean all requests are redirected to the corresponding service, requests are redirected to the least used instance to allow better management of resources

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
 2.  Build, tag and push docker images
 3. Deploy the new

for more details, go to their [websites](https://www.jenkins.io/)

## Monitoring

Tools: Prometheus, Grafana

Status: pending

## Cybersecurity
### Sonarcloud

Sonarcloud is the Static Analysis Secure Tool use in the entire project, he catch all vulnerabilities and help with the code quality

### Suricata

Suricata is a free and open source, mature, fast and robust network threat detection engine.

The Suricata engine is capable of real time intrusion detection (IDS), inline intrusion prevention (IPS), network security monitoring (NSM) and offline pcap processing.

Suricata inspects the network traffic using a powerful and extensive rules and signature language, and has powerful Lua scripting support for detection of complex threats.

For more details, go to their [websites](https://suricata-ids.org/)

### TLS and SSL

All requests are secure, we use https protocol, **SHA-256** with **RSA 4096** Encryption, 

# Get the environment 

## Install

To install the pharmacollect environment, you'll need:

 - [ ] Docker
 - [ ] docker-compose
 - [ ] Root access on the server

Then run the following command:

    docker-compose up -d

That's it ! Enjoy !

##  Docker Images

All Docker images used in this project are available in [Dockerhub](https://hub.docker.com/) as pharmacollect/images:tag

 - pharmacollect/node
 - pharmacolelct/phpmyadmin
 - pharmacollect/mariadb


