# combining_arrays.rb
# Write a method that takes two Arrays as arguments, and returns an Array that
# contains all of the values from the argument Arrays. There should be no
# duplication of values in the returned Array, even if there are duplicates in
# the original Arrays.

# Pseudo-code:

# Data Structure:
# input: two separate arrays
# output: a single array containing all elements from each array, with the
# exception that in the final output there are no duplicate values even if
# there were duplicate values in the original arrays.
# rules:
# no duplicate values

# Algorithm:
# 1) begin by initializing method definition: def merge(array1, array2)
# 2) combine the two arrays with a single '+'
# 3) call the `uniq` method on the combined array

def merge(array1, array2)
  (array1 + array2).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

puts '----'

# Launch School solution:

def merge(array_1, array_2)
  array_1 | array_2
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

