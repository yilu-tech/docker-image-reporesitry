FROM nginx:1.16-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx-logrotate /root/nginx-logrotate
COPY startup /

RUN addgroup -g 82 -S www-data \
 && adduser -u 82 -D -S -G www-data www-data \
 && apk add logrotate \
 && mv -f /root/nginx-logrotate /etc/logrotate.d/nginx \
 && mkdir -p /apps \
 && chmod +x /startup

CMD ["/startup"]
