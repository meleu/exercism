# https://exercism.org/tracks/ruby/exercises/isogram
class Isogram
  def self.isogram?(input_string)
    input_chars = input_string.downcase.gsub(/[^a-z]/, '').chars
    input_chars == input_chars.uniq
  end
end
