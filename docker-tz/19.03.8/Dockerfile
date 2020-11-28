FROM docker:19.03.8

RUN sed -i "s|http|https|g" /etc/apk/repositories \
 && sed -i "s|dl-cdn.alpinelinux.org|mirrors.aliyun.com|g" /etc/apk/repositories \
 && apk update \
 && apk add tzdata curl \
 && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
