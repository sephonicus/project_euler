### Problem:

# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n). If d(a) = b and d(b) = a, where a != b, then a and
# b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
# and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71
# and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

### Solution:

require 'prime'

UPPER_BOUND = 10000

def factors(n)
  output = []
  return output if n < 1
  crossover = (Math.sqrt(n) + 1).to_i
  1.upto(crossover) do |i|
    if n % i == 0
      output << i << n / i
    end
  end
  output.sort.uniq
end

def d(n)
  factors_of_n = factors(n)
  factors_of_n.pop if factors_of_n.size > 0
  factors_of_n.inject(&:+) || 1
end

amicable = []
1.upto(10000) do |i|
  di = d(i)
  ddi = d(di)
  unless i == di
    if i == ddi
      amicable << i << di
    end
  end
end

puts amicable.uniq.inject(&:+)
