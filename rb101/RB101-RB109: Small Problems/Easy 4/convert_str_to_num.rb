# convert_str_to_num.rb
# The `String#to_i` method converts a string of numeric characters (including
# an optional plus or minus sign) to an `Integer`. `String#to_i` and the
# `Integer` constructor (`Integer()`) behave similarly. In this exercise, you
# will create a method that does the same thing.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading `+` or `-` signs, nor should you worry
# about invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby,
# such as `String#to_i`, `Integer()`, etc. Your method should do this the old-
# fashioned way and calculate the result by analyzing the characters in the
# string.

# Pseudo-Code:

# Data-Structure:
# input: a numeric string
# output: an integer
# rules: convert the numeric string to an integer; do not use any of the
# standard conversion methods such as `to_i` or `Integer()`.

# Algorithm:
# create a hash called `INTEGERS` with strings from '0' to '9' as keys, and
# integers corresponding to the appropriate keys as values (ex. '0' => 0).
# Then iterate through each character of the given string, match it with the
# correct key and output the correpsonding output value.
# given the following string, '4321', what should happen for each character is
# the following:
# str[0] = INTEGERS['4']
# str[1] = INTEGERS['3']

INTEGERS = { '0' => 0,
             '1' => 1,
             '2' => 2,
             '3' => 3,
             '4' => 4,
             '5' => 5,
             '6' => 6,
             '7' => 7,
             '8' => 8,
             '9' => 9 }

def numeric_array_to_integer(numeric_array)
  multiplier = 1
  index = 1
  until index > numeric_array.size
    numeric_array[-index] *= multiplier
    multiplier *= 10
    index += 1
  end
  numeric_array.sum
end

def string_to_integer(numeric_string)
  integer_array = []
  numeric_string.each_char { |char| integer_array << INTEGERS[char]}
  numeric_array_to_integer(integer_array)
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts '----'

# Launch School solution:

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

puts '----'

# Further Exploration:
# Write a `hexadecimal_to_integer` method that converts a string representing a
# hexidecimal number to its integer value.


CONVERSION = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
               '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
               'A' => 10, 'a' => 10, 'B' => 11, 'b' => 11,
               'C' => 12, 'c' => 12, 'D' => 13, 'd' => 13,
               'E' => 14, 'e' => 14, 'F' => 15, 'f' => 15 }

def hexadecimal_to_integer(string)
  converted = string.chars.map { |char| CONVERSION[char] }

  n = converted.size - 1
  ind = 0
  value = 0
  while n >= 0
    value += converted[ind] * (16**n)
    ind += 1
    n -= 1
  end
  value
end

puts hexadecimal_to_integer('4D9f') == 19871
puts hexadecimal_to_integer('5AB2') == 23218


