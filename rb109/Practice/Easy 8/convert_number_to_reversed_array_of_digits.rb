# convert_number_to_reversed_array_of_digits.rb

# write a method
# input: positive integer
# output: returns number with digits reversed

def reversed_number(number)
  number.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21
p reversed_number(12003) == 30021
p reversed_number(1) == 1
