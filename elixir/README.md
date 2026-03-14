# Learning Elixir

I'm glad it has many similarities with Ruby. :)

## official documentation

<https://hexdocs.pm/elixir>

## variables

Elixir is dynamically typed.

```elixir
# this is perfectly valid Elixir code

my_var = 1
my_var = 2
my_var = false
my_var = "meleu"
```

## naming conventions

Similar to Ruby.

- modules: `PascalCase`
- variables: `snake_case`
- functions: `snake_case`

## modules

All named functions must be defined in a module.

```elixir
defmodule MyModule do
  # ...
end
```

## named functions

Use the `def` keyword to define a public named function, and `defp` to define a private one.

If the function's body is a oneliner, the whole function can be declared using
the one-line syntax (note the `,` and `:` around the `do` keyword).

```elixir
defmodule Calculator do
  def subract(x, y) do
    private_subtract(x, y)
  end

  defp private_sutract(x, y), do: x - y
end

# When invoking a function, the module name must be present
difference = Calculator.subtract(7, 2)

# this results in an error (we can't invoke private functions from outside of the module)
difference = Calculator.private_subtract(7, 2)
```

## arity of functions

It's usual to refer to functions with their arity (the number of args it accepts).

The function defined below would be referred to as _add/3_:

```elixir
def add(x, y, z), do: x + y + z
```
