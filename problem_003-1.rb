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

# 1) Need a method for determining a prime
# 2) Divide target number by increasing primes, determine if result is prime

def prime?(n)
end

### Tests:

require 'rubygems'
gem 'minitest'
require 'minitest/autorun'

describe 'prime?' do
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
