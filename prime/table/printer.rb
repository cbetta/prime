require 'delegate'

class Prime
  class Table
    class Printer < SimpleDelegator
      COLUMN_WIDTH = 5

      def print
        [header, product_rows].join("\n")
      end

      private

      def header
        [vertical_primes, divider]
      end

      def product_rows
        products.each_with_index.map do |product, i|
          row product.dup.unshift("#{primes[i]} |")
        end
      end

      def vertical_primes
        row primes.dup.unshift("|")
      end

      def divider
        row Array.new(primes.length+1) { "-" * COLUMN_WIDTH }
      end

      def row elements
        elements.map{ |element| pad element }.join("\t")
      end

      def pad element
        element.to_s.rjust(COLUMN_WIDTH, ' ')
      end
    end
  end
end