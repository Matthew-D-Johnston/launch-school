# get_middle_char.rb
# Write a method that takes a non-empty string argument, and returns the middle
# character or characters of the argument. If the argument has an odd length,
# you should return exactly one character. If the argument has an even length,
# you should return exactly two characters.

# Pseudo-code:

# Data Structure:
# input: a non-empty string
# output: the middle character of the string; one character for odd-lengthed
# strings and two characters for even-lengthed strings.

# Algorithm:
# 1) initialize method definition: def center_of(string)
# 2) define variable containing the string length: str_length = string.length
# 3) define a variable containing the index at the middle of the string:
#    mid_index = str_length / 2
# 4) initiate a conditional if/else statement:
#  a) if str_length.odd? then string[mid_index]
#  b) else str_length.even? then string[mid_index..(mid_index+1)]
# 5) end the method

def center_of(string)
  str_length = string.length
  mid_index = str_length / 2
  str_length.odd? ? string[mid_index] : string[(mid_index - 1)..mid_index]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'

puts '------'

# Launch School solution:

def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'

