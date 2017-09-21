#!/bin/sh

CNT=`ps -ef|grep chrome.*proxy|egrep -v "chromedriver|grep"|wc -l`
if [ "$CNT" -gt "30" ];
then
    echo "Too many chrome processes are running.." >>/dev/stderr
    echo "restaring in 20 seconds.." >>/dev/stderr
    sleep 20
    exit 100
fi

CNT=`ps -ef|grep "\[chrome\]"|wc -l`
if [ "$CNT" -gt "5" ];
then
    echo "Too many zombie processes.." >>/dev/stderr
    CNT=`ps -ef|grep chrome.*proxy|egrep -v "chromedriver|grep"|wc -l`
    if [ "$CNT" -gt "1" ];
    then
        echo "restaring in 20 seconds.." >>/dev/stderr
        sleep 20
    fi
    exit 200
fi
