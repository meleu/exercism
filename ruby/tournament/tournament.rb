class Tournament
  @table = {}

  def self.tally(input)
    results = input.split("\n")
    results.each { |result| parse_input(result) }
    print_table
  end

  def self.parse_input(input)
    parsed_input = input.split(';')
    team1 = parsed_input[0]
    team2 = parsed_input[1]
    result = parsed_input[2]

    @table[team1] = new_team(team1) if @table[team1].nil?
    @table[team2] = new_team(team2) if @table[team2].nil?

    case result
    when 'win'
      win(@table[team1], @table[team2])
    when 'loss'
      loss(@table[team1], @table[team2])
    when 'draw'
      draw(@table[team1], @table[team2])
    end
  end

  def self.new_team(team)
    {
      name: team,
      matches_played: 0,
      win: 0,
      draw: 0,
      loss: 0,
      points: 0
    }
  end

  def self.win(team1, team2)
    team1[:matches_played] += 1
    team1[:win] += 1
    team1[:points] += 3

    team2[:matches_played] += 1
    team2[:loss] += 1
  end

  def self.loss(team1, team2)
    team1[:matches_played] += 1
    team1[:loss] += 1

    team2[:matches_played] += 1
    team2[:win] += 1
    team2[:points] += 3
  end

  def self.draw(team1, team2)
    team1[:matches_played] += 1
    team1[:draw] += 1
    team1[:points] += 1

    team2[:matches_played] += 1
    team2[:draw] += 1
    team2[:points] += 1
  end

  def self.print_table
    puts 'Team                           | MP |  W |  D |  L |  P'
    @table.each do |team|
      line = "#{team[:name]}\t| #{team[:matches_played]} | #{team[:win]} "
      line += "| #{team[:draw]} | #{team[:loss]} | #{team[:points]}"
    end
  end
end
