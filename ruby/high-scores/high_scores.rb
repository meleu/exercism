# https://exercism.org/tracks/ruby/exercises/high-scores
class HighScores
  attr_accessor :personal_best, :personal_top_three, :latest, :scores

  def initialize(scores)
    @scores = scores
    @personal_best = scores.max
    @personal_top_three = scores.max(3)
    @latest = scores[-1]
  end

  def latest_is_personal_best?
    @latest == @personal_best
  end
end
