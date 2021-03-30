FROM yilutech/phpfpm:7.4

RUN apt-get update \
 && apt-get install -y nginx \
                       cron \
                       less \
 
 && cd /var/log/nginx && rm * && ln -s /dev/stdout access.log && ln -s /dev/stderr error.log \
 && rm -rf /etc/nginx/sites-* \

 && echo '#!/bin/bash' > /startup.sh \
 && echo 'service php7.4-fpm start' >> /startup.sh \
 && echo "nginx -g 'daemon off;'" >> /startup.sh \

 && mkdir -p /apps

COPY nginx-php/nginx.conf /root/nginx.conf

WORKDIR /apps
EXPOSE 88 80 9000
CMD ['bash', '/startup.sh']
