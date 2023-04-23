# featured_number.rb

def multiple_of_seven(int)
  until int % 7 == 0
    int += 1
  end
  int
end

def odd_and_unique(int)
  int_arr = int.to_s.chars
  
  until (int.odd? && int_arr.uniq == int_arr) || int >= 9_999_999_999
    int += 7
    int_arr = int.to_s.chars
  end
  
  int
end

def featured(given_value)
  featured_num = odd_and_unique(multiple_of_seven(given_value + 1))
  
  if featured_num < 9_999_999_999
    featured_num
  else
    puts "There is no possible number that fulfills those requirements."
  end
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999)

puts '------'

# Launch School Solution:

def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0
    
  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end
  
  'There is no possible number that fulfills those requirements.'
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999)