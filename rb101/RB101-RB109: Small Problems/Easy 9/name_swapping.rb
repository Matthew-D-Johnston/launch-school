# name_swapping.rb
# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name, a
# comma, a space, and the first name.

# Pseudo-code:

# Data Structure:
# input: a single string that includes a first name, followed by a space, and
# then a last name.
# output: a single string that contains the last name, followed by a comma, and
# then the first name.

def swap_name(name)
  "#{name.split[1]}, #{name.split[0]}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
puts swap_name('Matthew Johnston')
puts "-------"

# Launch School solution:

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
puts swap_name('Matthew Johnston')
