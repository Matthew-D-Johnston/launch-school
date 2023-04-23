# rotation_pt2.rb

# Write a method
# input: two arguments: 1) a number to rotate and 2) a number indicating the
# number of digits to rotate

def rotate_rightmost_digits(number, digits)
  string_number = number.to_s
  digits_to_rotate = string_number[-digits..-1]
  rotated_digits = digits_to_rotate[1..-1] << digits_to_rotate[0]
  new_array = string_number[0..-(digits + 1)] << rotated_digits
  new_array.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
