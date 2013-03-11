### Problem:

# If p is the perimeter of a right angle triangle with integral length sides,
# {a,b,c}, there are exactly three solutions for p = 120.

# {20,48,52}, 24,45,51}, 30,40,50}

# For which value of p < 1000, is the number of solutions maximised?

### Solution:

P_LOWER_LIMIT = 3
P_UPPER_LIMIT = 999

max_solutions = []
p_max = nil

P_LOWER_LIMIT.upto(P_UPPER_LIMIT) do |p|
  solutions = []
  1.upto(p - 2) do |a|
    1.upto(p - 2) do |b|
      c = p - a - b
      if a ** 2 + b ** 2 == c ** 2
        solutions << [a, b, c].sort
      end
    end
  end
  solutions.uniq!
  if solutions.size > max_solutions.size
    max_solutions = solutions
    p_max = p
  end
end

puts max_solutions.inspect
puts p_max.inspect
