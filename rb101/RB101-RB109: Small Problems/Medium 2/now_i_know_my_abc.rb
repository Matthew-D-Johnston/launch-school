# now_i_know_my_abc.rb
# A collection of spelling blocks has two letters per block, as shown in this
# list:
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used
# once. Write a method that returns `true` if the word passed in as an
# argument can be spelled from this set of blocks, `false` otherwise.

# Pseudo-Code:

# Data Structure:
# Input: a string representation of a word
# Output: a boolean value; true if the word passed in as an argument can be
# spelled from the set of blocks given, and false otherwise.
# rules: cannot use both letters from any given block and each block can only
# be used once.

# Algorithm:
# 1) Create a constant of the blocks: SPELLING_BLOCKS = [['B', 'O'],
#    ['X', 'K'], ... ]
# 2) initialize method definition: def block_word?(word)
# 3) split the word into individual chars: chars_of_word = word.chars
# 4) Create an empty array called spelling_block_indices = []
# 5) iterate over the spelling blocks array with each_with_index:
#    SPELLING_BLOCKS.each_with_index do |block, idx|
# 6) within the each_with_index method block call the each method on the
#    chars_of_word array: chars_of_word.each do |letter|
# 7) within the each method block assign idx to the spelling_block_indices
#    array if block.include?(letter)
# 8) For now return the spelling_block_indices

SPELLING_BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
                   ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
                   ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  spelling_block_indices = []

  SPELLING_BLOCKS.each_with_index do |block, idx|
    word.chars.each do |letter|
      spelling_block_indices << idx if block.include?(letter.upcase)
    end
  end

  spelling_block_indices == spelling_block_indices.uniq
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
puts block_word?('box') == false
puts block_word?('Frazzle') == false
puts block_word?('Grail') == true

puts '------'

# Launch School solution:

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
puts block_word?('box') == false
puts block_word?('Frazzle') == false
puts block_word?('Grail') == true
