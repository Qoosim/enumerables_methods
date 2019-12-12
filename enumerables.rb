# rubocop:disable all
module Enumerable

  def my_each
    k = 0
    while k < self.size
      yield(self[k])
      k += 1
    end
    self
  end

  def my_each_with_index

  end

  def my_select

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

arr1 = [2, 1, 4, 5, 3, 6, 7]

puts arr1.my_each{|k| k*2}

# rubocop:enable all