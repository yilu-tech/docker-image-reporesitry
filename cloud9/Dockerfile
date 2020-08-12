FROM yilutech/ubuntu as buildc9

ENV C9_NODE_VERSION=v6.16.0

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential g++ libssl-dev apache2-utils git libxml2-dev sshfs python \
 && cd /opt \
 && wget https://nodejs.org/dist/${C9_NODE_VERSION}/node-${C9_NODE_VERSION}-linux-x64.tar.xz \
 && tar xf node-${C9_NODE_VERSION}-linux-x64.tar.xz \
 && mv node-${C9_NODE_VERSION}-linux-x64 node-${C9_NODE_VERSION}

ENV PATH_ORIGIN=$PATH
ENV PATH=$PATH:/opt/node-${C9_NODE_VERSION}/bin

RUN git clone https://github.com/c9/core.git --depth=1 /cloud9 \
 && /cloud9/scripts/install-sdk.sh \
 && sed -i "s|127.0.0.1|0.0.0.0|g" /cloud9/configs/standalone.js

FROM yilutech/ubuntu

COPY --from=buildc9 /root/.c9 /root/
COPY --from=buildc9 /cloud9 /
COPY --from=buildc9 /opt/node-${C9_NODE_VERSION} /opt/

ENV NODE_VERSION=v12.18.3

RUN wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz \
 && tar xf node-${NODE_VERSION}-linux-x64.tar.xz \
 && mv node-${NODE_VERSION}-linux-x64 node-${NODE_VERSION} \
 && rm node-${NODE_VERSION}-linux-x64.tar.xz

ENV PATH=$PATH_ORIGIN:/opt/node-{NODE_VERSION}/bin

RUN npm install -g pm2
