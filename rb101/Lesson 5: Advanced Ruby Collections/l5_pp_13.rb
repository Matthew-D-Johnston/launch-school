# l5_pp_13.rb

# Practice Problem 13
# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically by only taking into
# consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted = arr.sort_by do |sub_array|
  sub_array.select { |num| num.odd? }
end

p sorted

# Launch School solution:
# similar to mine
