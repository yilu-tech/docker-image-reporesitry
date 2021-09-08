FROM node:12.19.0-alpine

RUN sed -i "s|dl-cdn.alpinelinux.org|mirrors.aliyun.com|g" /etc/apk/repositories \
 && sed -i "s|http|https|g" /etc/apk/repositories \
 && apk update \
 && apk add python2 gcc g++ make git less bash openssh-client rsync python2 \
 && npm config set unsafe-perm true \
 && npm config set registry https://registry.npm.taobao.org \
 && npm install -g pm2
