#!/bin/sh

cp -Lr /config/pwrstatd* /etc/
/usr/local/sbin/pwrstatd &
pid=$!
trap "kill $pid; exit" TERM

while true; do
  sleep 10
  # TODO parse and send to pushgateway
  # https://github.com/prometheus/pushgateway#command-line
  /usr/local/sbin/pwrstat -status
  sleep 10 && sleep 10
done
