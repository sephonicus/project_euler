### Problem:

# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of 28
# would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than
# n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers is
# less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.

### Solution:

SMALLEST_ABUNDANT = 12
SMALLEST_SUMMABLE = SMALLEST_ABUNDANT * 2
GREATEST_UNKNOWN = 28123

def factors(n)
  unless n < 1
    listing = []
    1.upto(Math.sqrt(n).to_i) do |i|
      listing.push(i, n / i) if n.modulo(i).zero?
    end
    listing.uniq.sort
  end
end

def proper_divisors(n)
  if divisors = factors(n)
    divisors.tap(&:pop)
  end
end

def abundant?(n)
  proper_divisors(n).inject(&:+) > n
end

def abundant_through(n)
  unless n < SMALLEST_ABUNDANT
    listing = []
    SMALLEST_ABUNDANT.upto(n) do |i|
      listing.push(i) if abundant?(i)
    end
    listing
  end
end

def abundants
  @abundants ||= abundant_through(GREATEST_UNKNOWN)
end

def abundant_summable?(n)
  unless n < SMALLEST_SUMMABLE
    midpoint = (n / 2).to_i
    possible_addends = abundants.select { |i| i <= midpoint }
    possible_addends.each do |addend|
      return true if abundants.include?(n - addend)
    end
  end
  false
end

puts (1..GREATEST_UNKNOWN).select { |i| !abundant_summable?(i) }.inject(&:+) # 4179871

# gah, 22 minutes
