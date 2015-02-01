FROM java:7

RUN git clone https://github.com/elasticsearch/kibana.git /opt/kibana4

ADD ./kibana.yml /opt/kibana4/src/server/config/kibana.yml
ADD ./run.sh /usr/bin/run.sh
RUN chmod u+x /usr/bin/run.sh

CMD ["/usr/bin/run.sh"]
