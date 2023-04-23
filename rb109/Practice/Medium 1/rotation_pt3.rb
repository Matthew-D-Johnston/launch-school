# rotation_pt3.rb

# write a method
# input: integer
# output: an integer fully rotated

# perfortm rotate_right_most_digits iteratively starting with the number of
# digits within the number and then counting down by 1 on each iteration;
# 1) number_of_digits = number.to_s.length
# 2) number_of_digits.downto(1) do |idx|
# 3) within the method's block: call number = rotate_rightmost_digits(number, idx)

def rotate_rightmost_digits(number, digits)
  string_number = number.to_s
  digits_to_rotate = string_number[-digits..-1]
  rotated_digits = digits_to_rotate[1..-1] << digits_to_rotate[0]
  new_array = string_number[0..-(digits + 1)] << rotated_digits
  new_array.to_i
end

def max_rotation(number)
  number_of_digits = number.to_s.length
  number_of_digits.downto(2) do |idx|
    number = rotate_rightmost_digits(number, idx)
  end
  number
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
