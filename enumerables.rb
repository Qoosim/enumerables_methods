# rubocop:disable all

module Enumerable

  # my_each method that prints the square of every elements in an array 
  def my_each
    return to_enum(:my_each) unless block_given?

    k = 0
    while k < size
      yield self[k]
      k += 1
    end
    self
  end

  # my_each_with_index that prints double of each element of a particular position
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    k = 0
    while k < size
      yield(self[k], k)
      k += 1
    end
  end

  # my_select method that outputs even numbers of the given array
  def my_select
    return to_enum(:my_select) unless block_given?

    k = 0
    array_result = []
    while k < size
      array_result << self[k] if yield(self[k] % 2 == 0)
      k += 1
    end
    array_result
  end

  def my_all?(*arg)
    return grep(arg.first).length == size unless arg.empty?

    my_each { |el| return false unless yield(el) } if block_given?

    my_each { |el| return false unless el } unless block_given?

    true
  end

  def my_any?(*arg)
    return !grep(arg.first).empty? unless arg.empty?

    my_each { |el| return true if yield(el) } if block_given?

    my_each { |el| return true if el } unless block_given?

    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    k = 0
    while k < size
      return false if yield(self[k])
      k += 1
    end
    true
  end

  def my_count
    return to_enum(:my_count) unless block_given?

    k = 0
    kounter = 0
    while k < size
      kounter += 1 if yield(self[k])
      k += 1
    end
    kounter
  end

  # my_map method that output the trasformed of a given array
  def my_map
    return to_enum(:my_map) unless block_given?

    k = 0
    trans_array = []
    while k < size
      trans_array << yield(self[k])
      k += 1
    end
    trans_array
  end

  # my_inject method that prints the sum of all the elements of a given array
  def my_inject(initial_value)
    return to_enum(:my_inject) unless block_given?

    my_each{ |element| initial_value = yield(initial_value, element)}
    initial_value

  end

end

def multiply_els(arr)
  arr.my_inject(1) {|initial, num| initial * num}
end

array_each = [2, 5, 6, 3, 8]
array_index = [3, 8, 7, 9]
array_select = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array_inject = [4, 6, 9, 6, 2]
array_count = [1, 2, 4, 2]
array_all = ['animal', 'mamma', 'reptile', 'cat', 'fish']
animals = ["cat", "dog", "cow", "ram", "hen"]
my_proc = Proc.new {|k| k*2}

p array_all.my_all?{|word| word.size <= 5}
array_each.my_each{|k| print "#{k**2} "}
puts
array_index.my_each_with_index{|k| print "#{k} "}
puts
p array_select.my_select{|even| even}
p array_count.my_count{|count| count}
p animals.my_map{|animal| animal.capitalize}
p array_each.my_map(&my_proc)
p array_inject.my_inject(0){|sum, num| sum += num}
p multiply_els(array_inject)


# rubocop:enable all
