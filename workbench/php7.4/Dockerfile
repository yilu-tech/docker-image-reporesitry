FROM yilutech/ubuntu

RUN apt-get update \
 && apt-get install -y nginx git less cron vim zsh \
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
                       php-redis \
                       unzip \
                       openssh-server \
                       openssh-sftp-server \

 && git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
 && cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc \
 && sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="yilu"|' /root/.zshrc \

 && wget https://getcomposer.org/composer-stable.phar -qO /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
 && sed -i "s|listen = \/run\/php\/php7.4-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.4/fpm/pool.d/www.conf \

 && cd /var/log/nginx && rm * && ln -s /dev/stdout access.log && ln -s /dev/stderr error.log \
 && sed -i '/*.conf;/a\    include /workspace/*/*/nginx.conf;' /etc/nginx/nginx.conf \

 && mkdir -p /workspace \

 && echo '#!/bin/bash' > /startup.sh \
 && echo 'service ssh start' >> /startup.sh \
 && echo 'service php7.4-fpm start' >> /startup.sh \
 && echo "nginx -g 'daemon off;'" >> /startup.sh

COPY workbench/php7.4/yilu.zsh-theme /root/.oh-my-zsh/themes/yilu.zsh-theme
COPY workbench/php7.4/nginx.conf /etc/nginx/nginx.conf
WORKDIR /workspace
EXPOSE 22 80

CMD ["bash", "/startup.sh"]

