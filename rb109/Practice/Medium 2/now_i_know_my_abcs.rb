# now_i_know_my_abcs.rb

# write a method
# input: a string object (i.e. a word)
# output: a boolean: true if word passed in can be spelled from set of blocks;
# false otherwise

# true condition: word does not use both letters and uses a block only once

# Data Structure
# strings and arrays

# letter blocks: nested arrays (i.e. each pair of letters are grouped in an
# an array, which is nested in an array containing all groups)
# clone a constant array within the method

# for the word:
# it is a string
# going to want to iterate through each letter of the word
# compare it with each 

# use 0.upto(length of Letter Blocks) do |idx|
#   times_block_is_used = 0
#   word.each_char do |char|
#     times_block_is_used += LETTER_BLOCKS[idx].count(char.upcase)
#   end 
#   if times_block_is_used > 1
#       result = false
#   else
#       result = true
#   end





LETTER_BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
                 ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
                 ['V', 'I'], ['L', 'Y'], ['Z', 'M'],
                ]

def block_word?(word)
  letter_blocks = LETTER_BLOCKS.clone
  result = true

  0.upto(letter_blocks.length - 1) do |idx|
    times_block_is_used = 0
    word.each_char do |char|
      times_block_is_used += letter_blocks[idx].count(char.upcase)
    end

    result = false if times_block_is_used > 1
  end

  result
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
