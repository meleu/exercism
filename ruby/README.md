# Learning Ruby

I'm using the exercism.org challenges to learn Ruby.

In this file I'm taking notes about the interesting things I'm learning on
each exercise.

---

## Hello-World

- [hello-world](hello-world)

In the `GETTING_STARTED.md` file I saw this [Intro to TDD using minitest](http://tutorials.jumpstartlab.com/topics/testing/intro-to-tdd.html)


---

## Lasagna

- [lasagna](lasagna)


### The `::` notation in `Lasagna::EXPECTED_MINUTES_IN_OVEN`

It means that `EXPECTED_MINUTES_IN_OVEN`is a constant in the `Lasagna` class.

### Implicit Return

Any statement in Ruby returns the value of the last evaluated expression. This
means that the `return` in the last expression of a method is optional.

Example:

```ruby
def get_user_id(user)
  # this would also work:
  # return user.id
  user.id
end
```

### links

- about methods: <https://launchschool.com/books/ruby/read/methods>
- idiomatic Ruby: <https://www.freecodecamp.org/news/idiomatic-ruby-writing-beautiful-code-6845c830c664>


---

## Two Fer

- [two-fer](two-fer)


### Default value for an argument

Default value for a method's argument if it's not passed:
```ruby
def method(paramenter = "default_value")
  # ...
end
```

### Default value for a string

Default value when variable is `nil`:
```ruby
# if name is nil, return "you"
"One for #{name || "you"}, one for me."
```

### Calling a method directly from the class

In order to be able to call a method directly from the class (without 
instantiating an object) you need to declare the method with `self`

```ruby
class TwoFer
  def self.two_fer(name = "you")
    "One for #{name}, one for me."
  end
end
```


## Log Line Parser

- [log-line-parser](log-line-parser)

Official documentation about String class: <https://ruby-doc.org/core-2.7.0/String.html>

### `.strip`

Removes white spaces in the beginning and at the end of a string.
```ruby
"   meleu zord   ".strip
# => "meleu zord"
```

### `.downcase`

Convert a string to lowercase:
```ruby
"INFO".downcase
# => "info"
```

Similarly, there's also the `.upcase`.


## Tournament

- [tournament](tournament)

TODO: didn't finish this exercise


### `attr_accessor` automatically creates getters and setters

```ruby
class TeamStatistics
  # good explanation about 'attr_accessor' here:
  # https://www.rubyguides.com/2018/11/attr_accessor/
  attr_accessor :team_name, :matches_won, :matches_drawn, :matches_lost

  def initialize(team_name)
    @team_name = team_name
    @matches_won = 0
    @matches_lost = 0
    @matches_drawn = 0
  end

  def matches_played
    @matches_won + @matches_lost + @matches_drawn
  end

  def points
    @matches_won * 3 + @matches_drawn
  end
end
```


## Amusement Park

- [amusement-park](amusement-park)


### The `initialize` method is the constructor

```ruby
class Attendee
  def initialize(height)
    @height = height
  end
end

person1 = Attendee.new(160)
```

### `@instance_variable` is the ruby way to call a private property

```ruby
class Attendee
  def initialize(height)
    @height = height
  end
end

person1 = Attendee.new(160)
person1.height # => gives an error
```


### `attr_reader` automatically creates the getters

```ruby
attr_reader :height, :pass_id
```


## Acronym

- [acronym](acronym)

### Sometimes `.map` is better than `.each`

The `map` method returns a new array with the results of running a block once for every element in enum.

In this exercise I did this:
```ruby
words.split(/ |-/).map { |word| word[0] }.join.upcase
```

See more: [Idiomatic Ruby](https://www.freecodecamp.org/news/idiomatic-ruby-writing-beautiful-code-6845c830c664)

## Isogram

- [isogram](isogram)

### `String.count` counts the characters in a string

<https://ruby-doc.org/core-3.1.2/String.html#method-i-count>

The parameter is a set of characters to count.

Examples:
```ruby
class Isogram
  def self.isogram?(input_string)
    word = input_string.downcase.gsub(/[^a-z]/, '')

    word.chars do |char|
      return false if word.count(char) > 1
    end
  end
end
```

### `Array.uniq` works like the `uniq` command

```ruby
class Isogram
  def self.isogram?(input_string)
    input_chars = input_string.downcase.gsub(/[^a-z]/, '').chars
    input_chars == input_chars.uniq
  end
end
```

## Pangram

- [pangram](pangram)

### `String.scan` is a more powerful way to `.split`

<https://ruby-doc.org/core-3.1.2/String.html#method-i-scan>

```ruby
a = "cruel world"
a.scan(/\w+/)        #=> ["cruel", "world"]
a.scan(/.../)        #=> ["cru", "el ", "wor"]
a.scan(/(...)/)      #=> [["cru"], ["el "], ["wor"]]
a.scan(/(..)(..)/)   #=> [["cr", "ue"], ["l ", "wo"]]
```

## Phone Number

- [phone-number](phone-number)

### Short RegEx for digits: `\d` and `\D`

```ruby
# \d means any digit - equivalent to /[0-9]/
"+1 (223) 456-7890".gsub(/\d/, 'X')
#=> "+X (XXX) XXX-XXXX"

# \D means any non-digit - equivalent to /[^0-9]/
"+1 (223) 456-7890".gsub(/\D/, '')
#=> "12234567890"
```


## Assembly Line

- [assembly-line](assembly-line)


### `case` with a range

The case can have a range of values:
```ruby
case @speed
when 1..4
  1
when 5..8
  0.9
when 9
  0.8
when 10
  0.77
end
```

## Bird Count

- [bird-count](bird-count)

### Array: Sum of all elements (integers only)

- [doc](https://ruby-doc.org/core-3.1.2/Array.html#method-i-sum)

```ruby
[1, 2, 3].sum
#=> 6

[1, 2, 3, '10'].sum
# (irb):11:in `+': String can't be coerced into Integer (TypeError)
```

### Array: count how many elements meet a condition

- [doc](https://ruby-doc.org/core-3.1.2/Array.html#method-i-count)
```ruby
[1, 2, 3, 4, 5].count { |n| n.even? }
#=> 2

[1, 2, 3, 4, 5].count { |n| n.odd? }
#=> 3
```

### Array: check if any element meets a condition

- [doc](https://ruby-doc.org/core-3.1.2/Array.html#method-i-any-3F)

```ruby
[1, 3, 5].any? { |n| n.even? }
#=> false

[1, 3, 5].any? { |n| n.odd? }
#=> true

# syntatic sugar
[1, 3, 5].any?(&:even?)
#=> false
[1, 3, 5].any?(&:odd?)
#=> true
```

## High Scores

- [high-scores](high-scores)


### Array.max(n) returns the top n values

```ruby
[1, 5, 2, 4, 3].max
#=> 5
[1, 5, 2, 4, 3].max(3)
#=> [5, 4, 3]
[1, 5, 2, 4, 3].max(10) # it's ok if n > Array.size
#=> [5, 4, 3, 2, 1]
```

## Resistor Color

- [resistor-color](resistor-color)

### Create an array of strings with the "percent literal" `%w`

- [official docs](https://ruby-doc.org/core-3.1.2/doc/syntax/literals_rdoc.html#label-25w+and+-25W-3A+String-Array+Literals)

```ruby
%w[black brown red orange yellow green blue violet grey white]
#=> ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
```


## Simple Calculator

- [simple-calculator](simple-calculator)

### Capture an Exception

```ruby
begin
  # ... code that can raise an exception...
rescue ExceptionName
  # ... code to run when getting an exception
end
```


### Create a custom exception

```ruby
class MyCustomError < StandardError
end
```

## Rotational Cipher

- [rotational-cipher](rotational-cipher)j

The smart approach I learned from looking other people's solutions involves:

1. create an `alphabet` array with each letter of the alphabet
2. create a new `encrypted_array` array with `alphabet.rotate(steps)`
3. use `.join` to create two strings: `alphabet_string` and `encrypted_string`
4. use `String.tr` to replace the `alphabet_string` with the `encrypted_string`

### Using a Range to create an Array

```ruby
# n00b way
alphabet = ('a'..'z').to_a

# ninja way (I'm not fully aware about this notation)
alphabet = [*'a'..'z']
```


### Using the `Array.rotate` method

From the [docs](https://rubyapi.org/3.1/o/array#method-i-rotate)

> Returns a new Array formed from `self` with elements rotated from one end
> to the other.
>
> When no argument given, returns a new Array that is like `self`, except that
> the first element has been rotated to the last position

```ruby
[:a, :b, :c, :d].rotate
#=> [:b, :c, :d, :a]

[:a, :b, :c, :d].rotate(2)
#=> [:c, :d, :a, :b]
```

### Using the `String.tr` method

- [docs](https://rubyapi.org/3.1/o/string#method-i-tr)

It works like the traditional `tr` Unix command.

```ruby
"hello".tr('el', 'ip')      #=> "hippo"
"hello".tr('aeiou', '*')    #=> "h*ll*"
"hello".tr('aeiou', 'AA*')  #=> "hAll*"
```
