# https://exercism.org/tracks/ruby/exercises/crypto-square
class Crypto
  def initialize(plaintext)
    @plaintext = plaintext
  end

  def ciphertext
    encrypted_array = []
    buffer = @plaintext.downcase.gsub(/[^a-z0-9]/, '')
    columns = Math.sqrt(buffer.size).ceil
    rows = Math.sqrt(buffer.size).round
    buffer = buffer.ljust(columns * rows)
    chunks = buffer.scan(/.{#{columns}}/)
    encrypted_chunk = ''

    columns.times do |i|
      chunks.each do |chunk|
        encrypted_chunk += chunk[i]
      end
      encrypted_array << encrypted_chunk
      encrypted_chunk = ''
    end
    encrypted_array.join(' ')
  end
end
