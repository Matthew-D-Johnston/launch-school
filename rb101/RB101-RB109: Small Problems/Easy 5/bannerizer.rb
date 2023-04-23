# bannerizer.rb
# Write a method that will take a short line of text, and print it within a
# box.

# Pseudo-code:

# Data Structure:
# input: a string containing a short line of text.
# output: the string printed with a box as its border.
# rules: assume that the input will awlays fit in the terminal window.

# Algorithm:
# Begin by initializing the method definition: def `print_in_box`(string)
# Need to get the length of the string: string.length
# But to leave a space on either side of the printed text, I will need to add
# 2; thus, we have spacer = string.length + 2
# Then need to print five separate lines:
# Line 1: puts '+' + '-'*spacer + '+'
# Line 2: puts '|' + ' '*spacer + '|'
# Line 3: puts '|' + " #{string} " + '|'
# Line 4: puts '|' + ' '*spacer + '|'
# Line 5: puts '+' + '-'*spacer + '|'

def print_in_box(string)
  spacer = string.length + 2

  puts '+' + '-' * spacer + '+'
  puts '|' + ' ' * spacer + '|'
  puts '|' + " #{string} " + '|'
  puts '|' + ' ' * spacer + '|'
  puts '+' + '-' * spacer + '+'
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Matthew Johnston')

puts '--------'

# Launch School solution:

def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Matthew Johnston')

puts '--------'

# Further Exploration:
# 1) Modify this method so it will truncate the message if it will be too wide
# to fit inside a standard terminal window (80 columns, including the sides of
# the box).

def print_in_box(message)
  trunct_message = message[0..76]
  horizontal_rule = "+#{'-' * (trunct_message.size + 2)}+"
  empty_line = "|#{' ' * (trunct_message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{trunct_message} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Matthew Johnston')
print_in_box("I'm going to make this message really, really long, so that I can test out my truncations!")

puts '--------'

# 2) For a real challenge, try word wrapping very long messages so they appear
# on multiple lines, but still within a box.

def split_text_to_array(text, size)
  truncated_message_arr = []
  loop do
    truncated_message_arr << text[0..(size - 1)]
    break if text.size <= size
    text = text[size..-1]
  end
  truncated_message_arr
end

def print_text_from_array(array_of_texts, range)
  array_of_texts.each do |text|
    if text.size == range
      puts "| #{text} |"
    else
      puts "| #{text + ' ' * (range - text.size)} |"
    end
  end
end

def print_in_box(message)
  horizontal_rule = "+#{'-' * (message[0..75].size + 2)}+"
  empty_line = "|#{' ' * (message[0..75].size + 2)}|"

  puts horizontal_rule
  puts empty_line
  print_text_from_array(split_text_to_array(message, 76), 76)
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Matthew Johnston')
print_in_box("I'm going to make this message really, really long, so that I can test out my truncations!")
print_in_box("Okay. Here's gonna be a really, really long one. I want to really test this baby out now. This is gonna be a super huge box with lots and lots of text. I hope my program doesn't crash and burn. What do you guys think of my creation???")

