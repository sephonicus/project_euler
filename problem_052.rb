### Problem 52: Permuted multiples

# It can be seen that the number, 125874, and its double, 251748, contain
# exactly the same digits, but in a different order.

# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x,
# contain the same digits.

### Solution:

candidates = Hash.new { |hash, key| hash[key] = key.to_s.split('').sort.join }
current = 1

print 'Searching'
loop do
  print '.' if current % 1000 == 0

  if candidates[current] == candidates[current * 2] &&
     candidates[current] == candidates[current * 3] &&
     candidates[current] == candidates[current * 4] &&
     candidates[current] == candidates[current * 5] &&
     candidates[current] == candidates[current * 6]
    puts "\n#{current}"
    break
  end

  current += 1
end
