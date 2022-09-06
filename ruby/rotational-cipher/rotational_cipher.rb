# https://exercism.org/tracks/ruby/exercises/rotational-cipher
class RotationalCipher
  ALPHABET_ARRAY_UP = ('A'..'Z').to_a
  ALPHABET_ARRAY_DOWN = ('a'..'z').to_a
  ALPHABET = (ALPHABET_ARRAY_DOWN + ALPHABET_ARRAY_UP).join

  def self.rotate(message, key)
    return message unless key != 0 && key != 26

    message.tr(ALPHABET, (ALPHABET_ARRAY_DOWN.rotate(key) + ALPHABET_ARRAY_UP.rotate(key)).join)
  end
end
