# odd_lists.rb
# Write a method that returns an Array that contains every other element of an
# `Array` that is passed in as an argument. The values in the returned list
# should be those values that are in the 1st, 3rd, 5th, and so on elements of
# the argument Array.

def oddities(array)
  odd_array = []
  array.each_with_index { |elem, index| odd_array << elem if index.even? }
  odd_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts '-----'
# Launch School's Solution:

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts '-----'

# Further Exploration:
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements
# of an array.

def eventities(array)
  even_elements = []
  index = 1
  while index < array.size
    even_elements << array[index]
    index += 2
  end
  even_elements
end

puts eventities([2, 3, 4, 5, 6]) == [3, 5]
puts eventities([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts eventities(['abc', 'def']) == ['def']
puts eventities([123]) == []
puts eventities([]) == []

puts '-----'

# Try to solve this exercise in at least 2 additional ways:

# 1--My way, using the `each_with_index` method.

def oddities(array)
  odd_array = []
  array.each_with_index { |elem, index| odd_array << elem if index.even? }
  odd_array
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

puts '-----'

# 2--an other way:

def oddities(array)
  odd_elements = []
  array.each_index do |index|
    odd_elements << array[index] if index.even?
  end
  odd_elements
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
    