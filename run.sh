#!/bin/bash

if [[ -z $KIBANA_PORT ]]; then
  export KIBANA_PORT="5601"
fi

if [[ -z $ELASTICSEARCH_HOST ]]; then
  export ELASTICSEARCH_HOST="localhost"
fi

if [[ -z $ELASTICSEARCH_PORT ]]; then
  export ELASTICSEARCH_PORT="9200"
fi

sed -i "/elasticsearch:/c\elasticsearch: \"http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT\"" /opt/$KIBANA_VERSION/config/kibana.yml
sed -i "/port:/c\port: $KIBANA_PORT" /opt/$KIBANA_VERSION/config/kibana.yml

/opt/$KIBANA_VERSION/bin/kibana
