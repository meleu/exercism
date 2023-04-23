class RunLengthEncoding
  def self.encode(input)
    # any char, followed by one or more repetitions of itself
    # substituted by the amount of chars, followed by the char
    input.gsub(/(.)\1+/) do |samechars|
      number = samechars.length
      char = samechars[0]
      "#{number}#{char}"
    end
  end

  def self.decode(input)
    # any number, followed by any other char
    # substituted by the char repeated 'number' times
    input.gsub(/\d+./) do |chunk|
      number = chunk.to_i # .to_i ignores the last char, if it's a non-digit
      char = chunk[-1]    # the last char in the chunk, is the char we need
      char * number
    end
  end
end

