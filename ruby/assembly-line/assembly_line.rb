# https://exercism.org/tracks/ruby/exercises/assembly-line
class AssemblyLine
  PRODUCTION_PER_HOUR = 221.0

  def initialize(speed)
    @speed = speed
  end
  
  def success_rate
    case @speed
    when 1..4
      1.0
    when 5..8
      0.9
    when 9
      0.8
    when 10
      0.77
    end
  end

  def production_rate_per_hour
    @speed * PRODUCTION_PER_HOUR * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
