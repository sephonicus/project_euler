### Problem:

# We shall say that an n-digit number is pandigital if it makes use of all the
# digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is
# also prime.

# What is the largest n-digit pandigital prime that exists?

### Notes:

# Assuming due to the way the problem was stated that we're leaving out 0 as a
# possibility. If this is the case, then the largest number will be 9 digits.
# The largest 9-digit number containing exactly one of each of the digits is
# 987654321. Therefore, we need to search the set of primes less than this
# number.

# At current rate of processing, this will take > 1 hour. Might be better to
# count down in pandigitals and find the first that is prime.

### Solution:

require 'prime'

MAX = 987_654_321
COMPOSITIONS = Hash[(1..9).map { |i| [i, (1..i).to_a.join] }]

max_candidate = 0

Prime.each do |prime|
  break if prime > MAX
  digits = prime.to_s
  if digits.split(//).sort.join == COMPOSITIONS[digits.size]
    max_candidate = prime
  end
end

puts max_candidate
