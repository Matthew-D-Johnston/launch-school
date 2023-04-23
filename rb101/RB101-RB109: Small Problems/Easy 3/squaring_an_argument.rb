# squaring_an_argument.rb
# Using the `multiply` method from the "Multiplying Two Numbers" problem, write
# a method that computes the square of its argument (the square is the result
# of multiplying a number by itself).

def square(number)
  number * number
end

puts square(5) == 25
puts square(-8) == 64
puts '--------'

# Launch School's Solution (I get what they meant now):
def multiply(first_num, second_num)
  first_num * second_num
end

def square(n)
  multiply(n, n)
end

puts square(5) == 25
puts square(-8) == 64

puts '-------'

# Further Exploration:
# What if we wanted to generalize this method to a "power to the n" type
# method: cubed, to the 4th power, to the 5th, etc. How would we go about
# doing so while still using the `multiply` method?

def power_to_the_n(number, n)
  multiply(number, number) * (number.to_f ** (n - 2))
end

puts power_to_the_n(2, 2) == 4
puts power_to_the_n(2, 3) == 8
puts power_to_the_n(3, 3) == 27
puts power_to_the_n(2, 5) == 32
puts power_to_the_n(2, 1)
puts power_to_the_n(2, 0)
