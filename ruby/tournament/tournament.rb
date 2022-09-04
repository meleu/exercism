# https://exercism.org/tracks/ruby/exercises/tournament
# NOTE:
# This exercise would be better resolved with Arrays/Hashes fluence
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

class Tournament
  def self.tally(results = '')
    # results_table = []
    results_table = {}

    results.each_line do |line|
      team1, team2, result = line.split(';')

      results_table[team1] = TeamStatistics.new(team1) unless results_table.key?(team1)
      results_table[team2] = TeamStatistics.new(team2) unless results_table.key?(team2)

      case result
      when 'win'
        results_table[team1].matches_won += 1
        results_table[team2].matches_lost += 1
      when 'loss'
        results_table[team1].matches_lost += 1
        results_table[team2].matches_won += 1
      when 'draw'
        results_table[team1].matches_drawn += 1
        results_table[team2].matches_drawn += 1
      end
    end

    format(
      '%-30s |%3s |%3s |%3s |%3s |%3s',
      'Team',
      'MP',
      'W',
      'D',
      'L',
      'P'
    )

    # I need to sort the results_table: ordered by points, descending. In case
    # of a tie, teams are ordered alphabetically
    format(
      '%-30s |%3s |%3s |%3s |%3s |%3s',
      team1,
      'MP',
      'W',
      'D',
      'L',
      'P'
    )
  end
end
