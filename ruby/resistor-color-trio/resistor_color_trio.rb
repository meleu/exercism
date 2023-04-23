class ResistorColorTrio
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

  def initialize(colors)
    color1 = COLOR_VALUES[colors[0]]
    color2 = COLOR_VALUES[colors[1]]
    zeroes = COLOR_VALUES[colors[2]]

    raise ArgumentError if [color1, color2, zeroes].include?(nil)

    @value = "#{color1}#{color2}#{'0' * zeroes}"
  end

  def label
    if @value.end_with?('000')
      ohms = 'kiloohms'
      value = @value[0..-4]
    else
      ohms = 'ohms'
      value = @value
    end

    "Resistor value: #{value} #{ohms}"
  end
end
