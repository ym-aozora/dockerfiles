# CentOS 7 base image

FROM centos:centos7

MAINTAINER "name" <mailaddress>

ENV container docker

# fakesystemd -> systemd
RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs

# clean up
RUN yum -y upgrade; yum -y update; yum clean all

# delete unnecessary system
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done)
RUN rm -f /lib/systemd/system/multi-user.target.wants/*
RUN rm -f /etc/systemd/system/*.wants/*
RUN rm -f /lib/systemd/system/local-fs.target.wants/*
RUN rm -f /lib/systemd/system/sockets.target.wants/*udev*
RUN rm -f /lib/systemd/system/sockets.target.wants/*initctl*
RUN rm -f /lib/systemd/system/basic.target.wants/*
RUN rm -f /lib/systemd/system/anaconda.target.wants/*

# mount
VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
