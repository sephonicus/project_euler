# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

### Notes:

# Start candidate solutions at 20. Every number can be divided by 1, so start
# testing using (2..20).

DIVISORS = (2..20).to_a
def divisible_up_to_20?(n)
  DIVISORS.each do |d|
    return false unless n % d == 0
  end
  true
end

candidate = 20
while !divisible_up_to_20?(candidate)
  candidate += 1
  if candidate % 1000000 == 0
    puts "Currently at #{candidate}"
  end
end
puts candidate
