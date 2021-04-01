FROM yilutech/cloud9:node-6

RUN apt-get update \
 && apt-get install -y software-properties-common \
 && add-apt-repository ppa:ondrej/php \
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

 && wget https://getcomposer.org/composer-2.phar -qO /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \

 && wget https://github.com/spiral/roadrunner/releases/download/v2.0.0-RC.2/roadrunner-2.0.0-RC.2-linux-amd64.tar.gz \
 && tar zxf roadrunner-2.0.0-RC.2-linux-amd64.tar.gz \
 && mv roadrunner-2.0.0-RC.2-linux-amd64/rr /usr/local/bin/ \
 && rm -rf roadrunner-2.0.0-RC.2-linux-amd64* \

 && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
 && sed -i "s|;daemonize = yes|daemonize = no|g" /etc/php/7.4/fpm/php-fpm.conf \
 && sed -i "s|listen = \/run\/php\/php7.4-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.4/fpm/pool.d/www.conf \
 && sed -i "s|weekly|daily|g" /etc/logrotate.d/php7.4-fpm \
 && sed -i "s|compress|nocompress|g" /etc/logrotate.d/php7.4-fpm \
 && sed -i "s|12|30|g" /etc/logrotate.d/php7.4-fpm \
 && apt-get autoremove -y software-properties-common
