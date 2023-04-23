# when_will_i_retire.rb
# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

# Pseduo-code:
# Prompt user for age and at what age they would like to retire.
# Store results in separate variables.
# Extract the current date and store to a variable.
# Subtract current age from age at desired retirment.
# Add the years-to-retirment to the current date.
# Print out a message indicating at what year the user will retire and how many
# years to go until they retire.

# Formal pseudo-code:
# START by prompting user for age: PRINT "What is your age?"
# GET input and SET as `age`.
# PRINT "At what age would you like to retire?", prompting user for more input.
# GET input and SET as `retirement_age`.
# GET current date (`Time.now.year`) and SET as `year`
# SET `years_to_retirement` = `retirement_age` - `age`
# PRINT "It's #{year}. You will retire in #{year + years_to_retirement}."
# PRINT "You have only #{years_to_retirement} of work to go!"

puts "What is your age?"
age = gets.to_i

puts "At what age would you like to retire?"
retirement_age = gets.to_i
years_to_retirement = retirement_age - age

puts "It's #{Time.now.year}. You will retire in #{Time.now.year +
years_to_retirement}."
puts "You have only #{years_to_retirement} years of work to go!"
