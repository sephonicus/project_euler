# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

### Notes:

# 3 digit numbers are 100-999, for a total of 900 numbers
# Pick each number, then multiply it by all members of the set, storing the
# maximum value

NUMBERS = (100..999).to_a.freeze

def palindrome?(n)
  digits = n.to_s.split('')
  while digits.size > 1
    first = digits.shift
    last = digits.pop
    return false unless first == last
  end
  true
end

max = 0
NUMBERS.each do |n|
  NUMBERS.each do |m|
    product = n * m
    if product > max && palindrome?(product)
      max = product
    end
  end
end
puts max
