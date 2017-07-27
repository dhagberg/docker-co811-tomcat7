FROM dhagberg/co811-java:latest
MAINTAINER D. J. Hagberg <dhagberg@millibits.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_VERS=7.0.79
ENV TOMCAT_SHA1=88555e45b3c8dc75a8d51ae3878f1999ea586c01
ENV TINI_VERS=0.15.0
ENV TINI_SHA1=aaa143f6780d51d79ffb504c41d5c92225c51fff
ENV PATH $CATALINA_HOME/bin:$PATH

COPY build/ /root/build/
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN /root/build/build_tomcat7 $BUILDTS

USER tomcat
EXPOSE 8080
CMD exec /usr/bin/tini $CATALINA_HOME/bin/catalina.sh run
