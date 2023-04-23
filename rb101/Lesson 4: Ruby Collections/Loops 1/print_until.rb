# print_until.rb
# Given the array of several numbers below, use an `until` loop to print each
# number.

numbers = [7, 9, 13, 25, 18]

until numbers.empty?
  puts numbers
  numbers.clear
end

# only critique of my code here is that the `until` loop isn't really
# necessary.

# Launch School gives:

count = 0

until count == numbers.size
  puts numbers[count]
  count += 1
end
