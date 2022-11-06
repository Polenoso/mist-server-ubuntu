FROM ubuntu:18.04
MAINTAINER Polenoso

ARG MISTSERVER=https://r.mistserver.org/dl/mistserver_64V3.1.tar.gz

# install basics
RUN apt-get update
RUN apt-get install curl -y

RUN mkdir -p /media
RUN mkdir -p /app/mistserver

# install mistserver
RUN curl -o - ${MISTSERVER} | tar xvz -C /app/mistserver
RUN chmod +x /app/mistserver
ENTRYPOINT ["./app/mistserver/MistController"]

# clean up
#RUN apt-get clean
#RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME $PWD/Media /media
EXPOSE 4242 8080 1935 554