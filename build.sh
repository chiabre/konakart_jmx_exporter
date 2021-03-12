#!/bin/bash

JMX_EXPORTER_VERSION="0.15.0"

docker build --network host --build-arg KONAKART_VERSION=${KONAKART_VERSION} --build-arg JMX_EXPORTER_VERSION=${JMX_EXPORTER_VERSION} -t "chiabre/konakart_jmx_exporter:9400-${JMX_EXPORTER_VERSION}" --file Dockerfile_kk9400 .
docker build --network host --build-arg KONAKART_VERSION=${KONAKART_VERSION} --build-arg JMX_EXPORTER_VERSION=${JMX_EXPORTER_VERSION} -t "chiabre/konakart_jmx_exporter:9200-${JMX_EXPORTER_VERSION}" --file Dockerfile_kk9200 .
