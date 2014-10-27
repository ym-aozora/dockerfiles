# Maria DB

FROM name/centos7

MAINTAINER "name" <mailaddress>

# clean up
RUN yum -y upgrade; yum -y update; yum clean all

RUN yum install -y mariadb mariadb-server

RUN yum clean all

RUN mysql_install_db --user=mysql

ADD master.cnf /etc/my.cnf.d/master.cnf

ADD mariadb.sh /root/mariadb.sh

RUN chmod +x /root/mariadb.sh

RUN /root/mariadb.sh

EXPOSE 3306

CMD ["mysqld_safe"]
