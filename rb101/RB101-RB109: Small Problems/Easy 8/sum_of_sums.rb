# sum_of_sums.rb
# Write a method that takes an Array of numbers and then returns the sum of the
# sums of each leading subsequence for that Array. You may assume that the
# Array always contains at least one number.

# Pseudo-code:

# Data Structure:
# input: an Array of numbers
# output: an integer representing the sum of the sums of each leading
# subsequence of the input
# rules: assume that the Array always contains at least one number

# Algorithm:
# 1) initialize the method definition: sum_of_sums(number_arr)
# 2) store the size of the array in a variable: multiplier = number_arr.size
# 3) store the size in another array called array_size = 4
# 4) define a sum variable: sum = 0
# 5) start a while loop with the condition: while multiplier > 0
# 6) inside the loop, we need to perform an operation that takes the times
#    variable and on the first iteration, multiplies it by the first element
#    of the index: 
#    current_value = multiplier * number_arr[array_size - multiplier]
# 7) subtract one from the multiplier: multiplier -= 1

def sum_of_sums(number_arr)
  array_size = number_arr.size
  multiplier = number_arr.size
  final_sum = 0

  while multiplier > 0
    final_sum += multiplier * number_arr[array_size - multiplier]
    multiplier -= 1
  end
  final_sum
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35

puts '------'

# Launch School solution:
# 1) 

def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

# 2)

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end


