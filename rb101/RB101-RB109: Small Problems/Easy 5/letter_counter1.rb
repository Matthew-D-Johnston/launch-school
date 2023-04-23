# letter_counter1.rb
# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

# Pseudo-code:

# Data Structure:
# input: a string with one or more space separated words
# output: a hash with the word size as the key and the number of words of that
# size as the value
# rules:
# words consist of any string of characters that do not include a space

# Algorithm
# 1) Begin by initializing our `word_sizes` method definition.
# 2) Convert the string to an array containing the individual words and store
# to a variable named `words` using the `split` method.
# 3) Convert the elements of the array from words to their sizes using the `map`
# method and store to variable named `word_sizes`: `word_sizes` = words.map
# { |word| word.size }
# 4) Need to extract each element of the array and set it is the key of a new
# hash while setting the value of the hash to 1; for duplicate elements, we only
# need to add a 1 to the value: we can use the `each_with_object({})` method

def word_sizes(sentence)
  words = sentence.split
  word_size_array = words.map(&:size)

  word_size_hash = {}
  word_size_array.map { |size| word_size_hash[size] = 0 }
  word_size_array.each { |size| word_size_hash[size] += 1 }

  word_size_hash
end

puts word_sizes('Four socre and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

puts '------'

# Launch School solution:

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

puts word_sizes('Four socre and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
