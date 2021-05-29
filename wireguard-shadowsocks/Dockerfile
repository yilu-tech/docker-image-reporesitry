FROM yilutech/ubuntu:20.04

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wireguard \
    shadowsocks-libev \
    iptables \
    net-tools \
    iproute2 \
    iputils-ping \
    iptables \

 && echo '#!/bin/bash' >> /key-generate.sh \
 && echo 'cd /etc/wireguard' >> /key-generate.sh \
 && echo 'umask 077' >> /key-generate.sh \
 && echo 'wg genkey | tee privatekey | wg pubkey > publickey | wg genpsk > presharedkey' >> /key-generate.sh
