FROM java:7

ENV NODE_VERSION v0.10.36

RUN    git clone https://github.com/elasticsearch/kibana.git /opt/kibana4 \
    && export NODE_FULL_NAME=node-$NODE_VERSION-linux-x64 \
    && wget -O /tmp/$NODE_FULL_NAME.tar.gz http://nodejs.org/dist/$NODE_VERSION/$NODE_FULL_NAME.tar.gz \
    && tar -zxvf /tmp/$NODE_FULL_NAME.tar.gz -C /tmp \
    && mv /tmp/$NODE_FULL_NAME /opt/kibana4/node \
    && rm /tmp/$NODE_FULL_NAME.tar.gz

ADD ./kibana.yml /opt/kibana4/src/server/config/kibana.yml
ADD ./run.sh /usr/bin/run.sh
RUN chmod u+x /usr/bin/run.sh

CMD ["/usr/bin/run.sh"]
