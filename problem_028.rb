### Problem:

# Starting with the number 1 and moving to the right in a clockwise direction a
# 5x5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral
# formed in the same way?

### Solution:

class Grid
  DIMENSION = 1001
  MOVEMENT = {
    left:  [0, -1],
    down:  [1,  0],
    right: [0,  1],
    up:    [-1, 0],
  }

  attr_accessor :contents, :bounds, :row, :column, :direction

  def initialize
    @contents = Array.new(DIMENSION) { Array.new(DIMENSION) }
    @direction = :left
    @bounds = {
      left:  0,
      down:  @contents.size - 1,
      right: @contents.size - 1,
      up:    1,
    }
    @row = 0
    @column = @contents.size - 1

    populate
  end

  def horizontal?
    [:left, :right].include?(direction)
  end

  def switch_needed?
    bounds[direction] == (horizontal? ? column : row)
  end

  def switch_direction
    self.direction = case direction
    when :left
      bounds[:left] += 1
      :down
    when :down
      bounds[:down] -= 1
      :right
    when :right
      bounds[:right] -= 1
      :up
    when :up
      bounds[:up] += 1
      :left
    end
  end

  def populate
    (DIMENSION ** 2).downto(1) do |i|
      contents[row][column] = i
      switch_direction if switch_needed?
      self.row = row + MOVEMENT[direction].first
      self.column = column + MOVEMENT[direction].last
    end
  end

  def diagonal_total
    total = 0
    0.upto(DIMENSION - 1) do |i|
      total += contents[i][i]
      total += contents[i][DIMENSION - 1 - i]
    end
    total - 1
  end
end

grid = Grid.new
puts grid.diagonal_total
