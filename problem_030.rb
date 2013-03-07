### Problem:

# Surprisingly there are only three numbers that can be written as the sum of
# fourth powers of their digits:

# 1634 = 1**4 + 6**4 + 3**4 + 4**4
# 8208 = 8**4 + 2**4 + 0**4 + 8**4
# 9474 = 9**4 + 4**4 + 7**4 + 4**4
# As 1 = 1**4 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers
# of their digits.

### Notes:

# Should only need to go up to lower 6-digit numbers:

# 9 ** 5 * 1 => 59049
# 9 ** 5 * 2 => 118098
# 9 ** 5 * 3 => 177147
# 9 ** 5 * 4 => 236196
# 9 ** 5 * 5 => 295245
# 9 ** 5 * 6 => 354294

### Solution:

total = 0

2.upto(1_000_000 - 1) do |i|
  if i == i.to_s.split('').map { |digit| digit.to_i ** 5 }.inject(&:+)
    total += i
  end
end

puts total
