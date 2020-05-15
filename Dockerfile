FROM dhagberg/co811-java:latest
MAINTAINER D. J. Hagberg <dhagberg@millibits.com>

ENV CATALINA_HOME /usr/local/tomcat
ENV TOMCAT_VERS=7.0.103
ENV TOMCAT_SHA5=3a02bf074fd5a00e751b1229cffdf7c7d9ee52ab825ddecb1e5b766d40999f08be5d3758704333a922c593b139bce51feb8b33924731aacf3acebba8beb5cce8
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
