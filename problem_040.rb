### Problem:

# An irrational decimal fraction is created by concatenating the positive
# integers:

# 0.123456789101112131415161718192021...

# It can be seen that the 12th digit of the fractional part is 1.

# If dn represents the nth digit of the fractional part, find the value of the
# following expression.

# d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000

### Solution:

fractional = ''
counter = 1

while fractional.size <= 1_000_000
  fractional += counter.to_s
  counter += 1
end

puts (0..6).to_a.map do |n|
  10 ** n
end.inject(1) do |m, n|
  m = m * fractional[n - 1].to_i
end
