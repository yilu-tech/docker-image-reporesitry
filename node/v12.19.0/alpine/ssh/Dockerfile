FROM yilutech/node:12-alpine

RUN apk update \
 && apk add openssh-server openssh-sftp-server \
 && sed -i "s|root:\!|root:|g" /etc/shadow
