# Docker image for Konakart Community Edition demo + JMX to Prometheus exporter

Docker image to run the Konakart Community Edition J2EE demo application exposing JMX to Prometheus exporter metrics and java options as env. variables.

**Konakart Community Edition** : a java based shopping cart software solution for online retailers. https://www.konakart.com/. ***Official [KonaKart Community Edition images](https://hub.docker.com/r/konakart)***

**JMX to Prometheus exporter**: a collector that can configurably scrape and expose mBeans of a JMX target. https://github.com/prometheus/jmx_exporter

The **version number** of this images is composed of two version numbers
  * the first is the version of the Konakart Community Edition 
  * the second is the version of JMX to Prometheus exporter embedded in this docker image

## KonaKart Community Edition demo + JMX to Prometheus exporter

`chiabre/konkart_jmx_exporter`

* Find Images of this repo on [docker hub](https://hub.docker.com/repository/docker/chiabre/konkart_jmx_exporter)
* Find repo of this images on [github](https://github.com/chiabre/konkart_jmx_exporter)

In addition to the [official Konakart images](https://hub.docker.com/r/konakart):
* JMX to Prometheus exporter metrics on port 9404
* JVM_OPTS as ENV variable (dafeult JAVA_OPTS="-Xmx1400m -Xms400m")

### Supported tags

* Konakart Community Edition 9400 (Java 11 and PostgreSQL 10) + JMX to Prometheus exporter 0.15
   * `latest`, `9400-0.15`
* Konakart Community Edition 9200 (Java 8 and PostgreSQL 9.4) + JMX to Prometheus exporter 0.15
   * `9200-0.15`


## How to use this image

### Build using

`build.sh`

### Run using

`docker run -d -p 8780:8780 -p 9404:9404 -e JAVA_OPTS="[YOUR JAVA OPTS]" chiabre/konkart_jmx_exporter`

The store ui is at:

http://[KONAKART]:8780/konakart/

The admin ui is at:

http://[KONAKART]:8780/konakartadmin/

(login using "admin@konakart.com" as the username and "princess" as the password)

The Prometheus JMX exporter metrics are at:

http://[KONAKART]:9404/metrics/

### Docker swarm sample

```dockercompose
version: "3.8"
services:
  konakart:
    image: chiabre/konkart_jmx_exporter
    deploy:
      restart_policy:
        condition: none
      resources:
        reservations:
          cpus: '4'
          memory: 4096m
        limits:
          cpus: '4'
          memory: 4096m
    ports:
    - 8780:8780
    - 9404:9404
    environment:
    - JAVA_OPTS="[YOUR JAVA OPTS]"```
