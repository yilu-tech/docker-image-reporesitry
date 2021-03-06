FROM yilutech/cloud9:node-6

RUN apt-get update \
 && apt-get install -y software-properties-common \
 && add-apt-repository ppa:ondrej/php \
 && apt-get install -y git \
                       logrotate \
                       cron \
                       unzip \
                       php7.2 \
                       php7.2-fpm \
                       php7.2-bcmath \
                       php7.2-curl \
                       php7.2-xml \
                       php7.2-gd \
                       php7.2-gmp \
                       php7.2-mbstring \
                       php7.2-mcrypt \
                       php7.2-mysql \
                       php7.2-tokenizer \
                       php7.2-zip \
      
 && wget https://getcomposer.org/composer-1.phar -qO /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
 && sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php/7.2/fpm/php-fpm.conf \
 && sed -i "s|listen = \/run\/php\/php7.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.2/fpm/pool.d/www.conf \
 && sed -i "s|weekly|daily|g" /etc/logrotate.d/php7.2-fpm \
 && sed -i "s|compress|nocompress|g" /etc/logrotate.d/php7.2-fpm \
 && sed -i "s|12|30|g" /etc/logrotate.d/php7.2-fpm \
 && mkdir -p /run/php \
 && mkdir -m 700 -p /root/.ssh/ \
 && echo "StrictHostKeyChecking no" > /root/.ssh/config \
 && apt-get autoremove -y software-properties-common
