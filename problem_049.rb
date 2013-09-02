### Problem 49: Prime permutations

# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
# increases by 3330, is unusual in two ways: (i) each of the three terms are
# prime, and, (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this
# sequence?

### Notes:

# Precompute lists of primes keyed by permutation index (sorted digits).

### Solution:

require 'prime'

four_digit_primes = []
Prime.each do |prime|
  break if prime >= 10000
  if prime > 999 && prime < 10000
    four_digit_primes << prime
  end
end

prime_permutations = {}
four_digit_primes.each do |prime|
  index = prime.to_s.split('').sort.join
  prime_permutations[index] ||= []
  prime_permutations[index] << prime
end
prime_permutations.select! { |index, listing| listing.size >= 3 }

prime_permutations.each do |_, listing|
  0.upto(listing.size - 3) do |first_position|
    first_position.upto(listing.size - 2) do |second_position|
      second_position.upto(listing.size - 1) do |third_position|
        first = listing[first_position]
        second = listing[second_position]
        third = listing[third_position]
        if second - first == 3330 && third - second == 3330
          p [first, second, third].join
        end
      end
    end
  end
end

# "148748178147"
# "296962999629"
