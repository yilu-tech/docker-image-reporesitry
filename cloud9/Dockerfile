FROM yilutech/ubuntu

ENV NODE_VERSION=v6.16.0

SHELL ["/bin/bash", "-c"]

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y curl build-essential g++ libssl-dev apache2-utils git libxml2-dev sshfs python vim tmux xz-utils \
 && cd /opt \
 && wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz \
 && tar xf node-${NODE_VERSION}-linux-x64.tar.xz \
 && mv node-${NODE_VERSION}-linux-x64 node-${NODE_VERSION}

ENV PATH_ORIGIN=$PATH
ENV PATH=$PATH:/opt/node-${NODE_VERSION}/bin

RUN git clone https://github.com/c9/core.git /cloud9 \
 && /cloud9/scripts/install-sdk.sh \
 && sed -i "s|127.0.0.1|0.0.0.0|g" /cloud9/configs/standalone.js \
 && source $NVM_DIR/nvm.sh \
 && rm -rf /cloud9/.git

