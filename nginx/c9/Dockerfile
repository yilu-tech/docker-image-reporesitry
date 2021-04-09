FROM yilutech/cloud9:node-6

RUN apt-get update \
 && apt-get install -y nginx \
 && cd /var/log/nginx && rm * && ln -s /dev/stdout access.log && ln -s /dev/stderr error.log \
 && rm -rf /etc/nginx/sites-* \

 && echo '#!/bin/bash' > /startup.sh \
 && echo 'pm2 start /ecosystem.config.js'
 && echo "nginx -g 'daemon off;'" >> /startup.sh \

 && mkdir -p /apps

COPY nginx/c9/nginx.conf /etc/nginx/nginx.conf
