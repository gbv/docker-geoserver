# docker-geoserver
Builds geoceg/geoserver, which is a Docker container containing Geoserver and Tomcat.

At Geo-CEG, we use Geoserver primarily as a front end for PostGIS.
Geoserver is a Java web app, so this container is built on Tomcat 9.

For complete information on Geoserver, see http://geoserver.org/

At the moment, geoserver release is 2.11.2.
To update it, edit the Dockerfile.

# Some useful commands

## Build and tag (-t) as geoceg/geoserver
docker build -t geoceg/geoserver .

## Run, with output to terminal (-t) or detached (-d)
````bash
docker run -t -p 8888:8080 --name=geoserver geoceg/geoserver
docker run -d -p 8888:8080 --name=geoserver geoceg/geoserver
````

## Shell access
docker exec -it geoserver /bin/bash

## Volumes

/usr/local/tomcat/webapps/geoserver/data