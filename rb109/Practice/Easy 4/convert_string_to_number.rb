# convert_string_to_number.rb

DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
          }

def string_to_integer(numeric_str)
  numeric_arr = numeric_str.chars

  idx = numeric_arr.size
  sum = 0
  multiplier = 1

  loop do
    idx -= 1
    sum += DIGITS[numeric_arr[idx]] * multiplier
    multiplier *= 10
    break if idx == 0
  end

  sum
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

