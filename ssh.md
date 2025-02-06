---
id: lzqldxyijkrtr7uxudsi89
title: ssh
desc: ''
updated: 1735941042
created: 1735941042
---
# ssh

## About

ssh is a secure remote shell program used to remotely comunicate with linux systems,
its pretty frikin cool

this is a place to store ssh tips and tricks that I find on the internet for quick
reference

## Genrating Keys For Git

```bash
ssh-keygen -t ed25519 -C "name@email.com" 
```

you can replace ed25519 with your prefered key type supported by ssh

## Passwordless Authentication

ssh passwordless authentication uses cryptographic keys to
authenticate with a system

the simplest way is


```bash
ssh-copy-id remote-user@remote-host
```

will copy your current id to the remote host

additionally you can specify which identity you want copied over
with the -i flag
