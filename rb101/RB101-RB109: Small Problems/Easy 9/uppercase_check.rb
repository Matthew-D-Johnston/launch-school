# uppercase_check.rb
# Write a method that takes a string argument, and returns `true` if all of the
# alphabetic characters inside the string are uppercase, `false` otherwise.
# Characters that are not alphabetic should be ignored.

# Pseudo-code:

# Data Structure:
# input: a string
# output: a boolean--true if all alphabetic characters inside the string are
# uppercase and false otherwise.
# rules: non-alphabetic characters are to be ignored

# Algorithm:
# 1) initialize method definition: def uppercase?(string)
# 2) compare the original string with a version that is upcased: 
#    string.upcase == upcase ? true : false

def uppercase?(string)
  string.upcase == string ? true : false
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

puts '-------'

# Launch School solution:

def uppercase?(string)
  string == string.upcase
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
