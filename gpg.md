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
#semetric or asymetric deycrypt
gpg -d file.txt.gpg
#list keys
gpg --list-keys
```

## About

gpg is an open source command line tool for doing encryption

---

## Public Private Key Management

### Creation

```bash
#public private key generation
gpg --expert --full-gen-key
```

### Exporting

```bash
gpg --armor --export <key id>
```

### Importing

```bash
gpg --import <contact-pubkey.gpg>
```


### Encrypting with Public Keys

```bash
gpg --recipient <key owner> --encrypt <file to encrypt>
```

---

## Symetric Encrypt

```bash
gpg --symmetric --cipher-algo TWOFISH file.txt
```

obviously replace the algorithm with whichever one you
prefer, this will prompt for a password

---

## CLI differences

there are times when gpg will error depending on the tty environment that you
are in, the following is one way to fix that error and allow it to work

I THINK that the reason it does this is for security so you can't sign over ssh
but I have yet to find a source to confirm, either way the following command
will allow gpg to be used over the current tty

```bash
export GPG_TTY=$(tty)
```
