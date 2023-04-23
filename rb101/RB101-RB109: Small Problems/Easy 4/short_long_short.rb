# short_long_short.rb
# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again. You may assume
# that the strings are of different lengths.

def short_long_short(first_str, second_str)
  if first_str.size < second_str.size
    first_str + second_str + first_str
  else
    second_str + first_str + second_str
  end
end

puts short_long_short('abc', 'defgh') == 'abcdefghabc'
puts short_long_short('abcde', 'fgh') == 'fghabcdefgh'
puts short_long_short('', 'xyz') == 'xyz'

puts '-----'

# Launch School's Solution:

def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

puts short_long_short('abc', 'defgh') == 'abcdefghabc'
puts short_long_short('abcde', 'fgh') == 'fghabcdefgh'
puts short_long_short('', 'xyz') == 'xyz'

puts '-----'

# ...or...

def short_long_short(string1, string2)
  arr = [string1, string2].sort_by { |el| el.length }
  arr.first + arr.last + arr.first
end

puts short_long_short('abc', 'defgh') == 'abcdefghabc'
puts short_long_short('abcde', 'fgh') == 'fghabcdefgh'
puts short_long_short('', 'xyz') == 'xyz'
 

