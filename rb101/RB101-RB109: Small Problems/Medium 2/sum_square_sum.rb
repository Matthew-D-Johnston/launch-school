# sum_square_sum.rb

def square_of_sum(n)
  1.upto(n).reduce(:+)**2
end

def sum_of_squares(n)
  1.upto(n).reduce { |sum, num| sum + num**2 }
end

def sum_square_difference(n)
  square_of_sum(n) - sum_of_squares(n)
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150

puts '-----'

# Launch School Solution:

def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0
  
  1.upto(n) do |value|
    sum += value
    sum_of_squares += value**2
  end
  
  sum**2 - sum_of_squares
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150
