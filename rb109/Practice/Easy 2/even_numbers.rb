# even_numbers.rb

value = 2
while value <= 99
  puts value
  value += 2
end

puts '----'

# or

1.upto(99) { |num| puts num if num.even? }

puts '----'

# or

puts (1..99).to_a.select { |num| num % 2 == 0 }


