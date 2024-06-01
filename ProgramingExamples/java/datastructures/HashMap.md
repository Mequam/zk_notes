---
id: 58p9kz7fvr3ieowuysvvlc
title: ProgramingExamples/java/datastructures/HashMap
desc: ''
updated: 1717205900
created: 1717205900
---
# ProgramingExamples/java/datastructures/HashMap

## About

java maps use a hash function that takes in some data type and returns a number, and then use
that number to access some kind of array structure to get key value data in O(1) time

in english speak they map from one datatype to another datatype

this data structure is SUPER useful for searching for a given value based on a key
you can see it used in a practicle example bellow

in the event that two keys end up with the same hash value, java appends the key value pair to a linked list
at that hash.

should this link list get too big, it is then replaced with a red black tree in memory for efficient searching
at the given hash bucket.

[hash map example](./assets/ProgramingExamples/java/collections/examples/hash/HashExample.java)

## Generics

java provides the generic Map dataype to provide us with this behavior

the Map datatype contains several functions used to add data to the map

- put adds a key value pair
- get retrives a value from a key
- containsKey takes a key and tells us if its in the map
- containsValue takes a value and tells us if it is in the map
- entrySet returns a set of key value pairs (K,V)
- keySet returns a set of keys K
- values returns a list of values stored in the hash map V




```java
import java.util.Map;
import java.util.HashMap;
public class Example {
    public static void main(String [] args) {
        Map<String,Character> student_grades = new HashMap<String,Character>();

        student_grades.put("David",'A');
        student_grades.put("Jordan",'B');
        student_grades.put("Steve",'C');
        student_grades.put("Jack",'D');

        System.out.println(student_grades.get("David")); //prints A
        System.out.println(student_grades.get("Steve")); //prints C

    }
}
```
