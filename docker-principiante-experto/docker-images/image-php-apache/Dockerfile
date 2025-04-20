FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN \
  yum install -y httpd php php-cli php-common mod_ssl openssl

RUN echo "<?php phpinfo(); ?>" > /var/www/html/hola.php

COPY gifs-app /var/www/html

COPY docker.crt /localhost.crt

COPY docker.crt /etc/pki/tls/certs/localhost.crt

COPY docker.key /localhost.key

COPY docker.key /etc/pki/tls/private/localhost.key

COPY ssl.conf /etc/httpd/conf.d/default.conf

EXPOSE 443

CMD apachectl -DFOREGROUND
