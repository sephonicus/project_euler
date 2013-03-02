### Problem:

# By starting at the top of the triangle below and moving to adjacent numbers
# on the row below, the maximum total from top to bottom is 23.

#    3
#   7 4
#  2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom of the triangle below:

#               75
#              95 64
#             17 47 82
#            18 35 87 10
#           20 04 82 47 65
#          19 01 23 75 03 34
#         88 02 77 73 07 63 67
#        99 65 04 28 06 16 70 92
#       41 41 26 56 83 40 80 70 33
#      41 48 72 33 47 32 37 16 94 29
#     53 71 44 65 25 43 91 52 97 51 14
#    70 11 33 28 77 73 17 78 39 68 17 57
#   91 71 52 38 17 14 91 43 58 50 27 29 48
#  63 66 04 68 89 53 67 30 73 16 69 87 40 31
# 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

# NOTE: As there are only 16384 routes, it is possible to solve this problem by
# trying every route. However, Problem 67, is the same challenge with a
# triangle containing one-hundred rows; it cannot be solved by brute force, and
# requires a clever method! ;o)

TRIANGLE = [
  [75],
  [95, 64],
  [17, 47, 82],
  [18, 35, 87, 10],
  [20,  4, 82, 47, 65],
  [19,  1, 23, 75,  3, 34],
  [88,  2, 77, 73,  7, 63, 67],
  [99, 65,  4, 28,  6, 16, 70, 92],
  [41, 41, 26, 56, 83, 40, 80, 70, 33],
  [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
  [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
  [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
  [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
  [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
  [ 4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60,  4, 23]
]

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

TRIALS = 1000

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
