# multiples_of_3_and_5.rb

def multisum(number)
  sum = 0
  1.upto(number) do |num|
    sum += num if (num % 3 == 0) || (num % 5 == 0)
  end
  sum
end

puts multisum(20) == 98
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
