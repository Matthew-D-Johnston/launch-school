# convert_signed_num_to_str.rb
# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by
# adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as `Integer#to_s`, `String()`, `Kernel#format`, etc. You may, however,
# use `integer_to_string` from the previous exercise.

# Pseudo-code:

# Data Structure:
# input: any integer, whether positive or negative
# ouput: a string representation of the integer
# rules: cannot use standard conversion methods (e.g. `to_s`, `String()`,
# `Kernel#format`, etc.), but can use `integer_to_string` method from the last
# exercise.

# Algorithm:
# First of all, the `digits` method will not take a negative integer so we will
# need to remove the negative sign before running the `integer_to_string`
# method.
# But before removing this we need to evaluate whether the integer is less than
# 0 or greater than / equal to 0. Thus, a case statement may be used to provide
# two separate channels to take.
# Once inside each channel, we can remove the '-' sign from the negative
# integer by multiplying by -1, and then apply the `integer_to_string` method.
# Then we must `prepend` a '-' to our string representation of the integer for
# our final output.
# As for the positive channel, we first apply the `integer_to_string`
# method and then `prepend` a '+' to the string output to arrive at our final
# output.

def integer_to_string(integer)
  integer.digits.reverse.join
end

def signed_integer_to_string(integer)
  abs_value_string = integer_to_string(integer.abs)

  case 
  when integer < 0 then abs_value_string.prepend('-')
  when integer == 0 then abs_value_string
  when integer > 0 then abs_value_string.prepend('+')
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
puts signed_integer_to_string(345)
puts signed_integer_to_string(-345)
puts signed_integer_to_string(0)

puts '------'

# Launch School solution:

def signed_integer_to_string(number)
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
puts signed_integer_to_string(345)
puts signed_integer_to_string(-345)
puts signed_integer_to_string(0)

puts '-----'

# Further Exploration:
# Refactor our solution to reduce the 3 `integer_to_string` calls to just one.

def signed_integer_to_string(number)
  abs_value_string = integer_to_string(number.abs)
  
  case number <=> 0
  when -1 then "-#{abs_value_string}"
  when +1 then "+#{abs_value_string}"
  else         abs_value_string
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
puts signed_integer_to_string(345)
puts signed_integer_to_string(-345)
puts signed_integer_to_string(0)

