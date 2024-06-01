---
id: 66ni5a4pknfjmosnfkys38
title: java/maven
desc: ''
updated: 1717206968
created: 1717206968
---
# java/maven

## About

maven is a build system specifically made for java.

maven projets are managed by the mvn command that stores project configuration information
in pom.xml you can see an example of pom.xml bellow
[pom.xml exmaple](./assets/ProgramingExamples/java/collections/examples/hash/wordle)



as such mvn commands must be run from a directory that contains pom.xml or you will get an 
error


## Quick Start

### Creating A Project

the following command creats a simple maven project

note the groupId as the path to the main app that we want to build

artifactId is the name of the end product

```bash
mvn archetype:generate -DgroupId=com.mequam.app -DartifactId=number-game -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false #generate a basic project with maven
```

### Building A Project

to build our project we can use the command


```bash
mvn package
```

> you can also specify a folder that contains pom.xm using the -f flag

this will output the artifacts listed in pom.xml to the target directory, in the case of
the default project a jar file containing the compiled version of our code


### Running A Project

we can then run this code with the following command:

```bash
java -cp target/classes com.<yourcompany>.app.App
```

note that you would replace the com. section with the appropriate java class path
from the root of the class file in classes
