# fizzbuzz.rb
# Write a method that takes two arguments: the first is the starting number,
# and the second is the ending number. Print out all numbers between the two
# numbers, except if a number is divisible by 3, print "Fizz", if a number is
# divisible by 5, print "Buzz", and finally if a number is divisible by 3 and
# 5, print "FizzBuzz".

# Pseudo-code:

# Data Structure:
# input: two numbers, one for each of the two parameters
# output: a printout of all numbers except those divisble by 3 and 5; for
# numbers divisble by 3, print "Fizz"; for those divisble by 5, print "Buzz";
# and for those divisible by 3 and 5, print "FizzBuzz"

# Algorithm:
# 1) initialize method definition: def fizzbuzz(beg_num, end_num)
# 2) create an array of the range between the two numbers:
#    range_arr = (beg_num..end_num).to_a
# 3) def a new results array: fizzbuzz_arr = []
# 3) iterate over range_array: range_arr.each do |num|
# 4) On each iteration, pass num through a conditional if/else statment:
# 5) if num % 3 == 0 && num % 5 == 0 then fizzbuzz_arr << 'FizzBuzz'
# 6) elsif num % 3 == 0 then fizzbuzz_arr << 'Fizz'
# 7) elsif num % 5 == 0 then fizzbuzz_arr << 'Buzz'
# 8) else fizzbuzz_arr << num.to_s
# 9) outside the each block, use join(', ') to create a string separated by
#    commas.

def fizzbuzz(beg_num, end_num)
  range_arr = (beg_num..end_num).to_a
  fizzbuzz_arr = []

  range_arr.each do |num|
    fizzbuzz_arr << if num % 3 == 0 && num % 5 == 0
                      'FizzBuzz'
                    elsif num % 3 == 0
                      'Fizz'
                    elsif num % 5 == 0
                      'Buzz'
                    else
                      num.to_s
                    end
  end

  fizzbuzz_arr.join(', ')
end

puts fizzbuzz(1, 15)
puts '------'

# Launch School solution:

def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case 
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

puts fizzbuzz(1, 15)