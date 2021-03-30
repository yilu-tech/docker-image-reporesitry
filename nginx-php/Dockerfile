FROM yilutech/cloud9:node-6

RUN apt-get update \
 && apt-get install -y nginx \
                       cron \
                       less \
                       git \
                       logrotate \
                       php7.4 \
                       php7.4-fpm \
                       php7.4-bcmath \
                       php7.4-curl \
                       php7.4-gd \
                       php7.4-gmp \
                       php7.4-mbstring \
                       php7.4-mysql \
                       php7.4-xml \
                       php7.4-zip \
                       unzip \

 && cd /var/log/nginx && rm * && ln -s /dev/stdout access.log && ln -s /dev/stderr error.log \
 && rm -rf /etc/nginx/sites-* \

 && wget https://getcomposer.org/composer-1.phar -qO /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
 && sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php/7.4/fpm/php-fpm.conf \
 && sed -i "s|listen = \/run\/php\/php7.4-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.4/fpm/pool.d/www.conf \
 && sed -i "s|weekly|daily|g" /etc/logrotate.d/php7.4-fpm \
 && sed -i "s|compress|nocompress|g" /etc/logrotate.d/php7.4-fpm \
 && sed -i "s|12|30|g" /etc/logrotate.d/php7.4-fpm \

 && echo '#!/bin/bash' > /startup.sh \
 && echo 'service php7.4-fpm start' >> /startup.sh \
 && echo "nginx -g 'daemon off;'" >> /startup.sh \

 && mkdir -p /apps

COPY nginx-php/nginx.conf /root/nginx.conf

WORKDIR /apps
EXPOSE 88 80 9000
CMD ['bash', '/startup.sh']
