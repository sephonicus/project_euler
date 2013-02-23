# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600_851_475_143 ?

def prime?(number)
  if number > 3
    current = number - 1
    while current > 1
      return false if number % current == 0
      current -= 1
    end
  end
  true
end

def largest_prime_factor(n)
  largest = nil
  if n > 3
    current = 2
    max = (Math.sqrt(n) + 1).floor
    while current < max
      if n % current == 0
        factor = n / current
        puts "#{current} and #{factor} are factors"
        return factor if prime?(factor)
        largest = current if prime?(current)
      end
      current += 1
    end
  end
  largest
end

puts prime?(123481232).inspect

# puts largest_prime_factor(13195) || 'None found'
# puts largest_prime_factor(131952342) || 'None found'
# puts largest_prime_factor(600_851_475_143) || 'None found'
