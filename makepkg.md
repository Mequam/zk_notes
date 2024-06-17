---
id: 23lfge5sx9qwkz8w1wjzy0
title: makepkg
desc: ''
updated: 1718491845
created: 1718491845
---
# makepkg

## About

makepkg is the arch linux package creation utility that is used
to create custom user packages, it is a highly useful tool for installing
and setting up packages

## Check Sums

Package downloads need to be verified before begining the install process
for this purpose checksums are provided for convinience.

an example of using b2sums can be found bellow

```bash
b2sums=('list' 'of' 'checksums')
```

several different sums are supported

to have makepkg generate a checksum from a download you can use the following command from the
pacman-contrib package

```bash
updpkgsums
```

after running the command the sums will be appended to the bottom of the makepkg file


see [makepackage docs](https://wiki.archlinux.org/title/Makepkg#Generate_new_checksums) for more info

## arch

list of supported hardware architectures

```bash
arch=('x86_64' 'armv7h')
```
- any supports all architectures
- armv7h is raspberry pi
- x86_64 for standard pc's
