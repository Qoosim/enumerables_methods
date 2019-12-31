# frozen_string_literal: true

require './lib/enumerables'
RSpec.describe Enumerable do
  let(:arr) { [] }
  describe '#my_each' do
    it 'returns elements of array if block is given, otherwise enumerator is returned' do
      expect([1, 2, 3, 4, 5].my_each { |num| num }).to eql([1, 2, 3, 4, 5])
    end
  end

  describe '#my_each_with_index' do
    it 'returns elements numerical position' do
      [2, 3, 5, 7].my_each_with_index { |_elem, idx| arr << idx }
      expect(arr).to eql([0, 1, 2, 3])
    end
  end

  describe '#my_select' do
    it 'returns elements of an array that passed the block condition' do
      expect([2, 'ant', 3, 'boat', 4, 'cat'].my_select { |item| item.class == String }).to eql(%w[ant boat cat])
    end
  end

  describe '#my_all?' do
    it 'returns true if the block never returns false or nil' do
      expect(%w[ant ball cat dog ram].my_all? { |item| item.size >= 3 }).to eql(true)
    end
  end

  describe '#my_any?' do
    it 'return true if the block ever returns a value other than false or nit' do
      expect(%w[goat chair paper mouse house].my_any? { |item| item.size >= 4 }).to eql(true)
    end
  end

  describe '#my_none?' do
    it 'returns true if the block never returns true for all the element of the array' do
      expect([2, 4, 6, 8, 10].my_none?(&:odd?)).to eql(true)
    end
  end

  describe '#my_count' do
    it 'returns the number of elements yielding a true value' do
      expect([1, 2, 3, 4, 5].my_count(&:even?)).to eql(2)
    end
  end

  describe '#my_map' do
    it 'returns new array with the results of running block once for every elements in the array' do
      [1, 2, 3, 4].my_map { |x| arr << x * x }
      expect(arr).to eql([1, 4, 9, 16])
    end
  end

  describe '#my_inject' do
    it 'returns combined elements of array by applying binary operation specified by block' do
      expect([4, 5, 6, 7, 8, 9, 10].my_inject(0) { |sum, x| sum + x }).to eql(49)
    end
  end
end
