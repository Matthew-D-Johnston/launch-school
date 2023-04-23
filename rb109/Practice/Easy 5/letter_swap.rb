# letter_swap.rb

# write a method
# takes a string of words separated by spaces as input
# outputs a string with first and last letter of each word swapped

# split the string at spaces for each word
# for each word I need: first_char = word[0], last_char = word[-1]
# then, I need to do word[0] = last_char, and word[-1] = first_char

# array.each do |word|
#   first_char = word[0]
#   last_char = word[-1]
#   word[0] = last_char
#   word[-1] = first_char
# end

def swap(string)
  swapped = string.split.each do |word|
    first_char = word[0]
    last_char = word[-1]
    word[0] = last_char
    word[-1] = first_char
  end
  swapped.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
t