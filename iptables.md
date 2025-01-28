---
id: o0iuzctxm2xcuwsg5pep96
title: iptables
desc: ''
updated: 1735784130
created: 1735784130
---
# iptables

## About

used in order to configure firewalls on linux

## targeting an ip address

you can target an ip address with the following information

> iptables -A <table> -s <ip> -j <action>


## using the state module

```bash
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
```

## targeting a port

you need to specify a protocol in order to target ports, an port target is bellow

```bash
iptables -A <TABLE> -p tcp --dport 22 -j ACCEPT
```

## using a linux pc as a router

[linuxRouting](./linuxRouting.md)
[linuxRouting](linuxRouting.md)

for more information
