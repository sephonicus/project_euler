# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600_851_475_143 ?

def has_divisors_in_range(n, min, max)
  while min <= max
    return false if n % min == 0
    min += 1
  end
  true
end

def primes_up_to(n)
  primes = []
  return primes if n < 2
  primes << 2
  return primes if n == 3
  primes << 3
  return primes if n == 4

  candidate = 3
  while candidate < n
    candidate += 1
    next if primes.any? { |prime| candidate % prime == 0 }
    max = (Math.sqrt(candidate) + 1).floor
    next if has_divisors_in_range(candidate, primes.last + 1, max)
    primes << candidate
  end
  primes
end

def prime?(n)
  has_divisors_in_range(n, 2, (Math.sqrt(n) + 1).floor)
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

# puts primes_up_to(-1).inspect

# puts prime?(123481232).inspect

# puts largest_prime_factor(13195) || 'None found'
# puts largest_prime_factor(131952342) || 'None found'
# puts largest_prime_factor(600_851_475_143) || 'None found'
