require 'enumerable_methods'

module Enumerable

  describe ".my_each" do
    context "multiply each element by 2" do
      it "returns 2,4,6" do
        array = []
        [1,2,3].my_each { |i| array << i * 2}
        expect(array).to eql([2,4,6])
      end
    end

    context "no block given" do
      it "raises LocalJumpError" do
        expect{[1,2,3].my_each}.to raise_error(LocalJumpError)
      end
    end
  end

  describe ".my_each_with_index" do
    context "given index and element" do
      it "returns the index and value of each element" do
        array = []
        [2,4,6].my_each_with_index { |a, b| array << [a,b]}
        expect(array).to eql([[2,0],[4,1],[6,2]])
      end
    end
  end

  describe ".my_select" do
    context "given numbers" do
      it "returns even numbers" do
        array = []
        [1,2,3,4,5].my_select { |n| array << n if n % 2 == 0 }
        expect(array).to eql([2,4])
      end
    end
  end

  describe ".my_all?" do
    context "all have to be less than 10" do
      it "returns true" do
        expect([-1, 0, 9, 5.5].my_all? { |n| n < 10 }).to eql(true)
      end
    end
  end

  describe ""
end
