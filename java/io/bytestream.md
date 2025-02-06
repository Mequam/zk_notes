---
id: 78m4ho258yqfy5gcqjxkw4
title: java/io/bytestream
desc: ''
updated: 1738076788
created: 1738076788
---
# java/io/bytestream

## About

this is the java interface that works with binary data

## Usage Note

as far as I can tell, you typically don't work with byte streams directly, instead
you will usually use a class that extends from them, such classes include

- FileInputStream
- FileOutputStream

to my knowledge you would only realy work with bytestreams specifically when
writing functions who could recive data from many diferent sources

## Example

```java
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class CopyBytes {
    public static void main(String[] args) throws IOException {

        FileInputStream in = null;
        FileOutputStream out = null;

        try {
            in = new FileInputStream("xanadu.txt");
            out = new FileOutputStream("outagain.txt");
            int c;

            while ((c = in.read()) != -1) {
                out.write(c);
            }
        } finally {
            if (in != null) {
                in.close();
            }
            if (out != null) {
                out.close();
            }
        }
    }
}
```
