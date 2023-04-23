# convert_str_to_signed_num.rb
# In the previous exercise, you developed a method that converts simple numeric
# strings to Integers. In this exercise, you're going to extend that method to
# work with signed numbers.

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. The String may have a leading `+` or `-` sign; if the
# first character is a `+`, your method should return a positive number; if it
# is a `-`, your method should return a negative number. If no sign is given,
# you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby,
# such as `String#to_i`, `Integer()`, etc. You may, however, use the 
# `string_to_integer` method from the previous lesson.

# Pseudo-code:

# Data Structure:
# input: a String of digits
# output: Integer
# rules:
# 1) if first character is a `+`, then return a positive number;
# 2) if first character is a `-`, then return a negative number;
# 3) if no sign is given, then return a positive number;
# 4) assume the String will always contain a valid number;
# 5) do not use any standard conversion methods available in Ruby (e.g.
# `String#to_i` or `Integer()`);
# 6) you can use `string_to_integer` method from previous exercise.

# Alorithm
# 1) first, use method from previous section;
# 2) now create a new `positive?` method that checks to see whether or not the
# given sign indicates a positive number or negative number.
# There are three separate cases to consider: 1) a positive sign; 2) a negative
# sign; and 3) no sign.
# We can structure this in an if/else statement:
# if string[0] != '-', then `true`
# After defining that method, we need a way of assign a negative sign to our
# final integer output.
# if `positive?(numeric_string)` returns `false`, then we will multiply the
# `value` variable by `-1`.

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def positive?(numeric_string)
  numeric_string[0] != '-'
end

def string_to_integer(string)
  digits = string.delete('+-').chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  
  if positive?(string)
    value
  else
    value * -1
  end
end

puts string_to_integer('4321') == 4321
puts string_to_integer('-570') == -570
puts string_to_integer('+100') == 100
puts string_to_integer('-92')
puts string_to_integer('+890')

puts '-----'

# Launch School solution:

# Re-uses the previous exercise's method and leaves it 'as is':

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

# Then creates a new method that utilizes the `string_to_integer` method:

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
puts string_to_signed_integer('-92')
puts string_to_signed_integer('+890')

puts '-------'

# Further Exploration:
# In our solution, we call `string[1..-1]` twice, and call `string_to_integer`
# three times. This is somewhat repetitive. Refactor our solution so it only
# makes these two calls once each.

def string_to_signed_integer(string)
  string.prepend('+') if string[0] != '-' && string[0] != '+'
  value = string_to_integer(string[1..-1])
  string[0] == '+' ? value : -value
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
puts string_to_signed_integer('-92')
puts string_to_signed_integer('+890')
