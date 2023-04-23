# halvsies.rb
# Write a method that takes an Array as an argument, and returns two Arrays (as
# a pair of nested Arrays) that contain the first half and second half of the
# original Array, respectively. If the original array contains an odd number of
# elements, the middle element should be placed in the first half Array.

# Pseudo-code:

# Data Structure:
# input: an array
# output: two arrays which are nested in a single array, with the first array
# containing the first half of the original array and the second array
# containing the second half.
# rules:
# for an array with an odd number of elements, put the middle element in the 
# first array.

# Algorithm:
# 1) begin by initializing the method definition: def halvsies(array)
# 2) get the size of the array and divide by two: halfer = array.size / 2
# 3) next use a conditional to determine whether the array size is odd or
# even; if odd then [array[0, halfer+1], array[(halfer+1)..-1]]; if even, then
# [array[0, halfer], array[halfer..-1]]

def halvsies(array)
  halfer = array.size / 2

  if array.size.even?
    [array[0, halfer], array[halfer..-1]]
  else
    [array[0, (halfer + 1)], array[(halfer + 1)..-1]]
  end
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]

puts '------'

# Launch School solution:

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]


