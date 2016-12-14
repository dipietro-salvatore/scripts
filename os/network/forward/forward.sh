#!/bin/bash

if [ $USER != "root" ]
then
   echo "Execute as root!!!!"
   exit 1
fi


if [ $# -ne 2 ]
then
    echo -e "Insert the IP address and the interface\nEx.  $0 192.168.1.1/24 eth0"
    exit 1
fi

NEWDEV=$2:0
DEV=$2
IP=$1

ifconfig $NEWDEV $IP
ifconfig $NEWDEV
echo 1 >/proc/sys/net/ipv4/ip_forward
iptables -F
iptables -t nat -A POSTROUTING -o $DEV -j MASQUERADE
iptables -A FORWARD -i $DEV -o $NEWDEV -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i $NEWDEV -o $DEV -j ACCEPT
iptables -L


exit 0
