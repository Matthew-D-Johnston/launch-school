# searching_101.rb
# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5
# numbers.

# Pseudo-code:
# Prompt the user for a number and store the input to a variable.
# Check to ensure the input was valid.
# Do this six times
# Each number should be stored in an array.
# For the sixth number, see if it matches any of the other five numbers in the
# array.

# Formal Pseudo-code:
# START by defining a `prompt(message)` method to standardize messages.
# DEFINE a `valid_number?(input)` method to ensure the input is valid.
# DEFINE an array that includes, '1st', '2nd', '3rd', '4th' and '5th'.
# DEFINE a `number_included?` method to see if a given number is included in
# a given array.
# LOOP through questions 1-5 that ask the user for a number.
# GET the input each time, checking its validity and storing it in a
# `numbers` array.
# Once the array has a length/size of five, break out of the loop.
# GET response to final question for the sixth number.
# EVALUATE the response in the `number_included?` method.
# PRINT a message indicating whether or not the number appears within the array
# of numbers that was created from the users input.

# methods:
def prompt(message)
  puts "==> #{message}"
end

def valid_number?(number)
  number.to_i.to_s == number
end

# variables:
question_no = ['1st', '2nd', '3rd', '4th', '5th']

# code:
numbers = []
while numbers.size < 5
  prompt("Enter the #{question_no[numbers.size]} number:")
  number = gets.chomp
  if valid_number?(number)
    numbers << number.to_i
    next
  else
    prompt("Invalid input.")
  end
end

last_number = ''
loop do
  prompt("Enter the last number:")
  last_number = gets.chomp
  if valid_number?(last_number)
    last_number = last_number.to_i
    break
  else
    prompt("Invalid input.")
  end
end

if numbers.include?(last_number)
  prompt("The number #{last_number} appears in #{numbers}.")
else
  prompt("The number #{last_number} does not appear in #{numbers}.")
end
