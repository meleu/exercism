# https://exercism.org/tracks/ruby/exercises/isbn-verifier
class IsbnVerifier
  def self.valid?(isbn)
    digits = isbn.scan(/[\dX]/)
    return false if digits.size != 10

    digits[-1] = 10 if digits[-1] == 'X'

    checksum = 0
    digits.map!(&:to_i).each_index do |i|
      checksum += digits[i] * (10 - i)
    end

    (checksum % 11).zero?
  end
end
