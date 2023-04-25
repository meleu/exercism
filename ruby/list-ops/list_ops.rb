module ListOps
  class << self
    def arrays(array)
      sum = 0
      array.each { |_n| sum += 1 }
      sum
    end

    def reverser(array)
      new = []
      last_i = arrays(array) - 1
      array.each_index { |i| new[last_i - i] = array[i] }
      new
    end

    def concatter(array1, array2)
      array1 + array2
    end

    def mapper(array, &map_block)
      new = []
      array.each { |element| new << map_block.call(element) }
      new
    end

    def filterer(array, &filter_block)
      new = []
      array.each { |element| new << element if filter_block.call(element) }
      new
    end

    def sum_reducer(array)
      sum = 0
      array.each { |n| sum += n }
      sum
    end

    def factorial_reducer(array)
      factorial = 1
      array.each { |n| factorial *= n }
      factorial
    end
  end
end
