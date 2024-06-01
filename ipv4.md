---
id: m9i344kkpae3j9tr3ltl09w
title: ipv4
desc: ''
updated: 1666019080681
created: 1666019080681
---

## About

1pv4 is a 3d bit computer address

## Dotted Decimal Notation 

> also called DDN

we represent ipv4 addresses with 4 seperated nubmers seperated by .

example
> 127.0.0.1

each number can go up to 255 and represents a set of 1's and zeros in the 3d bit number.


## Assignment

how do devices get ip addresses?

either devices are hard coded,
they are given over [[Networking.NetworkLayer.Addressing.DHCP]]

typically a pool of valid ip addresses is handed out to an orginization by the ICANN (Internet Corporation for Assigned Names and Numbers), basically a central authority.

## Special Addresses 

### Neutral

0.0.0.0 used by [[Networking.NetworkLayer.Addressing.DHCP]] to indicate a non address host.

Basically a Neutral address that anyone can use.

### Broadcast 

255.255.255.255 indicates that we want to send our message to everyone on the network.
