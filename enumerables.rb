# rubocop:disable all

module Enumerable

  # my_each method that prints the square of every elements in an array 
  def my_each
    k = 0
    while k < size
      yield self[k]
      k += 1
    end
    self
  end

  # my_each_with_index that prints double of each element of a particular position
  def my_each_with_index
    k = 0
    while k < size
      yield(self[k], k)
      k += 1
    end
  end

  # my_select method that outputs even numbers of the given array
  def my_select
    k = 0
    array_result = []
    while k < size
      array_result << self[k] if yield(self[k] % 2 == 0)
      k += 1
    end
    array_result
  end

  def my_all?

  end

  def my_any?

  end

  def my_none?

  end

  def my_count
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

    my_each{ |element| initial_value = yield(initial_value, element)}
    initial_value

  end

  def multiply_els(arr)
    arr.my_inject(1) {|initial, num| initial * num}
  end

end

array_each = [2, 5, 6, 3, 8]
array_index = [3, 8, 7, 9]
array_select = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array_inject = [4, 6, 9, 6, 2]
array_count = [1, 2, 4, 2]
animals = ["cat", "dog", "cow", "ram", "hen"]

array_each.my_each{|k| print "#{k**2} "}
puts
array_index.my_each_with_index{|k| print "#{k} "}
puts
p array_select.my_select{|even| even}
p array_count.my_count{|count| count}
p animals.my_map{|animal| animal.capitalize}
p array_inject.my_inject(0){|sum, num| sum += num}
# p array_inject.multiply_els(1){|initial, num| initial * num}

# rubocop:enable all
