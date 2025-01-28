---
id: 7xwmcxrq9rlqbdvnoj9htc
title: awesome
desc: ''
updated: 1737645698
created: 1737645698
---
# awesome

## About

awesome is a tile based api based window manager
that is very minimal and HIGHLY customizable

## Documentation

awesome documenation can be located at the following link
[awesome docs](https://awesomewm.org/doc/api/documentation/07-my-first-awesome.md.html#)

---

## Configuration

awesome uses a lua file for its primary configuration, you can find
this file at /etc/xdg/awesome/rc.lua, it then needs to be copied
to ~/.config/awesome/ and then the app needs to be started

### Test Command

since awesome will crash if the lua file has any issues compiling,
you can save yourself time by running a sub instance of awesome
inside of the current x session using the following command

```bash
Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome
```

additionally, you can use this command to test and play with
awesome from within another desktop environment should you
choose too
