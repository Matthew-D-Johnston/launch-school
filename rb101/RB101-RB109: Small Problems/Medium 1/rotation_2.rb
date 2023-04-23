# rotation_2.rb
# Write a method that can rotate the last `n` digits of a number.

# Note that rotating just 1 digit results in the original number being
# returned.

# You may use the `rotate_array` method from the previous exercise if you want.
# (Recommended!)

# You may assume that `n` is always a positive integer.

# Pseudo-code:

# Data Structure:
# input: a positive integer
# output: a positive integer, where a specified number of digits starting from
# the rightmost digit are rotated with the first digit becoming the last digit.

# Algorithm:
# 1) import `rotate_array` method.
# 2) initialize method definition: def rotate_rightmost_digits(integer, digits)
# 3) split individual digits into array: digits_array = integer.digits.reverse
# 4) digits_array[0...-digits] << 
#    rotate_array(digits_array[-digits..-1]).join.to_i

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_rightmost_digits(integer, digits)
  digits_arr = integer.digits.reverse
  nonrotated_section = digits_arr[0...-digits]
  rotated_section = rotate_array(digits_arr[-digits..-1])
  (nonrotated_section + rotated_section).join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

puts '-----'

# Launch School solution:

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
