FROM registry.cn-beijing.aliyuncs.com/xxm1995/java8

MAINTAINER xxm1995@outlook.com

ENV TZ=Asia/Shanghai
ENV JAVA_OPTS="-Xms256m -Xmx1G -XX:+UseG1GC -Djava.security.egd=file:/dev/./urandom"

RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /

EXPOSE 8080

ADD bootx-start/target/bootx-start.jar bootx-start.jar

CMD java $JAVA_OPTS -jar bootx-start.jar --spring.profiles.active=demo