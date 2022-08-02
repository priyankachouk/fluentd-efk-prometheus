#!/bin/bash
/usr/bin/mkdir /logs
ln -sf /dev/stdout /logs/latest.log
while true;
do
        /usr/bin/date >> /logs/latest.log
        sleep 60

done
