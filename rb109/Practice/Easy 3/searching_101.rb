# searching_101.rb

ORDER = %w(1st 2nd 3rd 4th 5th last)

numbers = []
last_num = nil

ORDER.each do |ord|
  puts "==> Enter the #{ord} number:"
  response = gets.chomp.to_i
  numbers.size < (ORDER.size - 1) ? numbers << response : last_num = response
end

if numbers.include?(last_num)
  puts "The number #{last_num} appears in #{numbers}."
else
  puts "The number #{last_num} does not appear in #{numbers}."
end
