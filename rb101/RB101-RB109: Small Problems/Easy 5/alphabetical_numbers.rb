# alphabetical_numbers.rb
# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# Pseudo-code:

# Data Structure:
# input: array of integers between 0 and 19
# output: array of the same integers but sorted alphabetically by their English
# word equivalents.
# rules:

# Algorithm:
# 1) Begin by defining a hash with integer keys from 0 to 19, and with values
# corresponding to their English word equivalents.
# 2) initialize our `alphabetic_number_sort(array)` method definition.
# 3) Transform each integer in the array to its English word equivalent using
# the `map` method: `num_words = array.map { |num| INTEGER_WORD[num] }
# 4) sort the `num_words` array alphabetically using `sort`
# 5) Transform each word back into its integer equivalent using `map` { |word|
# INTEGER_WORD.key(word) }

INTEGER_WORD = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four',
            5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
            10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen',
            14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen',
            17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen' 
          }

def alphabetic_number_sort(int_array)
  num_words_sorted = int_array.map { |num| INTEGER_WORD[num] }.sort
  num_words_sorted.map { |word| INTEGER_WORD.key(word) }
end

puts alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19,
                                              1, 7, 17, 6, 16, 10, 13, 3, 12,
                                              2, 0
                                            ]

puts '-----'

# Launch School solution:

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

puts alphabetic_number_sort((0..19).to_a) == [8, 18, 11, 15, 5, 4, 14, 9, 19,
                                              1, 7, 17, 6, 16, 10, 13, 3, 12,
                                              2, 0
                                            ]
