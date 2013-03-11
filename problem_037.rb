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

class Integer
  def truncatable?
    self.prime? && (self.to_s.size == 1 || yield(self))
  end

  def ltr_truncatable?
    self.truncatable? { |n| (n % (10 ** (n.to_s.size - 1))).ltr_truncatable? }
  end

  def rtl_truncatable?
    self.truncatable? { |n| (n / 10).rtl_truncatable? }
  end
end

TARGET_COUNT = 11
FIRST_POSSIBLE = 11
BLOCK_SIZE = 1000

truncatable = []
current = FIRST_POSSIBLE

while truncatable.size < TARGET_COUNT
  BLOCK_SIZE.times do
    truncatable << current if current.ltr_truncatable? && current.rtl_truncatable?
    current += 1
  end
end

puts truncatable.inspect
# [23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]
puts truncatable.inject(&:+)
# 748317
