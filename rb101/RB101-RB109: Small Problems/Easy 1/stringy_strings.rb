# stringy_strings.rb
# Write a method that takes one argument, a positive integer, and
# returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# Pseudo-code:
# Take any given integer.
# Define an empty array to be later populated with alternating 1s and 0s. 
# While the length of the array is less or equal to the given integer
# value, keep adding alternating 1s and 0s to the array.
# If the last value added to the array is a 1, then add a 0.
# Else, if the last value added to the array is a 0, then add a 1.
# Once the array is greater than the integer value, exit out of the loop.
# Join the elements of the array into a single string.
# Return the value of the string.

# Formal pseudo-code:
# START by defining a method that takes an integer as an argument.
# SET an empty array as a variable.
# WHILE array length < integer, keep adding alternating 1s and 0s.
# IF last element of array == 1, then append a 0.
# ELSE append a 1.
# SET a new string variable whose value is the joined elements of the array.
# END return the value of the string.

def stringy(integer)
  ones_zeros = []

  while ones_zeros.length < integer
    if ones_zeros.last == 1
      ones_zeros << 0
    else
      ones_zeros << 1
    end
  end

  ones_zeros.join

end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts "-----"

# Launch School solution:

def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts "------"

# Further exploration
# Modify `stringy` so it takes an optional argument that defaults to 1.
# If the method is called with this argument set to `0`, the method should
# return a String of alternaing 0s and 1s, but starting with `0` instead of
# `1`.


def stringy(integer, zero_or_one = 1)
  ones_zeros = []

  if zero_or_one == 0
    while ones_zeros.length < integer
      if ones_zeros.last == 0
        ones_zeros << 1
      else
        ones_zeros << 0
      end
    end
  else
    while ones_zeros.length < integer
      if ones_zeros.last == 1
        ones_zeros << 0
      else
        ones_zeros << 1
      end
    end
  end
  
  ones_zeros.join
end

puts stringy(6, 0) 
puts stringy(9, 0) 
puts stringy(4, 0)
puts stringy(7, 0)



