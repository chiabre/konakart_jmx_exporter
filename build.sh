#!/bin/bash

KONAKART_VERSION="9400_ce"
JMX_EXPORTER_VERSION="0.15.0"


for KONAKART_VERSION in "9200_ce" "9400_ce"
do
    docker build --network host --build-arg KONAKART_VERSION=${KONAKART_VERSION} --build-arg JMX_EXPORTER_VERSION=${JMX_EXPORTER_VERSION} -t "chiabre/konakart_jmx_exporter:${KONAKART_VERSION}-${JMX_EXPORTER_VERSION}" .
    docker push "chiabre/konakart_jmx_exporter:${KONAKART_VERSION}-${JMX_EXPORTER_VERSION}"
done


