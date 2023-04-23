# medium_one_q_three.rb

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(10)
puts '------'
p factors(23)
puts '------'
puts factors(0)
puts factors(-2)


