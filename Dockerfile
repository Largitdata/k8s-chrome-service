FROM largitdata/chrome-headless:latest
MAINTAINER jznight "jznight@gmail.com"


RUN apk update && \
    apk add nodejs nodejs-npm nfs-utils && \
    mkdir /box && \
    npm install -g pm2 && \
    pm2 install pm2-logrotate && \
    pm2 set pm2-logrotate:max_size 10M && \
    pm2 set pm2-logrotate:compress true && \
    pm2 set pm2-logrotate:retain 7 && \
    pm2 set pm2-logrotate:rotateInterval '0 0 * * *' && \
    pm2 restart pm2-logrotate

COPY ./probe.sh ./ready-probe.sh /
EXPOSE 9515
