---
id: qr20seqeqqsftxrv5gd2zn
title: ProgramingExamples/java/datastructures/Set
desc: ''
updated: 1717208220
created: 1717208220
---
# ProgramingExamples/java/datastructures/Set

## About

sometimes we want to have an unordered collection of objects, in such cercomstances
there can be performance gains to be had from a specialized datastructure that does not need
to keep track of ordering, the java Set provides this for us

you can find a hash set example at the following link

[set example](./assets/ProgramingExamples/java/collections/examples/set/SetExample.java)



## Generic

java provides a generic Set type that we can use with more specific types to implement set behavior in java

while hash sets provide several functions

- size
- contians
- add
- remove

we typically only use them inside of for loops to iterate through the set
note that we typically use sets to apply an operation to a group of objects, so a lot of for loops

note that sets use the special for loop to iterate over them, since there is no order it doesn't make sense
to use the i for loop

```java
for (String e : stringSet) {
    System.out.println(e);
}
```


## HashSet

a Hash set uses the java HashMap object in order to provide us with the Set behavior that we want

it stores a present value along with a given key which is the value that we want to save in the object


```java

import java.util.Set;
import java.util.HashSet;
public class SetExample {
    public static void main(String [] args) {
         Set<String> pokemon = new HashSet<String>();

         pokemon.add("pikachu");
         pokemon.add("chimchar");
         pokemon.add("staravia");
         pokemon.add("dialga");


         //we loop over sets using javas special set syntax
         for (String pokemon_name : pokemon) {
            System.out.println(pokemon_name);
         }
   }
}
```

