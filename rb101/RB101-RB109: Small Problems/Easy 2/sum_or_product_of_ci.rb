# sum_or_product_of_ci.rb
# Write a program that asks the user to enter an integer greater than 0, then
# asks if the user wants to determine the sum or product of all numbers between
# 1 and the entered integer.

def valid_integer?(number)
  number == number.to_i.to_s && number.to_i > 0
end

def valid_letter?(letter)
  letter == 's' || letter == 'p'
end

def prompt(message)
  puts "=> #{message}"
end

loop do
  integer_response = ''
  loop do
    prompt("Please enter an integer greater than 0:")
    integer_response = gets.chomp
    if valid_integer?(integer_response)
      break
    else
      prompt("Invalid input.")
    end
  end

  letter_response = ''
  loop do
    prompt("Enter 's' to compute the sum, 'p' to compute the product.")
    letter_response = gets.chomp
    if valid_letter?(letter_response)
      break
    else
      prompt("Invalid input.")
    end
  end

  if letter_response == 's'
    sum = (1..integer_response.to_i).sum
    prompt("The sum of the integers between 1 and #{integer_response}" \
           " is #{sum}")
  else
    counter = 1
    product = 1
    while counter <= integer_response.to_i
      product *= counter
      counter += 1
    end
    prompt("The product of the integers between 1 and #{integer_response}" \
           " is #{product}")
  end

  prompt("Would you like to perform another computation?")
  response = gets.chomp

  break unless response == 'y'
end

prompt("Good bye!")

puts "-------"

# Launch School solution:

def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts ">> Please enter an integer greater than 0"
number = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp

if operation == 's'
  sum = compute_sum(number)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
elsif operation == 'p'
  product = compute_product(number)
  puts "The product of the integers between 1 and #{number} is #{product}."
else
  puts "Oops. Unknown operation."
end

puts "-------"

# Modified code using the `inject` method:

def valid_integer?(number)
  number == number.to_i.to_s && number.to_i > 0
end

def valid_letter?(letter)
  letter == 's' || letter == 'p'
end

def prompt(message)
  puts "=> #{message}"
end

loop do
  integer_response = ''
  loop do
    prompt("Please enter an integer greater than 0:")
    integer_response = gets.chomp
    if valid_integer?(integer_response)
      break
    else
      prompt("Invalid input.")
    end
  end

  letter_response = ''
  loop do
    prompt("Enter 's' to compute the sum, 'p' to compute the product.")
    letter_response = gets.chomp
    if valid_letter?(letter_response)
      break
    else
      prompt("Invalid input.")
    end
  end

  if letter_response == 's'
    sum = (1..integer_response.to_i).inject { |sum, n| sum + n }
    prompt("The sum of the integers between 1 and #{integer_response}" \
           " is #{sum}")
  else
    product = (1..integer_response.to_i).inject { |product, n| product * n }
    prompt("The product of the integers between 1 and #{integer_response}" \
           " is #{product}")
  end

  prompt("Would you like to perform another computation?")
  response = gets.chomp

  break unless response == 'y'
end

prompt("Good bye!")
