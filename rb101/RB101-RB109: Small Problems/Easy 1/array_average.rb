# array_average.rb
# Write a method that takes one argument, an array containing integers,
# and returns the average of all numbers in the array. The array will
# never be empty and the numbers will always be positive integers.

# Pseudo-code:
# Take an array of numbers.
# Check to make sure the array is not empty, and that each number is
# a positive integer. If these conditions are not satisfied, print out
# a message indicating the the input was invalid.
# If the conditions are satisfied then take the average of every number
# in the array and return the result.

# Formal pseudo-code:
# START by definning a method `average(array)` that takes an array as
# an argument.
# READ the input:
# IF array == [], PRINT "Invalid Input: input must be non-empty array."
# ELSIF a single element in the array is not equal to that element
# converted to an integer OR element is not positive, PRINT "Invalid Input: every element of array
# must be a positive integer"
# ELSE take the average of all elements in the array.
# RETURN the final result.
# END

def average(array)
  # create an array that extracts any element that is either a non-integer or non-positive.
  clean_arr = array.select { |element| element == element.to_i && element > 0 }  
  
  # Checks array to ensure it is non-empty and all elements are positive integers.
  # If so, then it will evaluate the average of all elements.
  if array == []  # empty array???
    "Invalid Input: input must be a non-empty array."
  elsif clean_arr.length < array.length   # refers to variable created above to check to ensure elements are positive integers.
    "Invalid Input: input must be a positive integer."
  else
    avg = array.sum / array.length
  end
end

puts average([])
puts average([3, 6, 7, 't', 9])
puts average([3, 6, 7, -4, 10])
puts average([3, 4, 5, 6, 0])
puts average([4, 5, 1, 1])
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


puts "-----"

# Launch School solution:

def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }   # `#reduce` is from the Class `Enumerable`. 
  sum / numbers.count
end


puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts "------"


# Further exploration:
# Allow for the return value of `average` to be a `Float`.


def average(array)
  # create an array that extracts any element that is either a non-integer or non-positive.
  clean_arr = array.select { |element| element == element.to_i && element > 0 }  
  
  # Checks array to ensure it is non-empty and all elements are positive integers.
  # If so, then it will evaluate the average of all elements.
  if array == []  # empty array???
    "Invalid Input: input must be a non-empty array."
  elsif clean_arr.length < array.length   # refers to variable created above to check to ensure elements are positive integers.
    "Invalid Input: input must be a positive integer."
  else
    avg = array.sum / array.length.to_f     # modification here to allow for result to be a float.
  end
end

puts average([1, 5, 87, 45, 8, 8]) 
puts average([9, 47, 23, 95, 16, 52])

        