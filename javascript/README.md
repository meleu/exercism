# Learning JavaScript

I'm using the exercism.org challenges to practice JavaScript.

In this file I'm taking notes about the interesting things I'm learning on each exercise.

---

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
