# multiples_of.rb
# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples. For
# instance, if the supplied number is `20`, the result should be `98` (3 + 5 + 
# 6 + 9 + 10 + 12 + 15 +18 +20).

# You may assume that the number passed in is an integer greater than 1.

def multisum(number)
  (1..number).select { |num| num % 3 == 0 || num % 5 == 0}.sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts multisum(2)

puts '-----'

# Launch School solution:

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = 0
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number
    end
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts multisum(2)

puts '-----'

# Further Exploration:
# Investigate `Enumerable.inject` (also known as `Enumerable.reduce`). How
# might this method be useful in solving this problem? (Note that `Enumerable`
# methods are available when working with Arrays.) Try writing such a solution.
# Which is clearer? Which is more succinct?

def multisum(number)
  (1..number).inject(0) do |sum, n| 
    (n % 3 == 0) || (n % 5 == 0) ? sum + n : sum + 0
  end
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts multisum(2)

