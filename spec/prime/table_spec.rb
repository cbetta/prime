require_relative "../../prime/table"
require_relative "../../prime/table/printer"

describe Prime::Table do

  describe "#initialize" do
    it "should require a count > 1" do
      expect(->{ Prime::Table.new(0) }).to raise_error(ArgumentError)
      expect(->{ Prime::Table.new(1) }).to raise_error(ArgumentError)
    end
  end

  context "given an instance" do
    before do
      @count = 3
      @table = Prime::Table.new(@count)
    end

    describe "#primes" do
      it "should load the first X primes" do
        expect(@table.primes).to be == [2, 3, 5]
      end
    end

    describe "#products" do
      it "should product the product table of the primes" do
        expect(@table.products).to be == [[4, 6, 10], [6, 9, 15], [10, 15, 25]]
      end
    end

    describe "#print" do
      it "should print the table" do
        expect(@table.print).to be == File.open("spec/fixtures/table_2x2.txt").read
      end
    end
  end

end

describe Integer do

  describe "#prime?" do
    it "should only be true if the number is a prime" do
      expect(0).not_to be_prime
      expect(1).not_to be_prime
      expect(2).to be_prime
      expect(3).to be_prime
      expect(4).not_to be_prime
      expect(5).to be_prime
      expect(6).not_to be_prime
      expect(7).to be_prime
      expect(8).not_to be_prime
      expect(9).not_to be_prime
    end
  end

end