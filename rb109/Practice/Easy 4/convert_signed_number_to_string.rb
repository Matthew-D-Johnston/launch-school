# convert_signed_number_to_string.rb

DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
           5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
          }

def signed_integer_to_string(number)
  return '0' if number == 0
  numeric_arr = []
  current_number = number.abs

  loop do
    numeric_arr.unshift(DIGITS[current_number % 10])
    current_number /= 10
    break if current_number == 0 
  end

  numeric_str = numeric_arr.join

  number == number.abs ? numeric_str.prepend('+') : numeric_str.prepend('-')
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
