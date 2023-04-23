# rotation_1.rb
# Write a method that rotates an array by moving the first element to the end
# of the array. The original array should not be modified.

# Do not use the method `Array#rotate` or `Array#rotate!` for your
# implementation.

# Pseudo-code:

# Data Structure:
# input: an array
# output: a rotation of the original array where the first element of the
# original is the last element of the returned array.
# rules: don't use `Array#rotate` or `Array#rotate!`

# Algorithm:
# 1) initialize method definition: def rotate_array(array)

def rotate_array(array)
  array[1..-1] << array[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

puts '------'

# Launch School solution:

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]
p x == [1, 2, 3, 4]

puts '------'

# Further Exploration:
# Write a method that rotates a string instead of an array. Do the same thing
# for integers. You may use `rotate_array` from inside your new method.

# 1) Rotate String

# Pseudo-code:

# Data Structure:
# input: a string
# output: a rotated string where the first character becomes the last character
# of the string.

# Algorithm:
# 1) initialize method definition: def rotate_string(string)
# 2) 

def rotate_string(string)
  rotate_array(string.split('')).join
end

p rotate_string('Hello, World!') == 'ello, World!H'
y = "Matt Johnston"
p rotate_string(y) == 'att JohnstonM'
p y == 'Matt Johnston'
puts '------'

# 2) Rotate Integer

# Pseudo-code:

# Data Structure:
# input: integer
# output: rotated integer where the first digit in the sequence becomes the
# last.

# Algorithm:
# 1) initialize method definition

def rotate_integer(integer)
  rotate_array(integer.to_s.split('')).join.to_i
end

p rotate_integer(1234) == 2341
p rotate_integer(0) == 0
z = 46349
p rotate_integer(z) == 63494
p z == 46349
