FROM yilutech/cloud9:node-6

RUN apt-get update  \
 && apt-get install --no-install-recommends -y gnupg2 git openssh-client \
 && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main " >> /etc/apt/sources.list \
 && echo "deb-src http://ppa.launchpad.net/ondrej/php/ubuntu focal main " >> /etc/apt/sources.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 14AA40EC0831756756D7F66C4F4EA0AAE5267A6C \
 && apt-get update \
 && apt-get install -y php8.0-cli \
                       php8.0-curl \
                       php8.0-dom \
                       php8.0-mbstring \
                       php8.0-swoole \
                       php8.0-zip \

 && curl --output /usr/local/bin/composer https://getcomposer.org/download/latest-2.x/composer.phar \
 && chmod +x /usr/local/bin/composer \

 && mkdir -p -m 700 /root/.ssh \
 && echo "StrictHostKeyChecking=no" > /root/.ssh/config \

 && apt-get purge -y --auto-remove gnupg2 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /apps
 
