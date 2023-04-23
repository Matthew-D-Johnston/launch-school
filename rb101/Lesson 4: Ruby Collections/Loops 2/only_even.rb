# only_even.rb
# Using `next`, modify the code below so that it only prints even numbers.

number = 0

until number == 10
  number += 2
  puts number
end

puts '----'


# Launch School solution:

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end
