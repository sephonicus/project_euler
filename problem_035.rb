### Problem:

# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71,
# 73, 79, and 97.

# How many circular primes are there below one million?

### Solution:

require 'prime'

FIRST_PRIME = 2
LIMIT = 999_999

circular_primes = []

def rotations(n)
  output = []
  digits = n.to_s.split('').map(&:to_i)

  (digits.size - 1).times do
    digits.unshift(digits.pop)
    output << digits.join.to_i
  end

  output
end

FIRST_PRIME.upto(LIMIT) do |i|
  if Prime.prime?(i)
    if i < 10
      circular_primes << i
    else
      variants = rotations(i)
      if variants.all? { |rotation| Prime.prime?(rotation) }
        circular_primes << i << variants
      end
    end
  end
end

puts circular_primes.flatten.uniq.count
