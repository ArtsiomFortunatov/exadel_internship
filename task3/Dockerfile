FROM centos:7

RUN yum -y install httpd 
WORKDIR /var/www/html
COPY ./forhttpd/index.html .
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
ARG NAME=ArtsiomFortunatov
ENV DEVOPS=$NAME
RUN  echo $DEVOPS >> index.html
 