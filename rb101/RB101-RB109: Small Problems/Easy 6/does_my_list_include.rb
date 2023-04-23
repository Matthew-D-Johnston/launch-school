# does_my_list_include.rb
# Write a method named `include?` that takes an Array and a search value as
# arguments. This method should return `true` if the search value is in the
# array, `false` if it is not. You may not use the `Array#include?` method in
# your solution.

# Pseudo-code:

# Data Structure:
# inputs: an array and a search value
# output: boolean value: `true` if the search value is in the array and `false`
# otherwise
# rules: cannot use `Array#include?` method.

# Algorithm:
# 1) being by initializing the method definition: def include?(array,
# search_value)
# 

def include?(array, search_value)
  array.count(search_value) == 0 ? false : true
end

puts include?([1, 2, 3, 4, 5], 3) == true
puts include?([1, 2, 3, 4, 5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

puts '------'

# Launch School solution:

# 1)

def include?(array, value)
  !!array.find_index(value)
end

puts include?([1, 2, 3, 4, 5], 3) == true
puts include?([1, 2, 3, 4, 5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

puts '------'

def include?(array, value)
  array.each { |element| return true if value == element }
  false
end

puts include?([1, 2, 3, 4, 5], 3) == true
puts include?([1, 2, 3, 4, 5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false
