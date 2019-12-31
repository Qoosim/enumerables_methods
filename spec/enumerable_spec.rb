require './lib/enumerables'

RSpec.describe Enumerable do
  describe "#my_each" do
    it "returns elements of array if block is given, otherwise enumerator is given " do
    any = 0
    [1, 2, 3, 4, 5].my_each { any += 1 }
    expect(any).to eql(5)
    end
  end

  describe "#my_each_with_index" do
    it "returns element's numerical position" do
      arr = []
      [2, 3, 5, 7].my_each_with_index { |elem, idx| arr << idx}
      expect(arr).to eql([0, 1, 2, 3])
    end
  end

end