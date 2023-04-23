# convert_number_to.rb
# Write a method that takes a positive integer as an argument and returns that
# number with its digits reversed.

# Don't worry about arguments with leading zeros--Ruby sees those as octal
# numbers, which will cause confusing results. For similar reaons, the return
# value for our fourth example doesn't have any leading zeros. 

def reversed_number(number)
  number.to_s.reverse.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1

puts '------'

# Launch School solution:

def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1
