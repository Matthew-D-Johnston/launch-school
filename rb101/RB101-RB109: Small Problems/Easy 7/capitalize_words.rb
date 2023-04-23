# capitalize_words.rb
# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character of
# every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Pseudo-code:

# Data Structure:
# input: a single String
# output: a new String containing the original value of the argument but with
# the first character of every word capitalized and all other letters
# lowercase.
# rules: assume words are any sequence of non-blank characters.

# Algorithm:
# 1) begin by initializing the method definition: def word_cap(string)
# 2) Break the string into its component words and store as array:
# words = string.split
# 3) Transform each word so that the first character is capitalized: 
# words.map { |word| word.capitalize }
# 4) Join the words back to a string: join(' ')

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

puts '-----'

# Launch School solution:
#1) 

def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

puts '-----'

# We can also write this more succinctly as:

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

puts '-----'

# Further Exploration:
# Ruby conveniently provides the `String#capitalize` method to capitalize
# strings. Withouth that method, how would you solve this problem? Try to come
# up with at least two solutions.

# 1)

def word_cap(words)
  characters = words.split('')
  capitalized_chars = []
  characters.each do |char|
    if capitalized_chars.empty?
      capitalized_chars << char.upcase
    elsif char =~ /[a-z]/ && capitalized_chars.last == ' '
      capitalized_chars << char.upcase
    else
      capitalized_chars << char.downcase
    end
  end

  capitalized_chars.join
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

puts '------'

# 2)

# Algo:
# define constant ALPHA_CASE which uses capital letters as keys and their
# lowercase equivalents as values
# define a method that that substitutes the first letter of each word with
# the corresponding uppercase key and all other letters with their lowercase
# equivalents
 
UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def word_cap(string)
  characters = string.chars
  lower_case_chars = []

  characters.each do |char|
    if UPPERCASE.include?(char)
      char = LOWERCASE[UPPERCASE.index(char)]
      lower_case_chars << char
    else
      lower_case_chars << char
    end
  end
  
  words = lower_case_chars.join.split
  capitalized_words = []

  words.each do |word|
    word[0] = UPPERCASE[LOWERCASE.index(word[0])] if LOWERCASE.include?(word[0])
    capitalized_words << word
  end
  capitalized_words.join(' ')
end


puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
