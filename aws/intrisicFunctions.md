---
id: afxa8j8s1h6s1duylyxmnt
title: aws/intrisicFunctions
desc: ''
updated: 1733759691
created: 1733759691
---
# aws/intrisicFunctions

## About

when using cloud formation there are certain built in actions,
these are called intrisict functions

think of these like the uppcase function of cloud fromation,
there are several that are helpful for the creation of a sam library

## Intrisic Functions

- ref/fn::GetAtt = environment variable
- fn::join = combines strings
- fn::split = splits strings up
- fn::getAzs / fn::SELECT = choose a specific item from a list / value
- fn::importvalue = import a value into a yaml file

---

## Conditions

these allow us to compare values in the cloud formation,
think of them like your if statements and boolean logic

- fn::if
- fn::not
- fn::or
- fn::equal
- fn::and
