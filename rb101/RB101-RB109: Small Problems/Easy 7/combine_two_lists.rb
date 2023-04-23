# combine_two_lists.rb
# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

# Pseudo-code:

# Data Structure:
# inputs: two non-empty arrays with the same number of elements.
# outputs: new array containing all elements from both input arrays, and with
# the elements of each array taken in alternation.

# Algorithm:
# 1) begin by initializing the method definition: def interleave(array1,
# array2)
# 2) define the new array as an empty array
# 3) define a while loop that loops while the input arrays are non-empty.
# 4) shove an element from array1 using the `shift` method on array1; then
# do the same thing for array2.
# 5) return the new array

def interleave(array_one, array_two)
  new_array = []
  until array_one.empty?
    new_array << array_one.shift
    new_array << array_two.shift
  end
  new_array
end

puts interleave([1, 2, 3], ['a', 'b', 'c'])  == [1, 'a', 2, 'b', 3, 'c']

puts '------'

# Launch School solution:

def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts '------'

# Further Exploration:
# Take a few minutes to read about `Array#zip`. `#zip` doesn't do the same
# thing as `interleave`, but it is very close, and more flexible. In fact,
# `interleave` can be implemented in terms of `zip` and one other method from
# the `Array` class. See if you can rewrite `interleave` to use `zip`.

def interleave(array1, array2)
  array1.zip(array2).flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
