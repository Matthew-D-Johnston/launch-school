# longest_sentence.rb
# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (`.`), exlamation points (`!`), or question marks (`?`). Any sequence
# of characters that are not spaces or sentence-ending characters should be
# treated as a word. You should also print the number of words in the longest
# sentence.

# Pseudo-Code:

# Data Structure:
# input: a text
# output: the longest sentence within the text and the number of words in the
# longest sentence.

# Algorithm:
# 1) Find the end of the sentence and count" the number of words from the start
#    of the end of the last sentence to the end of the current sentence.
# 2) Find the end of the sentence using the `index` method on the string.
# 3) Define a `start_idx` and an `end_idx` variable.
# 4) Definte a sentence array: sentence = []
# 5) Define a higest_word_count = 0 variable
# 6) Define a most_words = ''
# 7) Start a loop that iterates over the string and will return the index of
#    the first `.`, `!`, or `?` that appears and store it in the end_idx
#    end_idx variable: end_idx = string[start_idx..end_idx].index(/[.!?]/)
# 8) Then index just that portion of the string, and store it in a variable:
#    current_sentence = string[start_idx..end_idx]
# 9) Then split the current_sentence, count the words in it, and store it in
#    a variable: current_word_count = current_sentence.split.size
# 10) if the current_word_count > highest_word_count, then store the value of
#    the current_word_count as the value of the highest_word_count and store
#    the current_sentence in most_words variable

def longest_sentence(text)
  start_idx = 0
  text
  end_idx = text.length - 1
  highest_word_count = 0
  largest_sentence = ''

  loop do
    chars_in_sentence = text[start_idx..end_idx].index(/[.!?]/)
    end_idx = start_idx + chars_in_sentence
    current_sentence = text[start_idx..end_idx]
    current_word_count = current_sentence.split.size

    if current_word_count > highest_word_count
      highest_word_count = current_word_count
      largest_sentence = current_sentence
    end

    start_idx = end_idx + 1
    end_idx = text.length - 1
    break if text[start_idx..end_idx].index(/[.!?]/) == nil
  end

  puts largest_sentence.split.join(' ')
  puts "Number of words in this sentence: #{highest_word_count}"
end

text = File.read("pg84.txt")

longest_sentence(text)
puts "-----------"
longest_sentence("Hello there my good friend. What's your name? Did you see my big fat hairy wedding? YOU scoundrel!")

puts '-----------'

# Launch School solution:

text = File.read('pg84.txt')

sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"

puts '---------'

# Further Exploration:
# You may have noticed that our solution fails to print the print the period at
# the end of the sentence. Can you write a solution that keeps the period
# printed at the end of each sentence?

# What about finding the longest paragraph or longest word? How ould we go
# about solving that problem?

text = File.read('pg84.txt')
indices = []

text.split('').each_with_index do |char, idx|
  indices << idx if char =~ /[.!?]/
end

sentences = []
start_idx = 0

indices.each do |idx|
  end_idx = idx
  sentences << text[start_idx..end_idx]
  start_idx = end_idx + 1
end

largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"
