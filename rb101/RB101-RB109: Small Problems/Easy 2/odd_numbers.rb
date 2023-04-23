# odd_numbers.rb
# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed
# on separate lines.

for i in 1..100
  puts i if i.odd?
end

# ...or...
puts "------"

for i in 1..100
  puts i if i % 2 != 0
end

puts "------"

# Launch School solution:

value = 1
while value <= 99
  puts value
  value += 2
end
