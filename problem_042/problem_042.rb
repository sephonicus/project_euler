### Problem:

# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so
# the first ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its
# alphabetical position and adding these values we form a word value. For
# example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value
# is a triangle number then we shall call the word a triangle word.

# Using words.txt, a 16K text file containing nearly two-thousand common English
# words, how many are triangle words?

### Notes:

# Find the longest word, multiply by 26 to get the highest necessary triangle
# number to test against. Generate the listing of triangle numbers, then run
# through the word list, performing comparison.

### Solution:

MAPPINGS = Hash[('A'..'Z').to_a.zip((1..26).to_a)]

def nth_triangle_number(n)
  n * (n + 1) / 2
end

def triangles_below(n)
  count = 1
  triangles = []
  while (next_triangle = nth_triangle_number(count)) < n
    triangles << next_triangle
    count += 1
  end
  triangles
end

words = File.read('words.txt').split(',').map { |word| word.gsub(/[^A-Z]/, '') }
longest = words.max_by { |word| word.size }
max_triangle = longest.size * 26
@triangles = triangles_below(max_triangle + 1)

def triangle_word?(word)
  numeric = word.split('').map { |letter| MAPPINGS[letter] }.inject(&:+)
  @triangles.include?(numeric)
end

triangle_word_count = 0
words.each do |word|
  triangle_word_count += 1 if triangle_word?(word)
end

p triangle_word_count
