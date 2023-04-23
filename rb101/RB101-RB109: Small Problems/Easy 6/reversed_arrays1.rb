# reversed_arrays1.rb
# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed into this method. The return value
# should be the same Array object.

# You may not use `Array#reverse` or `Array#reverse!`.

# Pseudo-code:

# Data Structure:
# input: an array
# output: the same array but with the elements in reverse order
# rules:
# should be the same Array object;
# and cannot use `reverse` or `reverse!`

# Algorithm:
# Begin by initializing the method definition: def reverse_array!(array)
# I think I will need to do a loop that iterates the following code:
# array[index] = array[-(index+1)] where index is originally defined as 0, and
# counts up until it is equal to half the length of the array, or half the
# length of the array minus 1 in the case of an array whose length is an odd
# number. Once the index hits this level, the loop is exited.

def reverse_array!(array)
  return array if array.size <= 1

  index = 0
  loop do
    array[index], array[-(index + 1)] = array[-(index + 1)], array[index]
    array.size.even? ? length = array.size / 2 : length = (array.size - 1) / 2
    break if length == index + 1
    index += 1
  end
  array
end

list = [1, 2, 3, 4]
result = reverse_array!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b e d c)
puts reverse_array!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e","b", "a"]

list = ['abc']
puts reverse_array!(list) == ["abc"]
puts list == ["abc"]

list = []
puts reverse_array!(list) == []
puts list == []

puts '-------'

# Launch School solution:

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1, 2, 3, 4]
result = reverse_array!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b e d c)
puts reverse_array!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e","b", "a"]

list = ['abc']
puts reverse_array!(list) == ["abc"]
puts list == ["abc"]

list = []
puts reverse_array!(list) == []
puts list == []
