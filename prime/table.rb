class Prime
  class Table
    def initialize count
      raise ArgumentError.new("Table size needs to be at least 2x2") unless count > 1
      @count = count
    end

    def primes
      @primes ||= (2...Float::INFINITY).inject([]) do |results, i|
        results.push(i) if i.prime?
        break results if results.length >= @count
        results
      end
    end

    def products
      primes.map{ |x| primes.map{ |y| x*y } }
    end

    def print
      Printer.new(self).print
    end
  end
end

class Integer
  def prime?
    return false if self < 2
    return false if self > 2 && even?
    return false if 2.upto(Math.sqrt(self).floor).find{ |x| self % x == 0 }
    true
  end
end