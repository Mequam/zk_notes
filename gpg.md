---
id: gez2jonm01yaxbb55jw741
title: gpg
desc: ''
updated: 1718382721
created: 1718382721
---
# gpg

## Quick Start

```bash
#semetric encrypt
gpg --symmetric --cipher-algo TWOFISH file.txt
#semetric deycrypt
gpg -d file.txt.gpg
```


## About

gpg is an open source command line tool for doing encryption

## CLI differences

there are times when gpg will error depending on the tty environment that you
are in, the following is one way to fix that error and allow it to work

I THINK that the reason it does this is for security so you can't sign over ssh
but I have yet to find a source to confirm, either way the following command
will allow gpg to be used over the current tty

I DIDN'T KEEP IT IN MY CLIPBOARD

frik


TODO: go find that command and save it
