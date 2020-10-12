FROM golang:1.14.9-alpine

COPY nvim_init.sh /

RUN apk add -U bash \
 && sed -i "s|http|https|g" /etc/apk/repositories \
 && sed -i "s|dl-cdn.alpinelinux.org|mirrors.aliyun.com|g" /etc/apk/repositories \
 && mkdir -p /root/go

ENV GOPATH=/root/go GOPROXY="https://goproxy.io/,direct" GO111MODULE=auto
ENV PATH=$PATH:$GOPATH/bin

WORKDIR /root/go
