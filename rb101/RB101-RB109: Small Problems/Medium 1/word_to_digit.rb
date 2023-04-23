# word_to_digit.rb
# Write a method that takes a sentence string as input, and returns the same
# string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
# 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

# Pseudo-Code:

# Data Structure:
# input: a sentence string
# output: the same sentence string but with number words transformed to their
# digit equivalents (i.e. 'two' = '2')

# Algorithm:
# 1) Create a hash with number words as keys and their digit equivalents as
#    values.
# 2) Initialize the method definition: def word_to_digit(sentence)
# 3) Split the sentence into individual words, stored in an array:
#    words = sentence.split and create a transformed_words = []
# 4) Iterate over each word, checking to see whether the word matches one of
#    keys in the hash: words.map do |word| or sentence.split.map do |word|
# 5) There is an edge case here to consider: when a number word is followed by
#    a punctuation mark.
# 6) To handle the edge case we will use a conditional:
# a) if /[^a-zA-z]/.match(word) && hash.keys.include?(word.downcase.chop)
#    then, last_char = word[-1]
#    transformed_words << hash[word.downcase.chop] + last_char
# b) elsif hash.keys.include?(word.downcase)
#    transformed_words << word = hash[word.downcase]
# c) else
#    transformed_words << word
# 7) The End

WORDS_DIGITS = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
                 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
                 'eight' => '8', 'nine' => '9' }

def transform_word_to_digit(word)
  if WORDS_DIGITS.keys.include?(word.downcase.chop)
    last_char = word[-1]
    (WORDS_DIGITS[word.downcase.chop] + last_char)
  elsif WORDS_DIGITS.keys.include?(word.downcase)
    (WORDS_DIGITS[word.downcase])
  else
    word
  end
end

def word_to_digit(sentence)
  sentence.split.map { |word| transform_word_to_digit(word) }.join(' ')
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

puts '-----'

# Launch School solution:

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

puts '------'

# Further Exploration:

# Algorithm
# 1) split the sentence string into individual words
# 2) use each_with_index to iterate through the individual words
# 3) if the word is one of our number words, then store it in a new array and
#    store the index in another array.
# 4) else store the word in a string, 
# 5) then transform the 

def transform_word_to_digit(word)
  if WORDS_DIGITS.keys.include?(word.downcase.chop)
    last_char = word[-1]
    (WORDS_DIGITS[word.downcase.chop] + last_char)
  elsif WORDS_DIGITS.keys.include?(word.downcase)
    (WORDS_DIGITS[word.downcase])
  else
    word
  end
end

def transformation_needed?(word)
  WORDS_DIGITS.keys.include?(word.downcase.chop) || \
  WORDS_DIGITS.keys.include?(word.downcase)
end

def ten_digit_number?(string)
  string.to_i.to_s == string && string.length == 10
end

def convert_to_phone_number(string)
  area_code = string[0..2]
  first_three = string[3..5]
  last_four = string[6..9]
  if string.chop.size == 10
    "(#{area_code}) #{first_three}-#{last_four}#{string[-1]}"
  else
    "(#{area_code}) #{first_three}-#{last_four}"
  end
end

def word_to_digit_no_space(string)
  words_array = string.split
  new_string = ''

  words_array.each_with_index do |word, idx|
    if new_string.empty?
      new_string << transform_word_to_digit(word)
    elsif transformation_needed?(word)    
      new_string << transform_word_to_digit(word)
    elsif (idx + 1 != words_array.size)
      if transformation_needed?(words_array[idx + 1])
        new_string << (' ' + word + ' ')
      else
        new_string << (' ' + word)
      end
    else
      new_string << (' ' + word)
    end
  end
  new_string
end

puts word_to_digit_no_space('Please call me at five five five one two three four. Thanks.')
puts '-------'

def word_to_phone_number(string)
  new_string = word_to_digit_no_space(string)
  words_arr = new_string.split
  transformed_arr = []

  words_arr.each do |word|
    if ten_digit_number?(word)
      transformed_arr << convert_to_phone_number(word)
    elsif ten_digit_number?(word.chop)
      transformed_arr << convert_to_phone_number(word)
    else
      transformed_arr << word
    end
  end

  transformed_arr.join(' ')
end

puts word_to_phone_number('Please call me at five one four two six eight two six one five. Thanks.')




