# multiply_all_pairs.rb
# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# Pseudo-code:
# input: two array arguments, where each Array contains a list of numbers.
# output: a new Array containing the product of every pair of numbers that can
# be formed by the elements of the two Arrays, and sorted by increasing value.
# rules: assume that neither argument is an empty Array.

# Algorithm:
# 1) begin by initializing the method definition: multiply_all_pairs(numbers1,
#    numbers2)
# 2) I think this could be achieved with an `each` method call on one
#    of the arrays, and then within the block another each` method call on the
#    second array which multiplies each number in that array consecutively with
#    each number of the first array.
#

def multiply_all_pairs(numbers1, numbers2)
  results = []
  numbers1.each do |outer_element|
    numbers2.each { |inner_element| results << outer_element * inner_element }
  end
  results.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
puts '-----'

# Launch School solutions:
# 1) first solution was similar to mine

# 2)

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
puts '-----'

# Just thought of another possible solution using the `product` method:

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |pair| pair.inject(:*) }.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

