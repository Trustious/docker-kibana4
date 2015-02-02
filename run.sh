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

sed -i "/elasticsearch_url:/c\elasticsearch_url: \"http://$ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT\"" /opt/kibana4/config/kibana.yml
sed -i "/port:/c\port: $KIBANA_PORT" /opt/kibana4/config/kibana.yml

/opt/kibana4/bin/kibana
