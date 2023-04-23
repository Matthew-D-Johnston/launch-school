# clean_up_the_words.rb
# Given a string that consists of some words and an assortment of non-
# alphabetic characters, write a method that returns that string with all of
# the non-alphabetic characters replaced by spaces. If one or more non-
# alphabetic characters occur in a row, you should only have one space in the
# result (the result should never have consecutive spaces).

# Pseudo-code:
# inputs: a string consisting of words and assortment of non-alphabetic
# characters.
# output: string with all non-alphabetic characters replaced with spaces
# rules:
# 1) consecutive non-alphabetic characters should be replaced by a single,
# so that there are no instances of consecutive spaces in the output.

# Algorithm:
# 1) Begin by initializing the definition of our `cleanup` method.
# 2) we can replace all the non-alphabetic characters with a space using the
# following method: `gsub!(/[^a-zA-Z]/), ' ')`.
# 3) With the new string, we need a method that will select all elements that
# are not simultaneously a blank space and followed by a blank space:
# a) first convert the string to an array of the individual characters; store
# in variable called `chars_array`.
# b) define an empty array called `clean_array`
# b) then use `each_with_index { |e, i| `clean_array` << e if !(e == ' ' &&
# [i + 1] == ' ') }
# 4) Finally, return clean_array.join

def cleanup(string)
  string.gsub!(/[^a-zA-Z]/, ' ')
  chars_array = string.chars

  clean_array = []
  chars_array.each_with_index do |char, index|
    clean_array << char if !(char == ' ' && chars_array[index + 1] == ' ')
  end

  clean_array.join
end

puts cleanup("---what's my +*& line?") == ' what s my line '

puts '-----'

# Launch School solution:
# 1)

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

puts cleanup("---what's my +*& line?") == ' what s my line '

puts '-----'

# 2)

def cleanup(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '

puts '-----'

# Further Exploration:
# If you originally wrote this method with regular expressions, try writing it
# without regular expressions.
