FROM yilutech/ubuntu as buildc9

ENV NODE_VERSION=v6.16.0
ENV PATH=$PATH:/opt/node-v6/bin

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential g++ libssl-dev apache2-utils git libxml2-dev sshfs python \
 && cd /opt \
 && wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz -q \
 && tar xf node-${NODE_VERSION}-linux-x64.tar.xz \
 && mv node-${NODE_VERSION}-linux-x64 node-v6 \

 && git clone https://github.com/c9/core.git --depth=1 /cloud9 \
 && /cloud9/scripts/install-sdk.sh \
 && sed -i "s|127.0.0.1|0.0.0.0|g" /cloud9/configs/standalone.js

FROM yilutech/ubuntu

COPY --from=buildc9 /root/.c9 /root/.c9
COPY --from=buildc9 /cloud9 /cloud9
COPY --from=buildc9 /opt/node-v6 /opt/node-v6

COPY cloud9/ecosystem.config.js /ecosystem.config.js

ENV NODE_VERSION=v6.16.0
ENV PATH=$PATH:/opt/node-v6/bin

RUN npm install -g pm2@3.5.1

CMD ["pm2-runtime", "start", "/ecosystem.config.js"]
