class Phrase
  def initialize(phrase)
    @words = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    words_count = Hash.new(0)
    @words.each { |w| words_count[w] += 1 }
    words_count
  end
end
