### Problem:

# The sequence of triangle numbers is generated by adding the natural numbers.
# So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first
# ten terms would be:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

# 1:  1
# 3:  1,3
# 6:  1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28

# We can see that 28 is the first triangle number to have over five divisors.

# What is the value of the first triangle number to have over five hundred
# divisors?

### Notes:

# The nth triangle number can be determined using n * (n + 1) / 2

### Solution:

def nth_triangle_number(n)
  n * (n + 1) / 2
end

def num_factors(n)
  return unless n > 0
  return 1 if n == 1
  count = 0
  square_root = Math.sqrt(n)
  finish = square_root.to_i
  if square_root == finish # root is a factor
    count += 1
    finish -= 1
  end
  1.upto(finish) do |i|
    count += 2 if n % i == 0
  end
  count
end

element = 0
loop do
  element += 1
  triangle_number = nth_triangle_number(element)
  if num_factors(triangle_number) > 500
    puts triangle_number
    break
  end
end
