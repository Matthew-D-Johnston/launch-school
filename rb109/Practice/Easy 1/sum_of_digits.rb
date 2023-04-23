# sum_of_digits.rb

def sum(number)
  number.to_s.chars.map { |digit| digit.to_i }.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

puts '-----'

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
