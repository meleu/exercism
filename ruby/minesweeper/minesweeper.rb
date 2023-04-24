class Board
  def self.transform(input)
    raise ArgumentError unless input_valid?(input)

    board = input.dup
    for i in 1..(input.length - 2)
      for j in 1..(input[i].length - 2)
        next if input[i][j] == '*'

        surroundings = input[i-1][j-1..j+1] + input[i+1][j-1..j+1] + input[i][j-1] + input[i][j+1]
        counter = surroundings.count('*').to_s

        board[i][j] = counter unless counter == '0'
      end
    end
    board
  end

  def self.input_valid?(input)
    return false unless input.all? { |line| line.length == input.first.length }

    last_i = input.length - 1
    return false unless input[0].squeeze == '+-+' && input[last_i].squeeze == '+-+'

    input[1..last_i - 1].each do |line|
      return false unless line.match?(/^\|[ *]+\|$/)
    end
  end
end
