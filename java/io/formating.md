---
id: zxojscm3sz3ddr1cwksdn2
title: java/io/formating
desc: ''
updated: 1738078410
created: 1738078410
---
# java/io/formating

## About

java provides several output classes for formating
java textual output

java provides the following classes for this

- PrintStream
- PrintWriter

System.out IS one such stream corisponding to system output

see [oracle](https://docs.oracle.com/javase/tutorial/essential/io/formatting.html) for
more information

## Usage

there are three methods provided by this

print, println, format

the first two work like you would expect, the second one
functions like printf in c

## Example

format function example

```java
public class Root2 {
    public static void main(String[] args) {
        int i = 2;
        double r = Math.sqrt(i);
        
        System.out.format("The square root of %d is %f.%n", i, r);
    }
}
```
