# By starting at the top of the triangle below and moving to adjacent numbers on
# the row below, the maximum total from top to bottom is 23.

#    3
#   7 4
#  2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom in triangle.txt (right click and
# 'Save Link/Target As...'), a 15K text file containing a triangle with one-
# hundred rows.

# NOTE: This is a much more difficult version of Problem 18. It is not possible
# to try every route to solve this problem, as there are 299 altogether! If you
# could check one trillion (1012) routes every second it would take over twenty
# billion years to check them all. There is an efficient algorithm to solve it.
# ;o)

TRIANGLE = File.new('triangle.txt').readlines.map do |line|
  line.strip.split.map(&:to_i)
end

def solution
  @solution ||= []
end

def valid_indices(previous)
  [previous, previous + 1]
end

def random_path
  previous = 0
  @solution = [0]
  (TRIANGLE.size - 1).times do
    previous = valid_indices(previous).sample
    @solution << previous
  end
end

def switchable?(row, index)
  if row > 0 # can't switch if in first row
    # determine where we could possibly switch to
    indices = valid_indices(solution[row - 1])
    indices.delete(index)
    candidate = indices.first
    # is this valid given the current selection in the next row?
    if valid_indices(candidate).include?(solution[row + 1])
      return candidate
    end
  end
end

def optimize
  modified = true
  while modified
    modified = false
    solution.each_with_index do |current_index, triangle_row|
      if candidate_index = switchable?(triangle_row, current_index)
        if TRIANGLE[triangle_row][candidate_index] > TRIANGLE[triangle_row][current_index]
          solution[triangle_row] = candidate_index
          modified = true
        end
      end
    end
  end
end

def solution_value
  total = 0
  solution.each_with_index do |selection, row|
    total += TRIANGLE[row][selection]
  end
  total
end

TRIALS = 1000000

def maximize
  max_value = 0
  TRIALS.times do
    random_path
    optimize
    max_value = solution_value if solution_value > max_value
  end
  max_value
end

puts maximize
