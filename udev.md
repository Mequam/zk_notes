---
id: s10lszh3ctq0d2zp0ry7o35
title: udev
desc: ''
updated: 1667601359339
created: 1667600047521
---

## About
udev is built in system tool for running hooks
when different devices are plugged into the system

## Usage

udev uses a set of rules to know what to do when different usb devices are plugged in.

rules are placed in /etc/udev/rules.d/

this file is line deliniated and contains different indicators for targeting devices based on id information provided over usb connection.

Rules are built with matching statements and actions.

Now every usb device has a vendor id and a product id, so we can create a udv rule to run when we plug in a given device.

see 

[youtube](https://youtu.be/BOxWrMNXKpU?t=190)

```bash
man udev
```

for further information
