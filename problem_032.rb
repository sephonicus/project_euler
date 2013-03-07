### Problem:

# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
# through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
# multiplicand, multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity
# can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only
# include it once in your sum.

### Notes:

# Any number multiplied by 1 will be that number, breaking the pandigitaliness.
# So, start with 2. The number of digits in multiplicand/multiplier/product will
# be < 10, meaning multiplicand/multiplier combo should be == 5 digits total.

### Solution:

require 'set'

TARGET = '123456789'

$numbers = Set.new

def pandigital?(multiplicand, multiplier)
  product = multiplicand * multiplier
  digits = [multiplicand, multiplier, product].join
  if digits.size == 9
    if digits.split('').sort.join == TARGET
      $numbers.add(product)
    end
  end
end

10.upto(99) do |i|
  100.upto(999) do |j|
    pandigital?(i, j)
  end
end

2.upto(9) do |i|
  1000.upto(9999) do |j|
    pandigital?(i, j)
  end
end

puts $numbers.inject(&:+)
