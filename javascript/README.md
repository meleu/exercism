# Learning JavaScript

I'm using the exercism.org challenges to practice JavaScript.

In this file I'm taking notes about the interesting things I'm learning on each exercise.

---

## Bird Watcher

- [bird-watcher](bird-watcher)

Difference between `in` and `of`:

- "in" is used to iterate the keys of an object. 
- "of" is used to iterate the values of an iterable collection such as an array, a string or a Map. 

Example:

```js
myArray = ['a', 'b', 'c'];

for (const key in myArray) console.log(key);
// output: 0 1 2

for (const key of myArray) console.log(key);
// output: a b c
```

---

## Mixed Juices

- [mixed-juices](mixed-juices)

In this exercise I learned that in a switch statement the comparison is done
by checking for strict equality `===`. (ok, it looks kinda obvious after it's
said, but it was useful to be fully conscious about that.)


---

## Amusement Park

- [amusement-park](amusement-park)

### Optional Chaining

Using the optional chaining operator `?.` we can prevent crashes when trying
to access properties of an undefined object.

```js
const obj = {
  address: {
    street: 'My Own Street',
    city: 'New York',
  },
};

obj.address.zipCode;
// => undefined

// CRASH! Because 'residence' is not a property of 'obj'.
obj.residence.street;
// => TypeError: Cannot read property 'street' of undefined

obj.residence?.street;
// => undefined
```


### Nullish Coalescing

Useful when we want to provide a default value in case a variable is
`null` or `undefined`.

```js
let name; // <- undefined
let person = name ?? 'World';
console.log('Hello ' + person);
// => Hello World
```

---


## Lucky Numbers

- [lucky-numbers](lucky-numbers)

### Type Conversion

Changing a type of a variable can be done explicitly (type **conversion**) and
implicitly (type **coercion**).

#### Boolean()

```js
Boolean(-1);
// => true

// the number zero is falsy
Boolean(0);
// => false

Boolean(' ');
// => true

// empty string is falsy
Boolean('');
// => false
```


#### Number()

```js
Number('  -12.34  ');
// => -12.34

Number('1,2');
// => NaN

Number('');
// => 0

Number({ num: 123 });
// => NaN

// the value `1_000` is a valid way to write an actual number
Number(1_000);
// => 1000

// but the string `'1_000'` is not converted into its equivalent number
Number('1_000');
// => NaN
```


#### String()

```js
String(12.34);
// => '12.34'

String(false);
// => 'false'

String(undefined);
// => 'undefined'

String(null);
// => 'null'

// note that in the example above, `null` was converted into `'null'`,
// but in the array below, `null` was converted to an empty string.
String([42, null, true, 'abc']);
// => '42,,true,abc'

// for objects, the conversion is not helpful. :(
String({ key: 'value' });
// => '[object Object]'
```

### Split a String into an array of chars

```js
// long version
"my string".split('');
// => [ 'm', 'y', ' ', 's', 't', 'r', 'i', 'n', 'g' ]

// short/idiomatic version
// aka "Spread syntax"
[..."my string"]
// => [ 'm', 'y', ' ', 's', 't', 'r', 'i', 'n', 'g' ]
```

Related doc: <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax>
