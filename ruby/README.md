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


