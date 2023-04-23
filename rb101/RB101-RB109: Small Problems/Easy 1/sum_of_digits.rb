# sum_of_digits.rb
# Write a method that takes one argument, a positive integer, and returns
# the sum of its digits.

# Pseudo-code:
# Take any positive integer.
# Split the integer by its individual digits and store them in an array.
# Iterate through the array, summing the values of each element.
# Return the result.

# Formal Pseudo-code:
# START by defining a method, `sum(positive integer)` that takes a
# positive integer as an argument.
# READ the integer input, converting it to a String object, and then
# `#split(//)` it by its individual digits.
# SET the individual digits in an Array object named `digit`.
# READ the `digit` variable, iterating and converting each element to
# an integer
# SET the new integer elements in a variable named `digits_int`.
# READ the new Array with `#reduce` method to sum each element.
# RETURN the result 
# END

def sum(integer)
  int_to_s = integer.to_s                       # convert integer to string

  digit = int_to_s.split(//)                    # split string into individual characters and store in array

  digits_int = digit.map { |digit| digit.to_i } # convert each element of array to an integer

  digits_int.reduce { |sum, n| sum + n }   # or, .reduce(:+); sum the elements of the array
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

puts "------"

# Launch School solution:

def sum(number)
  sum = 0
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

puts "------"

# Launch School second solution:

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45



