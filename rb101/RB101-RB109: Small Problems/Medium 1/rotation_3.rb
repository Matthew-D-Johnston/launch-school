# rotation_3.rb
# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining
# digits, you get 329175. Keep the first 2 digits fixed in place and rotate
# again to 321759. Keep the first 3 digits fixed in place and rotate gain to
# get 321597. Finally, keep the first 4 digits fixed in place and rotate the
# final 2 digits to get 321579. The resulting number is called the maximum
# rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum
# rotation of that argument. You can (and probably should) use the
# `rotate_rightmost_digits` method from the previous exercise.

# Note that you do not have to handle multiple 0s.

# Pseudo-code:

# Data Structure:
# input: an integer
# output: the max rotation of the integer

# Algorithm:
# 1) import `rotate_array` and `rotate_rightmost_digits` methods.
# 2) initialize the method definition: def max_rotation(integer)
# 3) Call the rotate_rightmost_digits method one less than the total number of
#    digits in the given integer.
# 4) The first time it is called, the second argument of the
#    rotate_rightmost_method should be the same number as the number of digits
#    of the given integer.
# 5) Each successive call of the method, the digits argument will be one less
#    than before.

def rotate_array(array)
  array[1..-1] << array[0]
end

def rotate_rightmost_digits(integer, digits)
  digits_arr = integer.digits.reverse
  nonrotated_section = digits_arr[0...-digits]
  rotated_section = rotate_array(digits_arr[-digits..-1])
  (nonrotated_section + rotated_section).join.to_i
end

def max_rotation(integer)
  digits_counter = integer.digits.size

  while digits_counter > 1
    integer = rotate_rightmost_digits(integer, digits_counter)
    digits_counter -= 1
  end
  
  integer
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15
puts max_rotation(8_703_529_146) == 7_321_609_845

puts '------'

# Launch School solution:

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15
puts max_rotation(8_703_529_146) == 7_321_609_845

puts '------'

# Further Exploration:
# Assume you do not have the `rotate_rightmost_digits` or `rotate_array`
# methods. How would you approach this problem? Would your solution look
# different? Does this 3 part approach make the problem easier to understand
# or harder?

# There is an edge case in our problem when the number passed in as the
# argument has multiple consecutive zeros. Can you create a solution that
# preserves zeros?

# Algorithm:
# 1) initialize method definition

def max_rotation(integer)
  digits_array = integer.digits.reverse
  0.upto(digits_array.size - 2) do |index|
    digits_array << digits_array.delete_at(index)
  end
  digits_array.join.to_i
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15
puts max_rotation(8_703_529_146) == 7_321_609_845

puts '------'

# the edge case of leading zeros can, I believe, only be solved if we output a
# string instead of an integer:

def max_rotation(integer)
  digits_array = integer.digits.reverse
  0.upto(digits_array.size - 2) do |index|
    digits_array << digits_array.delete_at(index)
  end
  digits_array.join
end

puts max_rotation(735291) == "321579"
puts max_rotation(3) == "3"
puts max_rotation(35) == "53"
puts max_rotation(105) == "015"
puts max_rotation(8_703_529_146) == "7321609845"
