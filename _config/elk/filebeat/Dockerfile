FROM docker.elastic.co/beats/filebeat:7.13.2

MAINTAINER xxm

COPY filebeat.yml /usr/share/filebeat/filebeat.yml
USER root
RUN chown filebeat /usr/share/filebeat/filebeat.yml
USER filebeat