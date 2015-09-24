FROM centos:latest
MAINTAINER Raymond Otto <otto@digiwhite.nl>

RUN rpm -Uvh http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum install -y npm nodejs-ip git make newrelic-sysmond && \
    yum -y update && \
    yum clean all

#ADD ssh-git /root/.ssh/ssh-git
#RUN chmod 600 /root/.ssh/ssh-git

ADD nodejs-wrapper /usr/bin/nodejs-wrapper
ADD nodejs-git /usr/bin/nodejs-git

ENV TZ=Europe/Amsterdam

CMD [ "/usr/bin/nodejs-wrapper" ]
