### Problem:

# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in
# base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include
# (leading zeros.)

### Solution:

require './lib/palindrome'

total = 0

1.upto(999_999) do |i|
  total += i if [i, i.to_s(2)].all? { |n| Palindrome.palindrome?(n) }
end

puts total
