---
id: jzz5euauvtp6yivcgmsy4c
title: java/io/scanner
desc: ''
updated: 1738077963
created: 1738077963
---
# java/io/scanner

## About

these guys are super cool!

basically, scanners are an IO class java provides that performs the "split"
operation on incoming io, and returns your input based into chunks similarly
to how pythons .spilt method works on strings

these notes are again taken in reference to

[oracle](https://docs.oracle.com/javase/tutorial/essential/io/scanning.html)

## Example

```
import java.io.*;
import java.util.Scanner;

public class ScanXan {
    public static void main(String[] args) throws IOException {

        Scanner s = null;

        try {
            s = new Scanner(new BufferedReader(new FileReader("xanadu.txt")));

            while (s.hasNext()) {
                System.out.println(s.next());
            }
        } finally {
            if (s != null) {
                s.close();
            }
        }
    }
}
```

## Remarks

scanners default to using whitespace as their seperator,
but you can change the delimitor that the scannor uses using the
following snipit

```java
s.useDelimiter(",\\s*");
```

java provides translation functions for all of the languages primitive types,
for example the bellow can be used to loop over a list of numbers

```java
while (s.hasNext()) {
    if (s.hasNextDouble()) {
        sum += s.nextDouble();
    } else {
        s.next();
    }   
}
```
