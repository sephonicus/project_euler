### Problem:

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600_851_475_143 ?

### Notes:

# In number theory, the fundamental theorem of arithmetic, also called the
# unique factorization theorem or the unique-prime-factorization theorem, states
# that every integer greater than 1 is either prime itself or is the product of
# prime numbers

# Dividing a number by a relatively small number yields a larger number.
# Dividing by a relatively large number yields a small number. The crossover
# point is at the square root. Therefore, if a number cannot be divided by the
# primes from 2 to its square root, it is prime itself.

# 1) Write a method for determining if a number is prime or composite
# 2) Calculate primes up to <number> / 2
# 3) Walk down list of primes, determing if any are factors of <number>

def prime?(n)
  min = 2
  return false if n < min
  max = (Math.sqrt(n) + 1).floor
  return false if max < min
  return true if max == n

  while min <= max
    return false if n % min == 0
    min += 1
  end
  true
end

$last_tested = 1
$primes = []

def primes_up_to(n)
  return [] if n < 3
  unless n <= $last_tested
    while $last_tested < (n - 1)
      $last_tested += 1
      $primes << $last_tested if prime?($last_tested)
    end
  end
  $primes.select { |prime| prime < n }
end

### Tests:

require 'rubygems'
gem 'minitest'
require 'minitest/autorun'

describe 'prime?(number)' do
  it 'returns false when passed numbers less than 2' do
    prime?(1).must_equal  false
    prime?(0).must_equal  false
    prime?(-1).must_equal false
    prime?(-2).must_equal false
  end
  it 'returns false when passed a composite numbers' do
    prime?(4).must_equal false
  end
  it 'returns true when passed prime numbers' do
    prime?(2).must_equal  true
    prime?(7).must_equal  true
    prime?(29).must_equal true
  end
end

describe 'primes_up_to(number)' do
  it 'returns an empty list when no primes are found' do
    primes_up_to(1).must_equal []
  end
  it 'returns an ordered list of primes less than given maximum' do
    primes_up_to(30).must_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    primes_up_to(29).must_equal [2, 3, 5, 7, 11, 13, 17, 19, 23]
  end
end
