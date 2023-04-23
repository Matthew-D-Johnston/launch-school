# mlutiplicative_average.rb
# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

# Pseudo-code:

# Data-Structure:
# input: an array of integers
# output: a multiplicative average of the numbers rounded to 3 decimal places.
# rules: multiplicative average = all numbers multiplied with each other and
# then divided by the total number of numbers.

def show_multiplicative_average(array)
  result = format("%.3f", array.reduce(:*).to_f / array.size)
  puts "The result is #{result}"
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])
puts '------'

# Launch School solution:

def show_multiplicative_average(numbers)
  product = 1.to_f
  numbers.each { |number| product *= number }
  average = product / numbers.size
  puts format('%.3f', average)
end

show_multiplicative_average([3, 5])
show_multiplicative_average([6])
show_multiplicative_average([2, 5, 7, 11, 13, 17])

