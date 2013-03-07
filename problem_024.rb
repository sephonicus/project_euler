### Problem:

# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:

# 012 021 102 120 201 210

# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
# 5, 6, 7, 8 and 9?

### Solution:

DIGITS  = (0..9).to_a
LOWEST  = DIGITS.join.to_i
HIGHEST = DIGITS.reverse.join.to_i

current = LOWEST
permutation_count = 1
while current <= HIGHEST
  current += 1
  current_digits = current.to_s.rjust(10, '0').split('').map(&:to_i)
  if (DIGITS - current_digits).empty?
    permutation_count += 1
    if permutation_count == 1_000_000
      puts current_digits.join
    end
  end
end
