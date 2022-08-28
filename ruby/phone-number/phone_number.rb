# https://exercism.org/tracks/ruby/exercises/phone-number
class PhoneNumber
  def self.clean(phone_number)
    # scan for digits only and delete the leading 1 (if present)
    clean_number = phone_number.scan(/[0-9]+/).join.sub(/^1/, '')

    # format: NXXNXXXXXX
    # where N is /[2-9]/ and X is /[0-9]/
    if clean_number.length != 10 \
      || clean_number[0].to_i < 2 \
      || clean_number[3].to_i < 2
      return nil
    end

    clean_number
  end
end
