# https://exercism.org/tracks/ruby/exercises/wordy
class WordProblem
  OPERATIONS = {
    'plus' => '+',
    'minus' => '-',
    'multiplied' => '*',
    'divided' => '/'
  }

  def initialize(sentence)
    @answer = nil
    numbers = sentence.scan(/-?\d+/).map(&:to_i)
    operations = sentence.scan(/plus|minus|multiplied|divided/)

    operations.each_with_index do |op, i|
      @answer = if i.zero?
                  numbers[i].send(OPERATIONS[op], numbers[i + 1])
                else
                  @answer.send(OPERATIONS[op], numbers[i + 1])
                end
    end
  end

  def answer
    raise ArgumentError if @answer.nil?

    @answer
  end
end
