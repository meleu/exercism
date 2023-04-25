class ListOps
  def self.arrays(array)
    sum = 0
    array.each { |_n| sum += 1 }
    sum
  end

  def self.reverser(array)
    new = []
    last_i = arrays(array) - 1
    array.each_index { |i| new[last_i - i] = array[i] }
    new
  end

  def self.concatter(array1, array2)
    array1 + array2
  end

  def self.mapper(array, &map_block)
    new = []
    array.each { |element| new << map_block.call(element) }
    new
  end

  def self.filterer(array, &filter_block)
    new = []
    array.each { |element| new << element if filter_block.call(element) }
    new
  end

  def self.sum_reducer(array)
    sum = 0
    array.each { |n| sum += n }
    sum
  end

  def self.factorial_reducer(array)
    factorial = 1
    array.each { |n| factorial *= n }
    factorial
  end
end
