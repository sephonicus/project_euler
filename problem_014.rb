### Problem:

# The following iterative sequence is defined for the set of positive integers:

# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

# It can be seen that this sequence (starting at 13 and finishing at 1) contains
# 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
# that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

### Notes:

# Due to the nature of the sequence, known values can be cached.

### Solution:

def next_in_sequence(n)
  if n.even?
    n / 2
  else
    3 * n + 1
  end
end

max_length = 0
max_number = nil

1.upto(999_999) do |i|
  length = 1
  number = i
  while i != 1
    length += 1
    i = next_in_sequence(i)
  end
  if length > max_length
    max_length = length
    max_number = number
  end
end

puts max_length
puts max_number
