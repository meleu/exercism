# https://exercism.org/tracks/ruby/exercises/rotational-cipher
class RotationalCipher
  def self.rotate(message, key)
    return message unless key != 0 && key != 26

    alphabet_down = ('a'..'z').to_a
    alphabet_up = ('A'..'Z').to_a

    encrypted_chars = message.chars.map do |char|
      case char
      when /[a-z]/
        i = alphabet_down.index(char)
        alphabet_down[(i + key) % 26]
      when /[A-Z]/
        i = alphabet_up.index(char)
        alphabet_up[(i + key) % 26]
      else
        char
      end
    end

    encrypted_chars.join
  end
end
