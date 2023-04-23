# delete_vowels.rb
# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.

# Pseudo-code:

# Data Structure:
# input: an array of strings
# output: an array of the same string values, but with the vowels (a, e, i, o,
# u) removed.
# rules: must be case insensitive

# Algorithm:
# Start with a constant defintion that includes all the vowels: VOWELS = ['a',
# 'e', 'i', 'o', 'u']
# The `String#delete` method maybe useful: string.delete "aeiouAEIOU"
# Iterate through the array input with `map`, applying string.delete on each
# element of the array.

def remove_vowels(array_of_strings)
  array_of_strings.map { |string| string.delete 'aeiouAEIOU' }
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

puts '-----'

# Launch School solution:
# effectively the same as mine.