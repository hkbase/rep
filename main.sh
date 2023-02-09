#!/bin/bash
cp -f ./config.yaml /tmp/config.yaml
sed -i "s|PASSWORD|${PASSWORD}|g;s|WSPATH|${WSPATH}|g" /tmp/config.yaml
PATH_IN_LINK=$(echo ${WSPATH} | sed "s|\/|\%2F|g")
echo trojan://"${PASSWORD}@${REPL_SLUG}.${REPL_OWNER}.repl.co:443?security=tls&type=ws&path=${PATH_IN_LINK}#Replit" >/tmp/link
echo "请使用v2rayNg扫描下方二维码："
qrencode -t ansiutf8 < /tmp/link
wget -qO /tmp/geosite.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat 
wget -qO /tmp/geoip.dat https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
dnsproxy -l 127.0.0.1 -p 53 -u tls://8.8.4.4 -u tcp://8.8.8.8 -u tcp://8.8.4.4 --all-servers -r 0 --cache --cache-optimistic --cache-min-ttl=7200 --ipv6-disabled -o /dev/null &
chmod +x xray
/home/runner/${REPL_SLUG}/xray run -c /tmp/config.yaml
while true; do
curl https://${REPL_SLUG}.${REPL_OWNER}.repl.co;sleep 300
done
