# letter_swap.rb
# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.

# You may assume that every word contains at least one letter, and that the
# string will always contain at least one word. You may also assume that each
# string contains nothing but words and spaces.

# Pseudo-code:

# Data Structure:
# input: string of words separated by spaces
# ouput: string with the first and last letter of each word swapped
# rules:

# Algorithm:
# 1) split the string into separate words and store them in a `words` array
# using the `split(" ")` method.
# 2) iterate over the array, transforming each word and collecting to a new
# `swapped_letters` array using the `each` method.
# 3) rejoin the array into a string using the `join(" ")` method.

def swap(string)
  words = string.split(' ')

  swapped_letters = words.each do |word|
    first = word[0]
    last = word[-1]
    word[0] = last
    word[-1] = first
  end

  swapped_letters.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

puts '-----'

# Launch School solution:

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word [0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
