FROM docker.elastic.co/beats/filebeat:7.13.2

MAINTAINER xxm1995@outlook.com

COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
USER filebeat