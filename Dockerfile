FROM java:7

ENV KIBANA_VERSION kibana-4.0.0-beta3

RUN    wget -O /tmp/$KIBANA_VERSION.tar.gz https://download.elasticsearch.org/kibana/kibana/$KIBANA_VERSION.tar.gz \
    && tar -zxvf /tmp/$KIBANA_VERSION.tar.gz -C /opt \
    && rm /tmp/$KIBANA_VERSION.tar.gz

ADD ./kibana.yml /opt/$KIBANA_VERSION/config/kibana.yml
