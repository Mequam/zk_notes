---
id: tzohi6yts8ebcn5dzwsg8a
title: java/equalsfunction
desc: ''
updated: 1717209721
created: 1717209721
---
# java/equalsfunction

## About

java objects can overide a special method to determine if two objects are equal
to be used inside of the collection api, especially for something like the hash map

```java
public boolean equals(Object obj) {
    if (obj == this) return true;

    //do other comparisons
}

```

## References

[java/hashfunction](hashfunction)
[ProgramingExamples/java/datastructures/Set](../ProgramingExamples/java/datastructures/Set)
[ProgramingExamples/java/datastructures](../ProgramingExamples/java/datastructures)
