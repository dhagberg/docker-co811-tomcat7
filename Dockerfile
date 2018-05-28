FROM dhagberg/co811-java:latest
MAINTAINER D. J. Hagberg <dhagberg@millibits.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_VERS=7.0.88
ENV TOMCAT_SHA1=88510a9b6d1ae7b0874763b565760fc11e2ea22b
ENV TINI_VERS=0.17.0
ENV TINI_SHA1=2982c04ac78279298ca31888683ad626d57c55af
ENV PATH $CATALINA_HOME/bin:$PATH

COPY build/ /root/build/
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN /root/build/build_tomcat7 $BUILDTS

USER tomcat
EXPOSE 8080
CMD exec /usr/bin/tini $CATALINA_HOME/bin/catalina.sh run
