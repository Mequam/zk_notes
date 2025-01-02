---
id: k6gxxkc8kjj8wcq8qubr94
title: linuxRouting
desc: ''
updated: 1735006978
created: 1735006978
---
# linuxRouting

## About

this note contains information on how to configure a linux system with more than one network
card how to route traffic between different networks :D

## Configuration

you don't route by default you have to enable it in the proc filesystem at

> echo 1 > /proc/sys/net/ipv4/ip\_forward

## Firewall

you then need to configure the firewall to route traffic from one network to the other

> iptables -L -v -n

will list off your current firewall


## Block based on mac address

> sudo iptables -A INPUT -m mac --mac-source 00:00:00:00:00:00 -j DROP


## Saving a configuration

> sudo iptables-save > ~/iptables.rules
> sudo iptables-restore < ~/iptables.rules


## nat routing
iptables --append FORWARD --in-interface eth0 -j ACCEPT
iptables --table nat --append POSTROUTING --out-interface wlo1 -j MASQUERADE

