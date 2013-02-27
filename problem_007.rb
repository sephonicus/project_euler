# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.

# What is the 10 001st prime number?

MINIMUM_PRIME = 2

$last_tested = 1
$primes = []

def prime?(n)
  return false if n < MINIMUM_PRIME
  return true if (2..3).include?(n)

  max = (Math.sqrt(n) + 1).floor
  if max > $last_tested
    primes_through(n)
  end

  current_index = 0
  while $primes[current_index] && $primes[current_index] <= max
    return false if n % $primes[current_index] == 0
    current_index += 1
  end
  true
end

def primes_through(n)
  return if n < 2
  primes_count = $primes.count
  while ($last_tested < n) || $primes.count == primes_count
    $last_tested += 1
    $primes << $last_tested if prime?($last_tested)
  end
end

candidate_max = 1000
while $primes.size < 10002
  primes_through(candidate_max)
  candidate_max += 1000
end
puts $primes[10000]
