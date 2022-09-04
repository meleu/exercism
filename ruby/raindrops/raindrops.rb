# https://exercism.org/tracks/ruby/exercises/raindrops
class Raindrops
  def self.convert(number)
    result = ''
    factors = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }

    factors.each do |factor, drop_sound|
      result += drop_sound if (number % factor).zero?
    end

    result.empty? ? number.to_s : result
  end
end
