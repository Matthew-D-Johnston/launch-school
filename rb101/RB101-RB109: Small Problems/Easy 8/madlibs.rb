# madlibs.rb
# Mad libs are a simple game where you create a story template with blanks for
# words. You, or another player, then construct a list of words and place them
# into the story, creating an often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb,
# and an adjective and injects those into a story that you create.

# Pseudo-code:

# Data Structure:
# input: string inputs from user; 4 intputs in total.
# output: a string sentence incorporating the four word inputs from the user.
# rules: watch for invalid inputs, such as more than one word or non-word inputs

# Algorithm:
# 1) create a prompt method that takes a string input and prepends it with the
#    word 'Enter'.
# 2) prompt the user for four different inputs: 'a noun', 'a verb', 'an
#    adjective', and 'an adverb'.
# 3) Take the inputs and output a string that incorporates them into a single
#    sentence.

def prompt(string)
  print "Enter #{string}: "
end

def valid_input?(string)
  if string.ord == 48
    false
  elsif string.to_i == 0 && string.split.size == 1
    true
  elsif 
    false
  end
end

noun = ''
loop do
  prompt('a noun')
  noun = gets.chomp
  break if valid_input?(noun)
  puts "Invalid input. Please only enter a single word."
end

verb = ''
loop do
  prompt('a verb')
  verb = gets.chomp
  break if valid_input?(verb)
  puts "Invalid input. Please only enter a single word."
end

adjective = ''
loop do
  prompt('an adjective')
  adjective = gets.chomp
  break if valid_input?(adjective)
  puts "Invalid input. Please only enter a single word."
end

adverb = ''
loop do
  prompt('an adverb')
  adverb = gets.chomp
  break if valid_input?(adverb)
  puts "Invalid input. Please only enter a single word."
end

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's uncanny!"

puts '------'

# Launch School solution:

print 'Enter a noun: '
noun = gets.chomp

print 'Enter a verb: '
verb = gets.chomp

print 'Enter an adjective: '
adjective = gets.chomp

print 'Enter an adverb: '
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample

