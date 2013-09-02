### Problem 50: Consecutive prime sum

# The prime 41, can be written as the sum of six consecutive primes:

# 41 = 2 + 3 + 5 + 7 + 11 + 13 This is the longest sum of consecutive primes
# that adds to a prime below one-hundred.

# The longest sum of consecutive primes below one-thousand that adds to a prime,
# contains 21 terms, and is equal to 953.

# Which prime, below one-million, can be written as the sum of the most
# consecutive primes?

### Notes:

# Assume solution has at least 22 terms and is > 953.
# Top range can be calculated by performing sliding addition.

### Solution:

require 'prime'

MINIMUM_TERMS = 22
MAX_PRIME

primes = []
Prime.each do |prime|
  primes << prime
  next if primes.size < 22

  start_index = primes.size - MINIMUM_TERMS
  stop_index = primes.size - 1
  break if primes.slice(start_index..stop_index).inject(&:+) >= MAX_PRIME
end

solution_size = MINIMUM_TERMS
while solution_size < primes.size
  start_index = 0
  stop_index = solution_size

  while stop_index < primes.size - 1
    sum = primes.slice(start_index..stop_index).inject(&:+)
    break if sum >= MAX_PRIME
    if Prime.prime?(sum)
      p sum
    end

    start_index += 1
    stop_index += 1
  end

  solution_size += 1
end

# ...
# 997651
