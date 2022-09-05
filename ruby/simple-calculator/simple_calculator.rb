# https://exercism.org/tracks/ruby/exercises/simple-calculator
class SimpleCalculator
  class UnsupportedOperation < StandardError
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)

    begin
      "#{first_operand} #{operation} #{second_operand} = #{first_operand.__send__(operation, second_operand)}"
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end
end
