require_relative "../../../prime/table"
require_relative "../../../prime/table/printer"

describe Prime::Table do

  describe "#print" do
    it "should print the table" do
      printer = Prime::Table::Printer.new(Prime::Table.new(3))
      expect(printer.print).to be == File.open("spec/fixtures/table_2x2.txt").read
      printer = Prime::Table::Printer.new(Prime::Table.new(10))
      expect(printer.print).to be == File.open("spec/fixtures/table_10x10.txt").read
    end
  end

end