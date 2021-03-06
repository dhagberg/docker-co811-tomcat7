FROM dhagberg/co811-java:latest
MAINTAINER D. J. Hagberg <dhagberg@millibits.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_VERS=7.0.105
ENV TOMCAT_SHA5=3760fe510fbe2e3fcc1e5533b293b98c73458467277c59b04961330f0695bdccd35131b3b1112a3022a0ca7467ac916e99ca869758db1ac2d9c759ca1d6f33d0
ENV TINI_VERS=0.19.0
ENV TINI_SHA5=3de06fb0a8a1fdc06f48c1933b474c965242292a02b8fa0bb85fe90678c33bb35962ab239dd7000f8bcae841045d6660bbd6846414b0a07982c4dbfb2c2bd1cc
ENV PATH $CATALINA_HOME/bin:$PATH

COPY build/ /root/build/
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

RUN /root/build/build_tomcat7 $BUILDTS

USER tomcat
EXPOSE 8080
CMD exec /usr/bin/tini $CATALINA_HOME/bin/catalina.sh run
