FROM nginx:1.19.3-alpine

COPY nginx/v1.19.3/nginx.conf /etc/nginx/nginx.conf
COPY nginx/v1.19.3/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/v1.19.3/nginx-logrotate /root/nginx-logrotate
COPY nginx/v1.19.3/startup /

RUN adduser -u 82 -D -S -G www-data www-data \
 && apk add logrotate \
 && mv -f /root/nginx-logrotate /etc/logrotate.d/nginx \
 && mkdir -p /apps \
 && chmod +x /startup

WORKDIR /apps

EXPOSE 80 443

CMD ["/startup"]
