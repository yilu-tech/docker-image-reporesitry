FROM node:14-alpine

RUN apk update \
 && apk add python2 gcc g++ make git less bash openssh-client rsync python2 \
 && npm config set unsafe-perm true \
 && npm config set registry https://registry.npm.taobao.org \
 && npm install -g pm2

