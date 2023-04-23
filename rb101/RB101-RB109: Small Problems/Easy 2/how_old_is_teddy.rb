# how_old_is_teddy.rb
# Build a program that randomly generates and prints Teddy's age. To get
# the age, you shold generate a random number between 20 and 200.

# Pseudo-code:
# Generate a random number.
# Include random number in following statement:
# "Teddy is #{random number} years old!"

# Formal pseudo-code:
# START
# SET rand_no = random number between 20 and 200.
# PRINT "Teddy is #{rand_no} years old!"
# END

puts "Teddy is #{rand 20..200} years old!"

puts "-------"

# Launch School solution:

age = rand(20..200)
puts "Teddy is #{age} years old!"

puts "-------"

# Further Exploration:
# Modify this program to ask for a name, and then print the age for
# for that person. For an extra challenge, use "Teddy" as the name if
# no name is entered.

# Pseudo-code:
# Ask the user for their name.
# As long as the name is a string, proceed.
# If the user does not input in a valid name, loop back to ask their
# name again.
# If no name is given, use 'Teddy' as the default name.
# Print out the string using the given name and a random age in the
# following string: "#{name} is #{rand 20..200} years old!".

# Formal Pseudo-code:
# START by asking the user for their name.
# SET given input to `name` variable.
# IF `name` is not a string: PRINT: "Hmmm...that is not a valid name"
# IF no input is given, use the name 'Teddy'.
# PRINT "#{name} is #{rand 20..200} years old!"
# END

puts "What is your name?"
name = gets.chomp

if name == ''
  puts "Teddy is #{rand 20..200} years old!"
else
  puts "#{name.capitalize} is #{rand 20..200} years old!"
end
