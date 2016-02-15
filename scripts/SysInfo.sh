#!/bin/sh
ip_=`ip a | grep inet | grep -v 127.0.0.1 | grep -v inet6 | awk '{print $2}'`

echo "IP adress" ${ip_};
