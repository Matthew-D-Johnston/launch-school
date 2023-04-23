# reversed_arrays2.rb
# Write a method that takes an Array, and returns a new Array with the
# elements of the original list in reverse order. Do not modify the original
# list.

# You may not use `Array#reverse` or `Array#reverse!`, nor may you use the
# method you wrote in the previous exercise.

# Pseudo-code:

# Data Structure:
# input: an array
# output: a new array with the elements of the original array in reverse order
# rules:
# 1) do not modify the original array
# 2) cannot use `Array#reverse` or `Array#reverse!`, nor the method written in
# the previous exercise.

# Algorithm:
# Define a new empty array called new_array
# Use the `each` method to iterate through the original array and successively
# adds each elment to the start of `new_array` using `unshift`.


def reverse_array(array)
  new_array = []
  array.each { |elem| new_array.unshift(elem) }
  new_array
end

puts reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1]
puts reverse_array(%w(a b e d c)) == %w(c d e b a)
puts reverse_array(['abc']) == ['abc']
puts reverse_array([]) == []

p list = [1, 3, 2]
p new_list = reverse_array(list)
puts list.object_id != new_list.object_id
puts list == [1, 3, 2]
puts new_list == [2, 3, 1]

puts '----'

# Launch School solution:

def reverse_array(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end

puts reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1]
puts reverse_array(%w(a b e d c)) == %w(c d e b a)
puts reverse_array(['abc']) == ['abc']
puts reverse_array([]) == []

p list = [1, 3, 2]
p new_list = reverse_array(list)
puts list.object_id != new_list.object_id
puts list == [1, 3, 2]
puts new_list == [2, 3, 1]

puts '----'

# Further Exploration:
#1) using `each_with_object`

def reverse_array(array)
  array.each_with_object([]) { |elem, new_array| new_array.unshift(elem) }
end

puts reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1]
puts reverse_array(%w(a b e d c)) == %w(c d e b a)
puts reverse_array(['abc']) == ['abc']
puts reverse_array([]) == []

p list = [1, 3, 2]
p new_list = reverse_array(list)
puts list.object_id != new_list.object_id
puts list == [1, 3, 2]
puts new_list == [2, 3, 1]

puts '----'

# 2) using `inject`

def reverse_array(array)
  array.inject([]) { |new_array, elem| new_array.unshift(elem) }
end

puts reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1]
puts reverse_array(%w(a b e d c)) == %w(c d e b a)
puts reverse_array(['abc']) == ['abc']
puts reverse_array([]) == []

p list = [1, 3, 2]
p new_list = reverse_array(list)
puts list.object_id != new_list.object_id
puts list == [1, 3, 2]
puts new_list == [2, 3, 1]
