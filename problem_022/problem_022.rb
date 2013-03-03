### Problem:

# Using names.txt, a 46K text file containing over five-thousand first names,
# begin by sorting it into alphabetical order. Then working out the alphabetical
# value for each name, multiply this value by its alphabetical position in the
# list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
# would obtain a score of 938  53 = 49714.

# What is the total of all the name scores in the file?

### Solution:

MAPPINGS = Hash[('A'..'Z').zip(1..26)]

ordered_names = File.read('names.txt').split(',').map do |name|
  name.gsub(/[^A-Z]/, '')
end.sort

total = 0
ordered_names.each_with_index do |name, i|
  total += name.split('').map { |c| MAPPINGS[c] }.inject(&:+) * (i + 1)
end

puts total
