# Learning Rust

I'm using the exercism.org challenges to learn Rust

In this file I'm taking notes about the interesting things I'm learning on each exercise.

---

## Hello-World

- [hello-world](hello-world)

I learned that if I want a function to return a string, I can use something like this:

```rust
// &'static is a "lifetime specifier"
// something you'll learn more about later
pub fn hello() -> &'static str {
    "Hello, World!"
}
```

Just like in Ruby, there's no need to explicitly say `return`. But it **must** have no semicolon!


---

## Lucians Luscious Lasagna

- [lucians-luscious-lasagna](lucians-luscious-lasagna)

Learned some cool things inside the [README.md](lucians-luscious-lasagna/README.md). For example:

- `dbg!()` - useful for debugging (show filename ane line number)
- `cargo doc` generates documentation
- `///` is used for outer doc comment (used above a function signature, for example. Out of the `{`scope`}`).
- `//!` is used for inner doc comment (just like in Python)

Outer scope example:
```rust
/// The `add` function produces the sum of its arguments.
fn add(x: i32, y: i32) -> i32 { x + y }
```

inner scope example (python style):
```rust
mod my_cool_module {
    //! This module is the bee's knees.
}
```

---

## Assembly Line

- [assembly-line](assembly-line)

I've learned about naming numeric types.

| bits | usigned integer | signed integer | floating point |
| ---- | --------------- | -------------- | -------------- |
| 8    | u8              | i8             |                |
| 16   | u16             | i16            |                |
| 32   | u32             | i32            | f32            |
| 64   | u64             | i64            | f64            |
| 128  | u128            | i128           |                |

Note that there are `f32` and `f64`.

> When converting from a larger type to a smaller one (for instance `u64` to `u32`) you could lose data. Converting from a floating point to an integer **will** lose everything behind the decimal point, effectively rounding down.

In order to cast from floating-point to integer, just use the `as` keyword. Example:

```rust
let my_integer = floating_point_var as u8;
let my_float = integer_var as f64;
```

In this challenge I've learned an interesting way to use `match`:

```rust
let success_rate = match speed {
    1..=4 => 1.0,
    5..=8 => 0.9,
    9..=10 => 0.77,
    _ => 0.0,
};
```

I also learned the notation for ranges: `1..=4` - meaning "from 1 to 4, including the 4".
