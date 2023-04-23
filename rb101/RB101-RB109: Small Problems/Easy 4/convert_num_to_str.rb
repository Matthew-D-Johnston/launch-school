# convert_num_to_str.rb
# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're
# going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as `Integer#to_s`, `String()`, `Kernel#format`, etc. Your method should
# do this the old-fashioned way and construct the string by analyzing and
# manipulating the number.

# Pseudo-Code:

# Data-Structure:
# input: a positive integer or zero
# ouput: a string representation of the input
# rules:
# 1) cannot use any of the standard conversion methods (e.g. `to_s`, `String()`
# `Kernel#format`, etc.)

# Algorithm:
# 1) Begin by creating a `DIGITS` hash with the integers from 0 to 9 as keys,
# and string characters '0' to '9' as values.
# 2) Need to iterate through each digit of the given integer, replacing its
# integer value with its corresponding string value using the `DIGITS` hash.
# a) to do this iteration, first split the integer into individual digits using
# the `digits` method, then apply the `reverse` method, and store it to an
# array called `digits`. 
# b) then use the `map` method to convert each integer value to a string.
# c) then use the `join` method to create the final string output.

DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
           5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
          }

def integer_to_string(integer)
  integer_digits_array = integer.digits.reverse
  string_digits_array = integer_digits_array.map { |digit| DIGITS[digit] }
  string_digits_array.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

puts '-----'

# Launch School solution:

DIGITSS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITSS[remainder])
    break if number == 0
  end
  result
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'



