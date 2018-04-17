#!/bin/ash

gfwlist2dnsmasq -file /etc/dnsmasq.d/dnsmasq.servers.conf

adb2dnsmasq -save.mode "t" -save.path "/etc/dnsmasq.d/dnsmasq.adb.conf"

if [ -z "$DNSMASQ_DNS_SERVER" ]; then
	export DNSMASQ_DNS_SERVER=114.114.114.114
fi

if [ ! -f /etc/dnsmasq.resolv.conf ]; then
	echo "nameserver $DNSMASQ_DNS_SERVER" >> /etc/dnsmasq.resolv.conf
fi

sed -i 's/#resolv-file=/resolv-file=\/etc\/dnsmasq.resolv.conf/' /etc/dnsmasq.conf

exec "$@"
