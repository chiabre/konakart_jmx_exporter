
ARG KONAKART_VERSION="9600_ce"

FROM konakart/konakart_${KONAKART_VERSION}:latest

ARG JMX_EXPORTER_VERSION="0.18.0"

LABEL maintainer="luca.chiabrera@gmail.com"

ENV JAVA_OPTS "-Xmx1400m -Xms400m"



ENV JMX_EXPORTER_DOWNLOAD_URL  https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${JMX_EXPORTER_VERSION}/jmx_prometheus_javaagent-${JMX_EXPORTER_VERSION}.jar

RUN    apt-get -y update \
    && apt-get -y --no-install-recommends install curl \
    && mkdir -p /opt/jmx-exporter/ 

RUN curl --location --show-error --output /opt/jmx-exporter/jmx_prometheus_javaagent.jar ${JMX_EXPORTER_DOWNLOAD_URL}

RUN apt-get -y remove curl \
    && apt-get -y autoremove \
    && apt-get -y autoclean

COPY jmx_exporter_config.yml /opt/jmx-exporter/config.yml
COPY --chown=root: --chmod=751 startkonakart_9600_ce.sh /usr/local/konakart/bin/startkonakart.sh 

EXPOSE 9404   