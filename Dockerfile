FROM largitdata/chrome-headless:latest
MAINTAINER jznight "jznight@gmail.com"

COPY ./probe.sh ./ready-probe.sh /
EXPOSE 9515
