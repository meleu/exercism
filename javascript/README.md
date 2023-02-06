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

Using the optional chaining operator `?.` we can prevent crashes when trying to access properties of an undefined object.

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

Useful when we want to provide a default value in case a variable is `null` or `undefined`.

```js
let name; // <- undefined
let person = name ?? 'World';
console.log('Hello ' + person);
// => Hello World
```
