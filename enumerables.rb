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

  end

  def my_map

  end

  def my_inject
    
  end
  
end
array_test1 = [2, 5, 6, 3, 8]
array_test2 = [3, 8, 7, 9]
array_test3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array_test1.my_each{|k| print "#{k*2} "}
puts
array_test2.my_each_with_index{|k| print "#{k} "}
puts
print array_test3.my_select{|even| even}
puts
# rubocop:enable all
