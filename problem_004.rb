### Problem:

# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

### Notes:

# 3 digit numbers are 100-999, for a total of 900 numbers
# Pick each number, then multiply it by all members of the set, storing the
# maximum value

### Solution:

require './lib/palindrome'

NUMBERS = (100..999).to_a.freeze

max = 0
NUMBERS.each do |n|
  NUMBERS.each do |m|
    product = n * m
    if product > max && Palindrome.palindrome?(product)
      max = product
    end
  end
end
puts max
