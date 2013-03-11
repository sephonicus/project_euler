### Problem:

# The number 3797 has an interesting property. Being prime itself, it is
# possible to continuously remove digits from left to right, and remain prime at
# each stage: 3797, 797, 97, and 7. Similarly we can work from right to left:
# 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to
# right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

### Solution:

require 'prime'

TARGET_COUNT = 11
FIRST_POSSIBLE = 11
BLOCK_SIZE = 1000
DIVISORS = Hash.new { |h, k| h[k] = 10 ** (k - 1) }

def ltr_truncatable?(n)
  size = n.to_s.size
  if size > 1
    n.prime? && ltr_truncatable?(n % DIVISORS[size])
  else
    n.prime?
  end
end

def rtl_truncatable?(n)
  size = n.to_s.size
  if size > 1
    n.prime? && rtl_truncatable?(n / 10)
  else
    n.prime?
  end
end

def left_to_right?(n)
  size = n.to_s.size
  (size - 1).times do
    n = n % DIVISORS[size]
    return false unless n.prime?
    size -= 1
  end
  true
end

def right_to_left?(n)
  size = n.to_s.size
  (size - 1).times do
    n = n / 10
    return false unless n.prime?
  end
  true
end

truncatable = []
current = FIRST_POSSIBLE

while truncatable.size < TARGET_COUNT
  BLOCK_SIZE.times do
    if current.prime?
      if ltr_truncatable?(current) && rtl_truncatable?(current)
        truncatable << current
      end
    end
    current += 1
  end
end

puts truncatable.inspect
# [23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]
puts truncatable.inject(&:+)
# 748317
