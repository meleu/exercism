# https://exercism.org/tracks/ruby/exercises/resistor-color-duo
class ResistorColorDuo
  COLOR_VALUES = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }

  def self.value(colors)
    '100'.to_i
    COLOR_VALUES[colors[0]] * 10 + COLOR_VALUES[colors[1]]
  end
end
