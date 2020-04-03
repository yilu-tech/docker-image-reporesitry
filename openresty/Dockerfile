FROM yilutech/cloud9:ubuntu

COPY nginx-logrotate /root/nginx-logrotate

RUN apt-get update \
 && apt-get install -y wget gnupg2 \
 && wget -qO - https://openresty.org/package/pubkey.gpg | apt-key add - \
 && apt-get -y install software-properties-common \
 && add-apt-repository -y "deb http://openresty.org/package/ubuntu $(lsb_release -sc) main" \
 && apt-get update \
 && apt-get -y install openresty logrotate \
 && mv /root/nginx-logrotate /etc/logrotate.d/nginx \
 && mkdir -p /var/log/nginx
