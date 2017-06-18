FROM dhagberg/co811-java:latest
MAINTAINER D. J. Hagberg <dhagberg@millibits.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_VERS=7.0.78
ENV TOMCAT_SHA1=3da1860dda1c5ac06292846730a1f39a1aeb616a
ENV TINI_VERS=0.14.0
ENV TINI_SHA1=07e56dfb14c5237ca92c2a5244809a2cc2be6ad7
ENV PATH $CATALINA_HOME/bin:$PATH

COPY build/ /root/build/
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN /root/build/build_tomcat7 $BUILDTS

USER tomcat
EXPOSE 8080
CMD exec /usr/bin/tini $CATALINA_HOME/bin/catalina.sh run
