FROM dhagberg/co811-java:latest
MAINTAINER D. J. Hagberg <dhagberg@millibits.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_VERS=7.0.84
ENV TOMCAT_SHA1=e2940f45dde581741e2639e831d08498b6bb9d3a
ENV TINI_VERS=0.16.1
ENV TINI_SHA1=fb3f618fb0493abf49478e7904b8364ae92ee666
ENV PATH $CATALINA_HOME/bin:$PATH

COPY build/ /root/build/
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN /root/build/build_tomcat7 $BUILDTS

USER tomcat
EXPOSE 8080
CMD exec /usr/bin/tini $CATALINA_HOME/bin/catalina.sh run
