#!/bin/bash

KONAKART_VERSION="9600_ce"
JMX_EXPORTER_VERSION="0.6.2"


docker build --no-cache  --network host --build-arg KONAKART_VERSION=${KONAKART_VERSION} --build-arg JMX_EXPORTER_VERSION=${JMX_EXPORTER_VERSION} -t "chiabre/konakart_jmx_exporter:${KONAKART_VERSION}-${JMX_EXPORTER_VERSION}" .
docker push "chiabre/konakart_jmx_exporter:${KONAKART_VERSION}-${JMX_EXPORTER_VERSION}"


