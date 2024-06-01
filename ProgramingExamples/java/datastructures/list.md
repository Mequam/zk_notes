---
id: tx8t3yqgld49pu7rbz7prd
title: ProgramingExamples/java/datastructures/list
desc: ''
updated: 1717198184
created: 1717198184
---
# ProgramingExamples/java/datastructures/list

## About

java offers a general List datatype that represents ordered data that you can insert into

the List datatype provides a generalization for datastructures
that we can insert into in an orderd fashion both ArrayLists and LinkedLists
an implementation of this interface

the general List class provides (among others) the following operations
- get
- add
- remove
- size


you would typically use a linked list implementation when you have MANY insertions and deletions into the list

ArrayLists can be used in almost all other contexts

example usage of a linked list can be found in [java list example](./assets/ProgramingExamples/java/collections/examples/lists/ListExample.java)

## ArrayList

- dynamically resized array that allows you to insert data as necessary
- when it needs to accomidate new elements it grows 50% larger than it currently is

typcially ArrayLists are prefered over linked lists for their contingient memory structures,
but in rare senarios when you need to insert into the array list MANY times, a linkedList
could be prefered

```java
import java.util.ArrayList;
import java.util.List;
public class ArrayListExample {
    public static void main(String [] args) {
        List<String> mylist = new ArrayList<String>(10); //start with 10 elements
        mylist.add("hello");
        mylist.add("world");

        System.out.println(mylist.size()); //2
        System.out.println(mylist.get(0)); //hello
        System.out.println(mylist.remove(0)); //removes "hello"
    }
}
```

## LinkedList

- created by pointing nodes to nodes in computer memory
- ideal for applications where you insert and delete often from a list
- searching is slow, as you need to go through each item of the list

usually ArrayLists tend to outperform LinkedLists

```java
import java.util.LinkedList;
import java.util.List;
public class ArrayListExample {
    public static void main(String [] args) {
        List<String> mylist = new LinkedList<String>();
        mylist.add("hello");
        mylist.add("world");

        System.out.println(mylist.size()); //2
        System.out.println(mylist.get(0)); //hello
        System.out.println(mylist.remove(0)); //removes "hello"
    }
}
```
