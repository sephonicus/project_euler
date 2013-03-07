### Problem:

# A unit fraction contains 1 in the numerator. The decimal representation of the
# unit fractions with denominators 2 to 10 are given:

# 1/2  = 0.5
# 1/3  = 0.(3)
# 1/4  = 0.25
# 1/5  = 0.2
# 1/6  = 0.1(6)
# 1/7  = 0.(142857)
# 1/8  = 0.125
# 1/9  = 0.(1)
# 1/10 = 0.1

# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be
# seen that 1/7 has a 6-digit recurring cycle.

# Find the value of d < 1000 for which 1/d contains the longest recurring cycle
# in its decimal fraction part.

### Notes:

# We know that 1/7 has a six digit repeat, therefore any fractional part that is
# shorter than six digits should be dropped. Any number consisting of a long
# single-digit repeat should likewise be dropped. Unless we find a > six digit
# repeat, d = 7 will yield the longest recurring cycle. Search for groups seven
# digits long that repeat, grow to occupy the distance to the repeat portion,
# then test for extended repetition.

### Solution:

require 'bigdecimal'
require 'set'

BigDecimal::mode(BigDecimal::ROUND_MODE, :truncate)

DENOMINATOR_MIN = 2
DENOMINATOR_MAX = 999
NUMERATOR = BigDecimal.new(1)
DIGITS = 100

$d = 7
$max_repeat = 6

candidates = Set.new
DENOMINATOR_MIN.upto(DENOMINATOR_MAX) do |d|
  digits = NUMERATOR.div(d, DIGITS).to_s('F').split('.').last

  next unless digits.size > $max_repeat

  # move on if the last 50 digits are the same
  next if digits[(-[digits.size, 50].min)..-1].count(digits[-1]) == 50

  (digits.size - $max_repeat + 1).times do |i|
    current = digits[0, $max_repeat]
    if digits =~ /#{current}{2,}/
      candidates.add(d)
    end
  end
end

puts candidates.size
