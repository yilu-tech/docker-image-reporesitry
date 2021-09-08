FROM yilutech/ubuntu:20.04

RUN apt-get update \
 && apt-get install -y software-properties-common \
 && add-apt-repository ppa:ondrej/php \
 && apt-get install -y nginx git less cron vim \
                       php-pear \
                       php8.0-dev \
                       php8.0-xdebug \
                       php8.0-bcmath \
                       php8.0-curl \
                       php8.0-xml \
                       php8.0-gd \
                       php8.0-gmp \
                       php8.0-igbinary \
                       php8.0-mbstring \
                       php8.0-mysql \
                       php8.0-redis \
                       php8.0-zip \
                       php8.0-fpm \
                       unzip \
                       openssh-server \
                       openssh-sftp-server \

 && bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)" \
 && sed -i 's|OSH_THEME="font"|OSH_THEME="minimal"|' /root/.bashrc \

 && wget https://getcomposer.org/composer-1.phar -qO /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
 && sed -i "s|listen = \/run\/php\/php8.0-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.0/fpm/pool.d/www.conf \

 && cd /var/log/nginx && rm * && ln -s /dev/stdout access.log && ln -s /dev/stderr error.log \
 && apt-get autoremove -y software-properties-common \

 && mkdir -p /workspace \

 && echo '#!/bin/bash' > /startup.sh \
 && echo 'service ssh start' >> /startup.sh \
 && echo 'service php8.0-fpm start' >> /startup.sh \
 && echo "nginx -g 'daemon off;'" >> /startup.sh

COPY workbench/php8.0/nginx.conf /etc/nginx/nginx.conf
WORKDIR /workspace
EXPOSE 22 80 9000

CMD ["bash", "/startup.sh"]

