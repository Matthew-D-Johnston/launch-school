# count_down.rb

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'

# Modified code:

puts '-----'

counter = 10

10.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'

# Launch School Solution:
puts '-----'

def decrease(counter)
  counter - 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# Further Exploration
puts '----'

counter = 10

counter.times do
  puts counter
  counter -= 1
end

puts 'LAUNCH!'

