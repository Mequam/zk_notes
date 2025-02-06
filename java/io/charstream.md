---
id: bq0vkq7fea3e1no7e2gxo4
title: java/io/charstream
desc: ''
updated: 1738077059
created: 1738077059
---
# java/io/charstream

## About

these are streams that read in unicode string data and convert
it to the locale of the current system

most of the info taken for these notes if from

[oracle](https://docs.oracle.com/javase/tutorial/essential/io/charstreams.html)

## Base Classes

All character stream classes are descended from 

- Reader
- Writer

## Example

```java
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class CopyCharacters {
    public static void main(String[] args) throws IOException {

        FileReader inputStream = null;
        FileWriter outputStream = null;

        try {
            inputStream = new FileReader("xanadu.txt");
            outputStream = new FileWriter("characteroutput.txt");

            int c;
            while ((c = inputStream.read()) != -1) {
                outputStream.write(c);
            }
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
            if (outputStream != null) {
                outputStream.close();
            }
        }
    }
}
```

## Line IO

java further suports reading in a file up to a given line,
see

[readline](./java/io/readline.md)

for more information
