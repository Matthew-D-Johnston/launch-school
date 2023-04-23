# sum_square_square_sum.rb

# Write a method:
# input: integer representing the limit of the range of integers to be operated
# on
# output: integer representing the result of the operation

# Operation Algo
# square of sum = (1..num).reduce(:+)**2
# sum of squares = (1..num).reduce { |sum, n| sum += n**2 }

def sum_square_difference(num)
  (1..num).reduce(:+)**2 - (1..num).reduce { |sum, n| sum += n**2 }
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
