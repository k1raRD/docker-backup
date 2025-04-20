FROM centos

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install httpd -y

WORKDIR /var/www/html

COPY dist/gifs-app .
# ADD pipes-app /var/www/html

ENV contenido prueba

EXPOSE 8080

RUN echo "$contenido" > /var/www/html/prueba.html

CMD apachectl -DFOREGROUND
