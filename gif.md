---
id: w1pvoee3g1x55koes3ei25
title: gif
desc: ''
updated: 1731448855
created: 1731448855
---
# gif

## About

gif is a simple file format for web based images ideal for storing SMALL
animations 

## Commands

ffmpeg command to create a gif from a set of images

```bash
ffmpeg -framerate 6 -pattern_type glob -i '*.png' -r 15 -gifflags -offsetting out.gif
```
