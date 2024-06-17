---
id: l9fhirxtydhj871enekwub
title: godot/arrays
desc: ''
updated: 1718248525
created: 1718248525
---
# godot/arrays

## About

gdscript arrays whats there to say :)

see the docs for more info

[godot array docs](https://docs.godotengine.org/en/stable/classes/class_array.html)

## removing an element

use the erase method with the value of the elements you want to use

## Function Notes

bool

all ( Callable method ) const

bool

any ( Callable method ) const

void

append ( Variant value )

void

append_array ( Array array )

void

assign ( Array array )

Variant

back ( ) const

int

bsearch ( Variant value, bool before=true ) const

int

bsearch_custom ( Variant value, Callable func, bool before=true ) const

void

clear ( )

int

count ( Variant value ) const

Array

duplicate ( bool deep=false ) const

void

erase ( Variant value )

void

fill ( Variant value )

Array

filter ( Callable method ) const

int

find ( Variant what, int from=0 ) const

Variant

front ( ) const

int

get_typed_builtin ( ) const

StringName

get_typed_class_name ( ) const

Variant

get_typed_script ( ) const

bool

has ( Variant value ) const

int

hash ( ) const

int

insert ( int position, Variant value )

bool

is_empty ( ) const

bool

is_read_only ( ) const

bool

is_same_typed ( Array array ) const

bool

is_typed ( ) const

void

make_read_only ( )

Array

map ( Callable method ) const

Variant

max ( ) const

Variant

min ( ) const

Variant

pick_random ( ) const

Variant

pop_at ( int position )

Variant

pop_back ( )

Variant

pop_front ( )

void

push_back ( Variant value )

void

push_front ( Variant value )

Variant

reduce ( Callable method, Variant accum=null ) const

void

remove_at ( int position )

int

resize ( int size )

void

reverse ( )

int

rfind ( Variant what, int from=-1 ) const

void

shuffle ( )

int

size ( ) const

Array

slice ( int begin, int end=2147483647, int step=1, bool deep=false ) const

void

sort ( )

void

sort_custom ( Callable func )

Operators¶
bool

operator != ( Array right )

Array

operator + ( Array right )

bool

operator < ( Array right )

bool

operator <= ( Array right )

bool

operator == ( Array right )

bool

operator > ( Array right )

bool

operator >= ( Array right )

Variant

operator [] ( int index )


