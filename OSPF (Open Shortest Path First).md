---
id: rc0jvzl19bk32sxuk8twkue
title: OSPF (Open Shortest Path First)
desc: ''
updated: 1667399378673
created: 1667399378673
---

## About
OSPF is an intra domain routing protocol

OSPF provides two services
    
    1. learn about each subnet
    2. find the shortest path to each other subnet

> Note that this means that OSPF is only used intra domain

## Algorithm

1. all routers start with their immediate neighbors known
> note that this is not the same as knowing what network goes to these routers, only that you can send data to their MAC address
2. The router then generates an LSA packet and broadcasts it to all neighbors
3. When recieving an LSA packet, the routers forward that packet outwords to the network.
4. This information is mapped into a graph of the router network.
5. Run Dikstras algorithm to find the shortest path to each router.


### LSA Packet

short for link state advertisement

this packet holds the imeddiate devices that the current router is connected to. 
> Or equivilently the **starting** information of the router.
