FROM centos:7

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN \
  yum -y install nginx && \
  yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
  yum -y install https://repo.ius.io/ius-release-el7.rpm && \
  yum -y install git224 && \
  yum -y install php7lu-fpm php7lu-cli php7lu-mysqlnd php7lu-soap \
  php7lu-xml php7lu-zip php7lu-json php7lu-mcrypt php7lu-mbstring php7lu-gd \
  --enablerepo=ius && yum clean all

EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

COPY index.php /var/www/html/index.php

RUN chmod +x /start.sh

CMD /start.sh
