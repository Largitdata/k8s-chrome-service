#!/bin/sh

netstat -na|grep 0.0.0.0:9515
if [ $? -ne 0 ];
then
    echo "chromedriver is not running.." >>/dev/stderr
    exit 100
fi
