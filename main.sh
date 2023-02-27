#!/bin/bash
cp -f ./config.yaml /tmp/config.yaml
sed -i "s|PASSWORD|${PASSWORD}|g;s|WSPATH|${WSPATH}|g" /tmp/config.yaml
dnsproxy -l 127.0.0.1 -p 53 -u tls://8.8.4.4 -u tcp://8.8.8.8 -u tcp://8.8.4.4 --all-servers -r 0 --cache --cache-optimistic --cache-min-ttl=7200 --ipv6-disabled -o /dev/null &
xray run -c /tmp/config.yaml
