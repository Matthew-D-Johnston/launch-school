# multiplying_two_numbers.rb
# Create a method that takes two arguments, multiplies them together, and
# returns the result.

def multiply(first_num, second_num)
  first_num * second_num
end

puts multiply(5, 3) == 15
puts multiply(4, 5)
puts multiply(0, 3)
puts multiply(-4, 7)
puts multiply("hi", 3)
p multiply([3, 2, 6], 2)
