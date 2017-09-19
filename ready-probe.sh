#!/bin/sh

CNT=`ps -ef|grep chrome|egrep -v "chromedriver|grep"|wc -l`
if [ "$CNT" -gt "20" ];
then
    echo "Too many chrome process are running.."
    exit 100
fi
