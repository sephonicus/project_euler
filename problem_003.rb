### Problem:

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600_851_475_143?

### Notes:

# A number divided by a small factor yields a large factor, and vice versa. As
# the small factor is incremented, the large decreases. The crossover point is
# the square root.

### Solution:

require 'prime'

def largest_prime_factor(n)
  greatest = nil
  square_root = Math.sqrt(n).to_i
  divisor = 2
  while divisor < square_root
    if n % divisor == 0
      greater_factor = n / divisor
      return greater_factor if Prime.prime?(greater_factor)
      greatest = divisor if Prime.prime?(divisor)
    end
    divisor += 1
  end
  greatest
end

puts largest_prime_factor(600_851_475_143)
