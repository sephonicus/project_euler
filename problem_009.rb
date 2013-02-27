# A Pythagorean triplet is a set of three natural numbers, a  b  c, for which,

# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

### Notes:

# 1) Determine the 3-member sets of numbers that add up to 1000
# 2) Substitute those into the Pythagorean Theorem until the triplet is found
# 3) Find the product

NUMBERS = (1..998).to_a.freeze

sets = []
NUMBERS.each do |n|
  NUMBERS.each do |o|
    sets << [n, o, 1000 - n - o]
  end
end

triplet = nil
sets.each do |set|
  if set[0]**2 + set[1]**2 == set[2]**2
    triplet = set
  end
end

puts triplet.inject(&:*)
