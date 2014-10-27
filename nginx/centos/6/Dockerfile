# Nginx

FROM centos:centos6

MAINTAINER "name" <mailaddress>

# clean up
RUN yum -y upgrade; yum -y update; yum clean all

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN chmod 0644 /etc/yum.repos.d/nginx.repo

RUN yum install -y nginx

RUN yum clean all

ADD nginx.conf /etc/nginx/nginx.conf

ADD default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["service", "nginx", "start"]
