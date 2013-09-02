### Problem 46: Goldbach's other conjecture

# It was proposed by Christian Goldbach that every odd composite number can be
# written as the sum of a prime and twice a square.

# 9  = 7  + 2 * 1**2
# 15 = 7  + 2 * 2**2
# 21 = 3  + 2 * 3**2
# 25 = 7  + 2 * 3**2
# 27 = 19 + 2 * 2**2
# 33 = 31 + 2 * 1**2

# It turns out that the conjecture was false.

# What is the smallest odd composite that cannot be written as the sum of a
# prime and twice a square?

### Notes:

# The smallest twice-a-square is 2
# 1 is neither composite nor prime

### Solution:

require 'prime'

SMALLEST = 2

number = 3
loop do
  if number.odd? && !Prime.prime?(number)
    pass = false

    Prime.each do |prime|
      break if prime + SMALLEST > number
      counter = 1
      loop do
        computed = prime + 2 * (counter ** 2)
        pass = true if computed == number
        break if computed >= number
        counter += 1
      end
    end

    unless pass
      p number
      break
    end
  end

  number += 1
end
