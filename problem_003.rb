# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600_851_475_143 ?

def prime?(number)
  if number > 2
    current = number - 1
    while current > 1
      return false if number % current == 0
      current -= 1
    end
  end
  true
end

def largest_prime_factor(number)
  if number > 2
    start = (number / 2.0).round
    current = start
    while current > 1
      if number % current == 0
        if prime?(current)
          return current
        end
      end
      current -= 1
    end
  end
end

# puts largest_prime_factor(13195) || 'None found'
# puts largest_prime_factor(600_851_475_143) || 'None found'
