---
id: 5md3ulbij83mw620zv5ox93
title: Flow Control
desc: ''
updated: 1665412949905
created: 1665412867613
---

## About
in general the server constantly sends 
the amount of remaining space over to 
the client who updtes the amount of data that they send based on this amount and the amount they sent in transit.

![alt](./assets/images/tcp_send_recv_window.svg)


the rwnd (recive window) simply contains the amount of bytes that are free in the reciver buffer.

