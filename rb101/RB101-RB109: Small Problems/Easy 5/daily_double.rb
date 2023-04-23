# daily_double.rb
# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use
# `String#squeeze` or `String#squeeze!`. 

# Pseudo-code:

# Data Structure:
# input: string
# output: a new string containing the value of the original string but with all
# consecutive duplicate characters collapsed into a single character.
# rules: cannot use `squeeze` or `squeeze!` methods.

# Algorithm:
# Begin by initializing the method def: def `crunch(string)` ...
# Split the string into individual character components: string.split('')
# Iterate over each character, storing within a new array, unless that
# character was preceded by a similar character: `each` method??? with
# `if/else` statement???
# The `each` method would allow to iterate through each character.
# The `if/else` statement would allow for conditional addition of characters:
# add characters to new array `unless` new_array.last = current_char.
# join the characters of the new array to form a new string
# return the new string

def crunch(string)
  crunch_arr = []
  string.split('').each do |char|
    crunch_arr << char unless char == crunch_arr.last
  end
  crunch_arr.join
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('a') == 'a'
puts crunch('') == ''

puts '----'

# Launch School solution:

def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('a') == 'a'
puts crunch('') == ''

puts '-----'

# Further Exploration:
# 1) How would you update this method to use `String#each_char` or `String#chars`?

def crunch(text)
  crunch_text = ''
  text.each_char do |char|
    crunch_text << char unless char == crunch_text[-1] 
  end
  crunch_text
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('a') == 'a'
puts crunch('') == ''

puts '-----'

# 2) You can solve this problem using regular expressions (see the `Regexp`
# class documentation). For a fun challenge, give this a try with regular
# expressions. Can you think of other solutions besides regular expressions?

def collapse_duplicates(array_with_dupls)
  array_with_dupls.map { |elem| elem = elem[0] }
end

def crunch(string)
  arr_with_duplicates = string.gsub(/(.)(\1)*/).to_a
  collapse_duplicates(arr_with_duplicates).join
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('a') == 'a'
puts crunch('') == ''
