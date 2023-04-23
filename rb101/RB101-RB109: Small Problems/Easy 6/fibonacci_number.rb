# fibonacci_number.rb
# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout the
# natural world.

# Computationally, the Fibonacci series is a very simple series, but the
# results grow at an incredibly rapid rate. For example, the 100th Fibonacci
# number is 354,224,848,179,261,915,075--that's enormous, especially
# considering that it takes 6 iterations before it generates the first 2 digit
# number.

# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
# Fibonacci number has index 1.)

# You may assume that the argument is always greater than or equal to 2.

# Pseudo-code:

# Data Structure:
# input: integer representing the number of digits of a number within the 
# Fibonacci series.
# output: the index of the first number in the Fibonacci series that has the
# number of digts specified by the input.
# rules: the first Fibonacci number has an index value of 1.
# first two numbers of the Fibonacci series are defined as 1s, but after that,
# starting with the 3rd number the rule is that each number in the series is
# the sum of the prior two numbers.
# assume that the argument is always greater than or equal to 2.

# Algorithm:
# I believe the result can best be achieved in a loop:
# Outside the loop we should first define what we shall call the Fibonacci
# array: fibonacci_array = [1, 1] (we begin by defining the first two elements)
# The loop will need:
# 1) a way of calculating the current value of the Fibonacci series:
# fibonacci_array.last(2).reduce(:+)
# 2) we add that value to the array using fibonacci_array <<
# fibonacci_array.last(2).reduce(:+)
# 3) we then compare that value to the number of digits specified as the
# method's argument: fibonacci_array.last.to_s.size == digits
# 4) we shall also use that as our exit condition for the loop
# 5) once exited the loop we can find the index of the fibonacci number by
# calling `size` on the fibonacci array.

def find_fibonacci_index_by_length(digits)
  fibonacci_array = [1, 1]

  loop do
    fibonacci_array << fibonacci_array.last(2).reduce(:+)
    break if fibonacci_array.last.to_s.size == digits
  end
  fibonacci_array.size
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(3) == 12
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847

puts '-----'

# Launch School solution:

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

puts find_fibonacci_index_by_length(2) == 7
puts find_fibonacci_index_by_length(3) == 12
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
