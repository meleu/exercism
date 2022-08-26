# https://exercism.org/tracks/ruby/exercises/acronym
class Acronym
  def self.abbreviate(words)
    words.split(/ |-/).map { |word| word[0] }.join.upcase
  end
end
