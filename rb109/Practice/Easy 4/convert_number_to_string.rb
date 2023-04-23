# convert_number_to_string.rb

DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
           5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
          }

def integer_to_string(number)
  numeric_arr = []
  current_number = number

  loop do
    numeric_arr.unshift(DIGITS[current_number % 10])
    current_number /= 10
    break if current_number == 0 
  end

  numeric_arr.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

