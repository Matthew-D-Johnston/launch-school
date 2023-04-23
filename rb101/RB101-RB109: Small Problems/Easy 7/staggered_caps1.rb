# staggered_caps1.rb
# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count
# as characters when switching between upper and lowercase. 

# Pseudo-code:

# Data Structure:
# input: a String
# output: a new String contaiing the original value with a staggered
# capitalization scheme in which every other character is capitalized, and the
# remaining characters are lowercase.
# rules:
# characters that are not letters should not be changed, but count as
# characters when switching between upper and lower case.

# Algorithm:
# 1) begin by initializing the method definition: def staggered_case(string)
# 2) split the string into individual characters and store in an array:
#    char_array = string.chars
# 3) divide the array into two distinct arrays: 1) even_index and 2) odd_index,
#    by using the `partition` method:
#    even_index, odd_index = char_array.partition { |char| array.index(char)
#    .even? }
# 4) define a staggered_arr = [] and an index = 0 variable
# 5) start a loop that will exit once the index is greater than the largest
#    of the two arrays.
# 6) within the loop, successively add the characters from each array, using
#    upcase and downcase on the appropriate characters before they are stored
#    in the array.
# 7) once the loop is exited, join and return the final array.

def even_indexes_to_uppercase(array)
  uppercase = []
  even_index = 0
  while even_index < array.size
    uppercase << array[even_index].upcase
    even_index += 2
  end
  uppercase
end

def odd_indexes_to_lowercase(array)
  lowercase = []
  odd_index = 1
  while odd_index < array.size
    lowercase << array[odd_index].downcase
    odd_index += 2
  end
  lowercase
end

def staggered_case(string)
  char_array = string.chars
  
  staggered_arr = []
  uppercase_arr = even_indexes_to_uppercase(char_array)
  lowercase_arr = odd_indexes_to_lowercase(char_array)
  index = 0
  loop do
    staggered_arr << uppercase_arr[index]
    staggered_arr << lowercase_arr[index]
    index += 1
    break if index >= uppercase_arr.size && lowercase_arr.size
  end
  staggered_arr.join
end

puts staggered_case("I Love Launch School!") == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts '------'

# Launch School solution:

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

puts staggered_case("I Love Launch School!") == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts '------'

# Further Exploration:
# Can you modify this method so the caller can request that the first character
# be downcased rather than upcased? If the first character is downcased, then
# the second character should be upcased, and so on.

def staggered_case(string, upper_first = true)
  result = ''
  need_upper = upper_first
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

puts staggered_case("I Love Launch School!", false)
puts staggered_case('ALL_CAPS', false)
puts staggered_case('ignore 77 the 444 numbers', false)
