FROM java:7

ENV NODE_VERSION v0.10.36

#Install Dependencies
RUN    apt-get update \
    && apt-get install -y bzip2 zip \
    && apt-get clean

# Cloning kibana and Installing node
RUN    git clone https://github.com/elasticsearch/kibana.git /tmp/kibana4 \
    && wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.23.2/install.sh | bash \
    && export NVM_DIR="/root/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
    && nvm install 0.10 \
    && cd /tmp/kibana4 \
    && export KIBANA_VESION=`grep "version" package.json | sed 's/.*"version": "\(.*\)".*/\1/'` \
    && npm install -g grunt-cli bower \
    && npm install && bower --config.interactive=false install --allow-root \
    && grunt build \
    && mkdir /opt/kibana \
    && tar -zxvf ./target/kibana-$KIBANA_VESION-linux-x64.tar.gz -C /opt/kibana4 --strip-components=1 \
    && cd \
    && rm -R /tmp/kibana4


ADD ./kibana.yml /opt/kibana4/config/kibana.yml
ADD ./run.sh /usr/bin/run.sh
RUN chmod u+x /usr/bin/run.sh

CMD ["/usr/bin/run.sh"]
