# ascii_string_value.rb
# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

# Pseudo-code
# Data Structure:
# input: a string
# output: the 'ASCII string value' of the given string, which means the sum of
# the ASCII value of each individual character.
# rules: able to use `String#ord` method to determine the ASCII value of a
# character

# Algorithm:
# Begin by initializing the `ascii_value` method.
# return 0 if the given string is empty (i.e. string == '')
# Break the string into an array of individual characters using the `chars`
# method.
# Transform each character to its ASCII value using the `map` method and inside
# the block with the `ord` method.
# Then sum up the elements of the array using the the `inject(:+)` method.

def ascii_value(string)
  return 0 if string == ''

  string.chars.map { |char| char.ord }.inject(:+)
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

puts '------'

# Launch School solution:

def ascii_value(string)
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

puts '-----'

# Further Exploration:
# There is an `Integer` method such that:
# `char.ord.myster == char`
# where `mystery` is our mystery method. Can you determine what method name
# should be used in place of `mystery`? What happens if you try this with a
# longer string instead of a single character?

# The method name should be something like `ascii_value_to_character`.
# The problem with trying this on a longer string is that there are only ascii
# values for individual characters, not whole strings. Even if you thought that
# you could reverse the computation of the method we created above, which is
# the sum of individual ascii characters, any value that you are given could be
# broken down in an infinite number of ways so that you could determine what the
# exact string was.
