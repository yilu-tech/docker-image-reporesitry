FROM yilutech/cloud9:node-6

ENV NODE_VERSION=v14.16.1
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/node-v14/bin

RUN cd /opt \
 && wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz -q \
 && tar xf node-${NODE_VERSION}-linux-x64.tar.xz \
 && mv node-${NODE_VERSION}-linux-x64 node-v14 \
 && rm node-${NODE_VERSION}-linux-x64.tar.xz \
 && npm install -g pm2@4.1.2  \
 && rm /opt/node-v6/bin/pm2* \
 && rm -rf /opt/node-v6/lib/node_modules/pm2 \
 && apt update && apt install -y git \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["pm2-runtime", "start", "/ecosystem.config.js"]
