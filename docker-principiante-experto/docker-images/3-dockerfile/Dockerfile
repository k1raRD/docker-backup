FROM centos

LABEL version=1.0
LABEL description="This is an apache image"
LABEL vendor=yo

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install httpd -y

WORKDIR /var/www/html

COPY gifs-app .
# ADD pipes-app /var/www/html

ENV contenido prueba

EXPOSE 8080

RUN echo "$contenido" > /var/www/html/prueba.html

RUN echo "$(whoami)" > /var/www/html/user1.html

VOLUME /var/www/html

RUN useradd k1rard
RUN chown k1rard:k1rard /var/www/html/user1.html

USER k1rard

RUN echo "$(whoami)" >> /var/www/html/user1.html

USER root

CMD apachectl -DFOREGROUND
