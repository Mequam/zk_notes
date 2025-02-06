---
id: sli4122n1fwaglmvax08hi
title: java/io/streams
desc: ''
updated: 1738075683
created: 1738075683
---
# java/io/streams

## About

> "An I/O Stream represents an input source or an output destination. A stream can represent many different kinds of sources and destinations, including disk files, devices, other programs, and memory arrays.
> 
> Streams support many different kinds of data, including simple bytes, primitive data types, localized characters, and objects. Some streams simply pass on data; others manipulate and transform the data in useful ways.
> 
> No matter how they work internally, all streams present the same simple model to programs that use them: A stream is a sequence of data. A program uses an input stream to read data from a source, one item at a time:"
> 
> -Oracle on java streams

streams tend to be useful because they provide a set of very helpful
mapping functions to iterate over, much like javascript arrays,
and they further let you write your code in a way where it doesn't
care where the data is coming from.

## Example

```java
import java.util.*;  
import java.util.stream.Collectors;  
class Product{  
    int id;  
    String name;  
    float price;  
    public Product(int id, String name, float price) {  
        this.id = id;  
        this.name = name;  
        this.price = price;  
    }  
}  
public class JavaStreamExample {  
    public static void main(String[] args) {  
        List<Product> productsList = new ArrayList<Product>();  
        //Adding Products  
        productsList.add(new Product(1,"HP Laptop",25000f));  
        productsList.add(new Product(2,"Dell Laptop",30000f));  
        productsList.add(new Product(3,"Lenevo Laptop",28000f));  
        productsList.add(new Product(4,"Sony Laptop",28000f));  
        productsList.add(new Product(5,"Apple Laptop",90000f));  
        List<Float> productPriceList2 =productsList.stream()  
                                     .filter(p -> p.price > 30000)// filtering data  
                                     .map(p->p.price)        // fetching price  
                                     .collect(Collectors.toList()); // collecting as list  
        System.out.println(productPriceList2);  
    }  
}  
```

this example was taken from [javapoint](https://www.javatpoint.com/java-8-stream)


## useful functions

these are again taken from
[javapoint](https://www.javatpoint.com/java-8-stream)

### Intermidary (returns stream)

- map(Function\<T, R\>)
- filter(Predicate\<T\>)
- flatMap(Function\<T, Stream\<R\>\>)
- distinct()
- sorted()
- limit(long n)
- skip(long n)
- peek(Consumer\<T\>)

### terminal (does not return stream)
- forEach(Consumer\<T\>)
- collect(Collector\<T, A, R\>)
- reduce(BinaryOperator\<T\>)
- count()
- anyMatch(Predicate\<T\>)
- allMatch(Predicate\<T\>)
- noneMatch(Predicate\<T\>)
- findFirst()
- findAny()

### Short Circit (returns boolean)

- anyMatch(Predicate\<T\>)
- allMatch(Predicate\<T\>)
- noneMatch(Predicate\<T\>)
- findFirst()
- findAny()
