---
id: 809os61ye6l0l5jtn2h54k
title: ProgramingExamples/java/datastructures/stack
desc: ''
updated: 1717205012
created: 1717205012
---
# ProgramingExamples/java/datastructures/stack

## About

Stacks are a famous computer science structure, they are a last in first out structure
you can think about them like a stack of cards, the first card you pick up from the stack, is
the last card that you placed on the stack

an example of a program using a stack can be found here:

[java stack example](./assets/ProgramingExamples/java/collections/examples/stacks/StackExample.java)


## Generics

java provides a generic stack class that we can use to construct a stack object
interestingly the generic stack already implements the behavior that we need from the java
utils library

```java
import java.util.Stack;
public class Example {
    public static void main(String [] args) {
        Stack<String> stack = new Stack();

        stack.push("lightning bolt");
        stack.push("titanic growth");
        stack.push("counter spell");

        for (;!stack.empty();stack.pop()) {
            System.out.println(stack.peek() + " resolves!");
        }
    }
}
```
