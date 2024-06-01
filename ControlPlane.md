---
id: kbikqod75iz1kq48vaims1r
title: ControlPlane
desc: ''
updated: 1665416583948
created: 1665416198864
---

## About
this is a software component of a router that focuses entierly on network-wide logic

basically this is all about talking to other routers and generating a routing map

there are two different ways to do this (currently)

1. traditional routing algorithms
2. Software defined routing networks (SDN)

## Per router control Plane

**EVERY** router keeps a rounting table

this has LOTS of overhead, which tends to make the network slower

## Logically centralized control plane

routers forward to the central point where a control plane exists


the idea here is to seperate the control plane and the data plane

basically, the routers forward data to a master routing table

> this is new, the idea came in about 15 years ago, there are very few orginizations that use this

some use both, but usually they don't just use SDN

> these have not been fully tested yet and have a lot of security issues

basically, at the time of writting this is cutting edge


