# the_end_is_near.rb
# Write a method that returns the next to last word in the String passed to it
# as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# Pseudo-code:

# Data Structure
# input: a string
# output: a string of the next to last word of the original string
# rules:
# 1) words are any sequence of non-blank characters
# 2) assume that the input String will always contain at least two words.

# Algorithm:
# 1) initialize method definition: def penultimate(string)
# 2) take string and split it into component words using `string.split`
# 3) then call the second to last element using [-2].

def penultimate(string)
  string.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

puts '-----'

# Further Exploration:
# Suppose we need a method that retrieves the middle word of a phrase/sentence.
# What edge cases need to be considered? How would you handle those edge cases
# without ignoring them? Write a method that returns the middle word of a
# phrase or sentence. It should handle all of the edge cases you thought of.

# Pseudo-code:

# Data Structure:
# input: a string of words
# output: the middle word in the string
# rules:
# 1) consider different edge cases and how to handle them
# edge cases:
# 1) no words: return `nil`
# 2) 1 word: return that word
# 3) 2 words: return both words
# 4) even number of words: return the two middle words
# 5) odd number of words: return the middle word

# Algorithm:
# 1) initialize the method definition: middle_word(string)
# 2) split the string into individual words and store in an array:
#    words_array = string.split
# 3) return nil if words_array.size == 0
# 4) Begin a conditional if/else statement: if words_array.size.even?
# 5) for an array size that is even, divide the size by 2, take the result
#    and call a range index of (result-1..result) on the words_array and then
#    call the join(' ') method
# 6) for the else statment, divide the array size by 2 and use that result as
#    index to return from the array.
# 7) End

def middle_word(string)
  words_array = string.split
  word_index = words_array.size / 2

  if words_array.size.even?
    return nil if words_array.empty?
    words_array[(word_index - 1)..word_index].join(' ')
  else
    words_array[word_index]
  end
end

puts middle_word("Launch School is the best!")
puts middle_word("Matt is the best student at Launch School.")
puts middle_word('')
