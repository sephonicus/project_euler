### Problem:

# The number, 1406357289, is a 0 to 9 pandigital number because it is made up of
# each of the digits 0 to 9 in some order, but it also has a rather interesting
# sub-string divisibility property.

# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note
# the following:

# d2d3d4  = 406 is divisible by 2
# d3d4d5  = 063 is divisible by 3
# d4d5d6  = 635 is divisible by 5
# d5d6d7  = 357 is divisible by 7
# d6d7d8  = 572 is divisible by 11
# d7d8d9  = 728 is divisible by 13
# d8d9d10 = 289 is divisible by 17

# Find the sum of all 0 to 9 pandigital numbers with this property.

### Notes:

# Total number of pandigitals is 10! = 3628800
# Assuming any final number starting with 0 isn't pandigital

### Solution:

TARGET_DIVISORS = [2, 3, 5, 7, 11, 13, 17]

@total = 0

def divisible?(n)
  digits = n.to_s
  divisible_outcomes = []
  7.times do |i|
    divisible_outcomes[i] = (digits[(i + 1), 3].to_i % TARGET_DIVISORS[i]) == 0
  end
  divisible_outcomes.all? { |outcome| outcome == true }
end

def total_matching_pandigitals(to_choose, chosen = [])
  to_choose.each do |digit|
    remaining = to_choose.dup
    remaining.delete(digit)
    selected  = chosen.dup
    selected.push(digit)
    if remaining.size > 0
      sub = total_matching_pandigitals(remaining.dup, selected.dup)
    else
      joined = selected.join
      unless selected[0] == '0'
        candidate = joined.to_i
        if divisible?(candidate)
           @total += candidate
        end
      end
    end
  end
end

total_matching_pandigitals((0..9).to_a.reverse)
p @total
