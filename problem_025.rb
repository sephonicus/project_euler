### Problem:

# The Fibonacci sequence is defined by the recurrence relation:

# Fn = Fn1 + Fn2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.

# What is the first term in the Fibonacci sequence to contain 1000 digits?

### Solution:

DIGIT_MAX = 1000

first = second = 1
third = first + second
terms = 3

loop do
  first  = second + third
  second = first  + third
  third  = first  + second
  if third.to_s.size >= DIGIT_MAX
    [first, second, third].each do |term|
      terms += 1
      break if term.to_s.size > 999
    end
    break
  else
    terms += 3
  end
end

puts terms
