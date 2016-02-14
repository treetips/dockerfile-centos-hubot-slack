FROM centos:6
MAINTAINER tree-tips <treetips555@gmail.com>

RUN yum -y update && \
    yum -y install epel-release sudo passwd && \
    yum -y install nodejs npm --enablerepo=epel && \
    yum clean all && \
    mkdir -p /opt/hubot && \
    useradd hubot && \
    echo "hubot" | passwd --stdin hubot && \
    chown hubot:hubot /opt/hubot && \
    echo "hubot	ALL=(ALL) 	ALL" >> /etc/sudoers

RUN npm install -g yo generator-hubot coffee-script hubot-slack

WORKDIR /opt/hubot
USER hubot
RUN yo hubot --force --no-insight --owner='tester' --name='bot' --description='hubot test' --adapter='slack' chdir=/opt/hubot

