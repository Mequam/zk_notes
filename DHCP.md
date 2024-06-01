---
id: fwagmb47iggyq9ixpu023ah
title: DHCP
desc: ''
updated: 1666019360400
created: 1666019360400
---

## DHCP

> dynamic host configuration protocl

this is a protocol that dynamically hands out ip addresses to devices.

## Overviw

1. host boradcasts **DHCP discover** msg [optional]
1. DHCP server responds with **DHCP offer** msg [optional]
1. host requests IP address **DHCP request**
1. server sends the address **DHCP ack**

note that when a device **first** enters the network, we need to talk to the server but don't have an address!

there is a special address reserved for this [[0.0.0.0|Networking.NetworkLayer.Addressing.ipv4#neutral]] that the client uses for the source address to the special broadcast address [[255.255.255.255|Networking.NetworkLayer.Addressing.ipv4#broadcast]]

## protocol

### DHCP discover


client sends 

```c++
struct discover_packet {
    ipv4_addr src = "0.0.0.0";
    ipv4_addr dest = "255.255.255.255";
    ipv4_addr yiaddr = "0.0.0.0";
    int transaction_id = 124 //randomly chosen
};
```
### DHCP offer
server sends

```c++
struct offer_packet {
    ipv4_addr src = "223.1.2.5";
    ipv4_addr dest = "255.255.255.255";
    ipv4_addr yiaddr = "223.1.2.4";
    int transaction_id = 124; //same as before
    int lifetime = 1999; // seconds for this addres before change
}
```

### DHCP request
client sends

```c++
struct request_packet {
    ipv4_addr src = "0.0.0.0";
    ipv4_addr dest = "255.255.255.255";
    ipv4_addr yiaddr = "223.1.2.4";
    int transaction_id = 124; //same as before
    int lifetime = 1999; // seconds for this addres before change
};
```

### DHCP ack
server sends

```c++
struct ack_packet {
    ipv4_addr src = "223.1.2.5";
    ipv4_addr dest = "255.255.255.255";
    ipv4_addr yiaddr = "223.1.2.4";
    int transaction_id = 124; //same as before
    int lifetime = 1999; // seconds for this addres before change
}
```

## Remarks

dhcp also hands over the default gateway router to the client, the name of the DNS server and the network mask. This means it would be very fun to spoof the dhcp server :).
