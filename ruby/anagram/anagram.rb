# https://exercism.org/tracks/ruby/exercises/anagram
class Anagram
  def initialize(word)
    @main_word = word
    @main_word_downcase = @main_word.downcase
    @main_word_sorted_chars = @main_word_downcase.chars.sort.join
  end

  def match(words)
    words.select do |word|
      anagram?(word)
    end
  end

  def anagram?(word)
    word_downcase = word.downcase
    return false if @main_word_downcase == word_downcase

    @main_word_sorted_chars == word_downcase.chars.sort.join
  end
end
