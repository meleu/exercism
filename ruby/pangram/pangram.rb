# https://exercism.org/tracks/ruby/exercises/pangram
class Pangram
  def self.pangram?(sentence)
    letters = sentence.downcase.scan(/[a-z]/).uniq
    letters.count == 26
  end
end
