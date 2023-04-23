# reverse_it_2.rb
# Write a method that takes one argument, a string containing one or
# more words, and returns the given string with all five or more
# letter words reversed. Each string will consist of only letters and
# spaces. Sapces should be included only when more than one word is
# present.

# Pseudo-code:
# Take a string of one or more words.
# Split the string into individual words and assign them to an array.
# Loop over the array checking for words with 5 or more letters.
# If the word consists of 5 or more letter, then update the array
# with the word spelled in reverse.
# Now join the individual words back together to form a new modified
# array.

# Formal pseudo-code:
# START by defining a method that takes as an argument as string.
# READ the string, splitting it into individual word components.
# SET the individual word components into a new array variable.
# LOOP through the elements of the array, checking for words 5 letters
# long or more.
# IF word >= 5, then replace it with the word spelled in reverse.
# RETURN the newly formed array.

# Code:

def reverse_words(string)
  split_str = string.split 

  split_str.each do |word|
    word.reverse! if word.length >= 5
  end

  split_str.join(' ')

end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')

puts "-------"

# Launch School solution:

def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')


