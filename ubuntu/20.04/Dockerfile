FROM ubuntu:20.04

COPY ubuntu/20.04/.bash_profile /root/.bash_profile

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y curl wget vim tmux xz-utils locales tzdata \
 && locale-gen en_US.UTF-8 \
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && apt-get autoremove -y \
 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

