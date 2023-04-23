# always_return_negative.rb
# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number. If the number is 0 or
# negative, return the original number.

# Pseudo-code:
# input: any number
# output: a negative version of that number;

# Algorithm:
# 1) initialize the method definition: def negative(number)
# 2) take the absolute value of the number and multiply it by -1:
#    number.abs * -1

def negative(number)
  number.abs * -1
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0

puts '------'

# Launch School solution:

def negative(number)
  number > 0 ? -number : number
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0

puts '------'

# or...

def negative(number)
  -number.abs
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0
