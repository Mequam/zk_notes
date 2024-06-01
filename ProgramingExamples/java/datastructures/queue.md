---
id: w2jdxhg52llfokkvmj0hve
title: ProgramingExamples/java/datastructures/queue
desc: ''
updated: 1717203935
created: 1717203935
---
# ProgramingExamples/java/datastructures/queue

## About

queues are first in first out datastructures, think like a line of people
java provides us with a generic queue interface that several specific classes implement

[queue example code](./assets/ProgramingExamples/java/collections/examples/queues/QueueExample.java)

## Generics

the generic queue class provides several functions used to access the queues behavior

- peek looks at the top of the queue
- offer adds an item to the queue
- poll pops the head of the queue
- size

> I like to think of these like a casher "offering" a person a ticket, and "polling" them when their
> ticket is ready


```java
import java.util.Queue;
import java.util.LinkedList;

public class Example {
    import java.util.Queue;
    public static void main(String[] args) {
        Queue<Integer> queue = new LinkedList<Integer>();
    }
}
```

## LinkedList

you can implement a queue using a linked list as the underlinging behavior,
in such an implementation the first object placed into the queue will be the last object out

```java
import java.util.Queue;
import java.util.LinkedList;

public class Example {
    public static void main(String [] args) {
        Queue<Integer> queue = new LinkedList<Integer>();
        
        queue.offer(2);
        queue.offer(3);
        System.out.println(queue.peek()); //prints 2

        queue.poll(); //remove 2 from the queue

        System.out.println(queue.peek()); //prints 3

        System.out.println(queue.size()); //prints 1
    }
}
```
## Priority Queue

with a standard queue data is placed into the queue and released according to when in the program it is 
offered a slot in the queue

in a priority queue, data that is entered is given a priority, and that priority is then used to determine
when it should leave the queue

> I like to think of the vip lines at amusment rides as an example of this
> the standard line has priority 1
> where as the vip has priority 2

```java
import java.util.Queue;
import java.util.PriorityQueue;

public class Example {
    public static void main(String [] args) {
        Queue<Integer> queue = new PriorityQueue<Integer>();
        
        queue.offer(2);
        queue.offer(3);
        System.out.println(queue.peek()); //prints 2

        queue.poll(); //remove 2 from the queue

        System.out.println(queue.peek()); //prints 3

        System.out.println(queue.size()); //prints 1
    }
}
```
