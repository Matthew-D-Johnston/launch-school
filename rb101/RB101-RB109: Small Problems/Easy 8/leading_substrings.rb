# leading_substrings.rb
# Write a method that returns a list of all substrings of a string that start
# at the beginning of the original string. The return value should be arranged
# in order from shortest to longest substring.

# Pseudo-code:

# Data Structure:
# input: a string
# output: an array of substrings that start at the beginning of the original
# string;
# rules: the return value should be arranged in order from shortest to longest
# substring.

# Algorithm:
# 1) initialize method definition: def substrings_at_start(string)
# 2) define a results array: substrings = []
# 3) use `upto` method to count from 1 up until the size of the string; within
#    the block, use the slice method to create the individual substrings and
#    push them to the substrings array.

def substrings_at_start(string)
  substrings = []
  1.upto(string.size) do |num|
    substrings << string.slice(0, num)
  end
  substrings
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

puts '-----'

# Launch School solution:

def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
