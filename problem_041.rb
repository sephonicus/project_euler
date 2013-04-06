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

# All 9-digit pandigitals can be found by taking the permutations of 1-9.
# All 8-digit pandigitals can be found by taking the permutations of 1-8.
# ...
# Yields 9! + 8! + ... 1! = 409113 possibilities

### Solution:

require 'prime'

def largest_pandigital_prime(to_choose, chosen = [])
  to_choose.each do |digit|
    remaining = to_choose.dup
    remaining.delete(digit)
    selected  = chosen.dup
    selected.push(digit)
    if remaining.size > 0
      sub = largest_pandigital_prime(remaining.dup, selected.dup)
      return sub if sub
    else
      candidate = selected.join.to_i
      if Prime.prime?(candidate)
        return candidate
      end
    end
  end
  return nil
end

top = 9
answer = nil
while top > 0 && !answer
  output = largest_pandigital_prime((1..top).to_a.reverse)
  answer = output if output
  top -= 1
end

p answer
