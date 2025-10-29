class Acronym
  def self.abbreviate(words)
    words.split(/ |-|_/).map { |word| word[0] }.join.upcase
  end
end
