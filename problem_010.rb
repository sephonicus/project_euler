# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

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

primes_through(2_000_000 - 1)
puts $primes.inject(&:+)
