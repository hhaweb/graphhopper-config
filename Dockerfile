FROM openjdk:8-jdk-alpine
EXPOSE 8995:8995
RUN mkdir "/app"
WORKDIR /app

ADD http://192.168.1.138:7700/static/malaysia-singapore-brunei-latest.osm.pbf /app

ADD https://github.com/graphhopper/graphhopper/releases/download/5.3/graphhopper-web-5.3.jar /app

COPY config.yml /app

ENTRYPOINT ["java","-Xmx3G","-Ddw.graphhopper.datareader.file=malaysia-singapore-brunei-latest.osm.pbf","-jar","graphhopper-web-5.3.jar","server","config.yml"]
