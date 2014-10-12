### Problem:

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the
# multiples of 3 or 5 below 1000.

### Notes:

# Numbers divisible by 3 can be found by counting up from 3, e.g. 3, 6, 9...
# Numbers divisible by 5 can be found by counting up from 5, e.g. 5, 10, 15...
# Numbers divisible by both can be found by counting by their product, 15
# The sum of multiples below a threshold value can be found by taking the sum
# of each individually then subtracting one set of common products.
# These progressions can be represented as n(1+2+3...)
# The sum of natural numbers up to x can be represented: x * (x + 1) / 2
# The threshold can be found by dividing by n

### Solution:

UPPER_BOUND = 999

def natural_sum(max)
  max * (max + 1) / 2
end

def multiple_sum(multiple)
  threshold = UPPER_BOUND / multiple
  multiple * natural_sum(threshold)
end

puts multiple_sum(3) + multiple_sum(5) - multiple_sum(15)
