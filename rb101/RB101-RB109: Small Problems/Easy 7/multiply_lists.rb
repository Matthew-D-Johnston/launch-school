# multiply_lists.rb
# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index. You may assume
# that the arguments contain the same number of elements.

# Pseudo-code:

# Data Structure:
# input: two Arrays, each containing a an equal number of numbers
# output: a single array whose elements are the result of multiplying the pair
# of numbers of the same index from the two input arrays.
# rules: assume that the arguments contain the same number of elements.

# Algorithm:
# 1) begin by initializing the method definition: def multiply_list(numbers1,
#    numbers2)
# 2) define any empty array called results.
# 3) use the each_with_index method, calling it on one of the arrays and then
#    assigning to the results array the multiplication of the element from the
#    array with the element from the other array called by the index.

def multiply_list(numbers1, numbers2)
  results = []
  numbers2.each_with_index { |num, index| results << num * numbers1[index] }
  results
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
puts '------'

# Further Exploration:
# The `Array#zip` method can be used to produce an extremely compact solution
# to this method. Read the documentation for `zip`, and see if you can come up
# with a one line solution (not counting the `def` and `end` lines).

def multiply_list(numbers1, numbers2)
  numbers1.zip(numbers2).map { |pair| pair.inject(:*) }
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
