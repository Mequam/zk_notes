---
id: dlc756pzntyfnjfke3lige8
title: Input
desc: ''
updated: 1667599419128
created: 1667599419128
---

## Commands

### xinput

#### About
The xinput command lists and controls inputs
stored on the x server.

simply run  the following man command to get further information on the program

```bash
man xinput
```

#### remapping inputs for dual monitors

the following command lists out the current
inputs detected by the system
```bash
xinput
```

find the id of the input that you want to remap.Then you can remap it using the following command.

```bash
xinput map-to-output <id> <Monitor-Identifier>
```

see [[xrandr|Linux.X.input#listing-monitor-information]] for how to get the monitor identifier

### xrandr

#### About

xrandr is a simple command to pass the randr library functionality onto the user.


As far as I can currently tell randr is a library that is used to reconfigure the x server with different monitors / windows

see the man page for more detail

```bash
man xrandr
```

#### listing monitor information

simply running the command by itself lists
out system configuration information for your
given monitors.

The name of the configuration will look something like HDMI-1, DVI-2 and is an indicator
for which display that you want to use.

```bash
xrandr
```
