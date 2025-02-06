---
id: f8m4jf8kk193sz20mn0oft
title: java/threads
desc: ''
updated: 1738078630
created: 1738078630
---
# java/threads

## About

threads are used for concurent programming, the following
is an example for how to use them inside of java

these notes were taken from

[oracle](https://docs.oracle.com/javase/tutorial/essential/concurrency/simple.html)

## Example

```java
public class HelloRunnable implements Runnable {

    public void run() {
        System.out.println("Hello from a thread!");
    }

    public static void main(String args[]) {
        (new Thread(new HelloRunnable())).start();
    }

}
```

```java
public class HelloThread extends Thread {

    public void run() {
        System.out.println("Hello from a thread!");
    }

    public static void main(String args[]) {
        (new HelloThread()).start();
    }

}
```

---

## Useful Threading Functions

### Join

works like join in any other language, waits for the given thread
to finish before moving on

```java
t.join();
```

join takes a number that represents an amount of time to wait for,
if that time is exceded and the thread is still running the thread
calling join will continue excecution

### Sleep

the following causes the current thread to sleep for 4 seconds

```java
Thread.sleep(4000)
```

### Alive

```java
t.isAlive()
```

returns true if the thread is running

### Interupts

these indicate to the thread that something needs its attention, think
ctrl+c on the terminal

there are several ways to handle these in java

certain thread messages will throw an error when interupted, this can
be caught and interacted with

```java
for (int i = 0; i < importantInfo.length; i++) {
    // Pause for 4 seconds
    try {
        Thread.sleep(4000);
    } catch (InterruptedException e) {
        // We've been interrupted: no more messages.
        return;
    }
    // Print a message
    System.out.println(importantInfo[i]);
}
```

additionally java provides the  Thread.interuppted() as a way of checking
if the given thread has recived an interupt

```java
for (int i = 0; i < inputs.length; i++) {
    heavyCrunch(inputs[i]);
    if (Thread.interrupted()) {
        // We've been interrupted: no more crunching.
        return;
    }
}
```

usueful tip for writing functions that throw the interupt exception

```java
if (Thread.interrupted()) {
    throw new InterruptedException();
}
```

you can **cause** an interupt with the following code

```java
Thread.interrupt()
```

> Note: once you handle an interupt, future calls to that interupt function
> will then return false, until some source sets an interupt a second time
> this includes throwing the interupt exception

also note that you can call these functions on references to other threads
