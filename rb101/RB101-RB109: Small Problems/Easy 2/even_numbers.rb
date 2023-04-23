# even_numbers.rb
# Print the even numbers from 1 to 99, inclusive. All numbers should be printed
# on separate lines.

# Solution 1:
puts "One:"

for i in 1..99
  puts i if i.even?
end

puts "----"

# Solution 2:
puts "Two:"

for i in 1..99
  puts i if i % 2 == 0
end

puts "----"

# Solution 3:
puts "Three:"

counter = 2
while counter <= 98
  puts counter
  counter += 2
end

puts "----"

# Solution 4:
puts "Four:"

(1..99).each { |i| puts i if i.even? }

puts "----"

# Launch School Solution:
puts "Five:"

value = 1
while value < 99
  puts value if value.even?
  value += 1
end
