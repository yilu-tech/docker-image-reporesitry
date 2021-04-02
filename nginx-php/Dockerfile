FROM yilutech/phpfpm:7.4

RUN apt-get update \
 && apt-get install -y nginx \
                       cron \
                       less \
                       rsync \
                       openssh-server \
                       openssh-sftp-server \
 
 && cd /var/log/nginx && rm * && ln -s /dev/stdout access.log && ln -s /dev/stderr error.log \
 && rm -rf /etc/nginx/sites-* \

 && sed -i "s|post_max_size = [0-9a-zA-Z]*|post_max_size = 20M|g" /etc/php/7.4/fpm/php.ini \
 && sed -i "s|upload_max_filesize = [0-9a-zA-Z]*|upload_max_filesize = 20M|g" /etc/php/7.4/fpm/php.ini \

 && echo '#!/bin/bash' > /startup.sh \
 && echo 'service ssh start' >> /startup.sh \
 && echo 'service php7.4-fpm start' >> /startup.sh \
 && echo "nginx -g 'daemon off;'" >> /startup.sh \

 && mkdir -p /apps

COPY nginx-php/nginx.conf /etc/nginx/nginx.conf

WORKDIR /apps
EXPOSE 22 88 80 9000
CMD ['bash', '/startup.sh']
