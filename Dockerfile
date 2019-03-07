FROM tomcat:9-jre8
MAINTAINER Brian H Wilson "brian@wildsong.biz"

ENV GEOSERVER_VERSION 2.15.0

# Expand the memory space for Tomcat
ENV CATALINA_OPTS "-Djava.awt.headless=true -Xmx768m -Xrs -XX:PerfDataSamplingInterval=500 -Dorg.geotools.referencing.forceXY=true -DGEOSERVER_DATA_DIR=${GEOSERVER_DATA_DIR}"

ADD https://sourceforge.net/projects/geoserver/files/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-war.zip/download /tmp/geoserver.war.zip

WORKDIR ${CATALINA_HOME}/webapps
RUN rm -f geoserver &&\
    unzip /tmp/geoserver.war.zip geoserver.war &&\
    rm /tmp/geoserver.war.zip

# When the container launches it starts Tomcat, which will deploy the WAR file.

WORKDIR ${CATALINA_HOME}