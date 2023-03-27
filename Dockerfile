ARG KONAKART_VERSION="9600_ce"

FROM konakart/konakart_${KONAKART_VERSION}:latest

LABEL maintainer="luca.chiabrera@gmail.com"

ARG JMX_EXPORTER_VERSION="0.6.2"

ENV JAVA_OPTS "-Xmx1400m -Xms400m"

ENV JMX_EXPORTER_DOWNLOAD_URL  https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/${JMX_EXPORTER_VERSION}/jmx_prometheus_javaagent-${JMX_EXPORTER_VERSION}.jar

RUN    apt-get -y update \
    && apt-get -y --no-install-recommends install curl \
    && mkdir -p /opt/jmx-exporter/ \
    && curl --location --silent --show-error --output /opt/jmx-exporter/jmx_prometheus_javaagent.jar ${JMX_EXPORTER_DOWNLOAD_URL} \
    && apt-get -y remove curl \
    && apt-get -y autoremove \
    && apt-get -y autoclean

COPY jmx_exporter_config.yml /opt/jmx-exporter/config.yml
COPY startkonakart_${KONAKART_VERSION}.sh /usr/local/konakart/bin/startkonakart.sh 

EXPOSE 9404   