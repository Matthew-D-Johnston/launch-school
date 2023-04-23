# find_the_duplicate.rb
# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and return
# the duplicate value that is known to be in the array.

# Pseudo-code:

# Data Structure:
# input: an array in which there is one set of duplicate values and every other
# value occurs exactly once
# output: return the duplicate value 

# Algorithm:
# 1) begin by initializing the method definition: def find_dup(array)
# 2) need some sort of looping method that iterates through each value and
# stores the current value within an array unless that array already contains
# that value:
# a) define a `duplicate_value` and a `exactly_once_arr` array
# b) use `each` to iterate through the array shoving `<<` each value to the 
# `exactly_once_arr` unless `exactly_once_arr`.include?(current_value)
# c) if it already inludes the value then store the value to our duplicate_
# value variable.
# 3) Return the duplicate_value variable

def find_dup(array)
  duplicate_value = ''
  exactly_once_arr = []

  array.each do |value|
    if exactly_once_arr.include?(value)
      duplicate_value = value
    else
      exactly_once_arr << value
    end
  end
  duplicate_value
end

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

puts '------'

# Launch School solution

def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
