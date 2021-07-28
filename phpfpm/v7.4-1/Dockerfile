FROM yilutech/ubuntu:20.04

ENV NODE_VERSION=v14.16.1
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/node-v12/bin

RUN apt-get update \
 && apt-get install -y git \
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

 && cd /opt \
 && wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz -q \
 && tar xf node-${NODE_VERSION}-linux-x64.tar.xz \
 && mv node-${NODE_VERSION}-linux-x64 node-v12 \
 && rm node-${NODE_VERSION}-linux-x64.tar.xz \
 && npm install -g pm2@4.1.2  \

 && wget https://getcomposer.org/composer-1.phar -qO /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
 && sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php/7.4/fpm/php-fpm.conf \
 && sed -i "s|listen = \/run\/php\/php7.4-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.4/fpm/pool.d/www.conf \
 && sed -i "s|weekly|daily|g" /etc/logrotate.d/php7.4-fpm \
 && sed -i "s|compress|nocompress|g" /etc/logrotate.d/php7.4-fpm \
 && sed -i "s|12|30|g" /etc/logrotate.d/php7.4-fpm
