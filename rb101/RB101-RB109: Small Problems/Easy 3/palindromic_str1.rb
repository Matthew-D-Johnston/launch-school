# palindromic_str1.rb
# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and
# backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(input)
  input.to_s == input.to_s.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false
puts palindrome?("madam i'm adam") == false
puts palindrome?('356653') == true
puts palindrome?(356653) == true
puts palindrome?(1) == true
puts palindrome?('h') == true
puts palindrome?(1234) == false

puts '-------'
# Launch School Solution:

def palindrome?(string)
  string == string.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false
puts palindrome?("madam i'm adam") == false
puts palindrome?('356653') == true
puts palindrome?(356653)  rescue puts "error: not a String"
puts palindrome?(1) rescue puts "error: not a String"
puts palindrome?('h') == true
puts palindrome?(1234) rescue puts "error: not a String"

puts'--------'

# Further Exploration:

# Write a method that determines whether an array is palindromic; that is, the
# element values appear in the same sequence both forwards and backwards in the
# array. Now write a method that determines whether an array or a string is
# palindromic; that is, write a method that can take either an array or a
# string argument, and determines whether that argument is a palindrome. You
# may not use an `if`, `unless`, or `case` statement or modifier.

def palindrome_arr_or_str?(arr_or_str)
  arr_or_str == arr_or_str.reverse
end

puts palindrome_arr_or_str?('madam') == true
puts palindrome_arr_or_str?('Madam') == false
puts palindrome_arr_or_str?("madam i'm adam") == false
puts palindrome_arr_or_str?('356653') == true
puts palindrome_arr_or_str?([1, 2, 3, 2, 1]) == true
puts palindrome_arr_or_str?(['dog', 'cat', 'mouse', 'cat', 'dog']) == true
puts palindrome_arr_or_str?([1, 2, 3]) == false
puts palindrome_arr_or_str?(['dog', 'cat', 'mouse']) == false




