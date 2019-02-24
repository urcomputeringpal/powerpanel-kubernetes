#!/bin/sh

cp -Lr /config/pwrstatd* /etc/
/usr/local/sbin/pwrstatd&

while true; do
  # TODO parse and send to pushgateway
  # https://github.com/prometheus/pushgateway#command-line
  /usr/local/sbin/pwrstat -status
  sleep 30
done
