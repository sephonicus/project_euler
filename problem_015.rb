### Problem:

# Starting in the top left corner of a 2x2 grid, and only being able to move to
# the right and down, there are exactly 6 routes to the bottom right corner.

# How many such routes are there through a 20x20 grid?

### Notes:

# The distance to be traversed is the sum of the grid edge lengths. Each unit
# requires a binary decision between down or right. Can think of the problem as
# a pool of 20 of each type of move, determine the permutations.
