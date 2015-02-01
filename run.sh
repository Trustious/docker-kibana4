#!/bin/bash

if [[ -z $KIBANA_PORT ]]; then
  echo "You must set the KIBANA_PORT environment variable"
  exit 1
fi

if [[ -z $ELASTICSEARCH_HOST ]]; then
  echo "You must set the ELASTICSEARCH_HOST environment variable"
  exit 1
fi

if [[ -z $ELASTICSEARCH_PORT ]]; then
  echo "You must set the ELASTICSEARCH_PORT environment variable"
  exit 1
fi

sed -i "/elasticsearch:/c\elasticsearch: \"http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT\"" /opt/$KIBANA_VERSION/config/kibana.yml
sed -i "/port:/c\port: $KIBANA_PORT" /opt/$KIBANA_VERSION/config/kibana.yml

/opt/kibana4/src/server/bin/kibana.sh
