### Problem:

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600_851_475_143 ?

### Notes:

# In number theory, the fundamental theorem of arithmetic, also called the
# unique factorization theorem or the unique-prime-factorization theorem, states
# that every integer greater than 1 is either prime itself or is the product of
# prime numbers

# Dividing a number by a relatively small number yields a larger number.
# Dividing by a relatively large number yields a small number. The crossover
# point is at the square root. Therefore, if a number cannot be divided by the
# primes from 2 to its square root, it is prime itself.

# 1) Write a method for determining if a number is prime or composite
# 2) Calculate primes up to <number> / 2
# 3) Walk down list of primes, determing if any are factors of <number>

MINIMUM_PRIME = 2

$last_tested = 1
$primes = []

def prime?(n)
  return false if n < MINIMUM_PRIME
  return true if (2..3).include?(n)

  max = (Math.sqrt(n) + 1).floor
  if max > $last_tested
    primes_up_to(n)
  end

  current_index = 0
  while $primes[current_index] && $primes[current_index] <= max
    return false if n % $primes[current_index] == 0
    current_index += 1
  end
  true
end

def primes_up_to(n)
  return if n < 2
  primes_count = $primes.count
  while ($last_tested < n) || $primes.count == primes_count
    $last_tested += 1
    $primes << $last_tested if prime?($last_tested)
  end
end
