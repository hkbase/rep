#!/bin/sh
cp -f ./config.yaml /tmp/config.yaml
sed -i "s|PASSWORD|${PASSWORD}|g;s|WSPATH|${WSPATH}|g" /tmp/config.yaml
PATH_IN_LINK=$(echo ${WSPATH} | sed "s|\/|\%2F|g")
echo trojan://"${PASSWORD}@${REPL_SLUG}.${REPL_OWNER}.repl.co:443?security=tls&type=ws&path=${PATH_IN_LINK}#Replit" >/tmp/link
echo "请使用v2rayNg客户端扫描下方二维码："
qrencode -t ansiutf8 < /tmp/link
xray run -c /tmp/config.yaml
