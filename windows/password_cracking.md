---
id: ego15b53s8ujy5yfev1qjq
title: windows/password_cracking
desc: ''
updated: 1717610005
created: 1717610005
---
# windows/password_cracking

## About

there might be some time that you need to pull the password of a local windows machine
for example forgot passwords, old computers and the like, the following note is a collection
of information on techniques that can help with this

## Theory

Windows keeps its password hashes stored in 
if you can change those hashes, you can get back into the machine.
this mostly boils down to a three step process

1. boot into the machine via a linux usb
2. mount the partition
3. change the hash to match a desired entry password

### Hash File

windows stores its hash in the following file

> C:/windows/system32/config/sam

it is in the sam file format, and is not a text file to begin with so specilized tools
are needed to edit the entries.


### Reading Hashes

you can dump out the hashes with the terminal command samdump2, the tool is pre installed to kali
for easy access:

[samdump2](https://www.kali.org/tools/samdump2/)

```bash
samdump2 system32/config/SYSTEM system32/config/SAM
```

this can be used to crack the hash and gain entry that way as apposed to overwriting the hash entirely

you need the SYSTEM file to un encrypt the SAM file, as the key for the encryption is stored there
also note it is posible the config directory could be encrypted, make sure that the password is not locked
on the log screen before booting into kali.

these hashes are formated as
(uid:rid:lmhash:nthash) we care about the nthash for cracking

### Cracking Hashes

this method will give you the actual password back

```bash
# Adding nthashes to a .txt File
# Copy paste them in hashestocrack.txt

# Hashcat them
sudo hashcat -m 1000 hashestocrack.txt /usr/share/wordlists/rockyou.txt
# -m 1000: select module for NT hashes
```

you don't have to use hashcat, as long as you have a program that can solve NT Hashe, but hashcat is included in kali for
convinience.

note that hashcat stores cracked passwords that it finds into .local/share/hashcat/hashcat.potfile
you can view their contents with --show

## Resources

[tutorial](https://amandaguglieri.github.io/hackinglife/attacking-sam/)
