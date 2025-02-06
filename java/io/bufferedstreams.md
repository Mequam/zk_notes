---
id: bto6mrp3m9tf9q1gpuk69n
title: java/io/bufferedstreams
desc: ''
updated: 1738077531
created: 1738077531
---
# java/io/bufferedstreams

## About

when reading in from streams, it is often highly inefficient
as the program acceses expensive resources numerous times
instead of reading in one byte at a time, java provides us with
a buffering api that allows us to automatically get the
benifits of reading input in in chunks and buffering it in the
program

## Classes

there are several classes that do this inside of java

- BufferedReader
- BufferedWriter
- BufferedInputStream
- BufferedOutputStream

the first two are character streams,
the second two byte streams

these take in a character stream or a byte stream as a reference
when creating them

see bellow for more info

[character stream](./java/io/charstream.md)
[bytestream](./java/io/bytestream.md)

## Flushing

as with most buffer api's these provide the functionality to flush out the stream
and force it to send all inputs to the output destination

java uses the flush method for this, which works identically to similar flush methods found
in c++
