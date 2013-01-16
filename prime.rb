require_relative "prime/table"
require_relative "prime/table/printer"

puts Prime::Table.new(ARGV.first.to_i).print