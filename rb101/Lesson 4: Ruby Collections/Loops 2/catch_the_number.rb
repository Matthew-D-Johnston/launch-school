# catch_the_number.rb
# Modify the following code so that the loop stops if `number` is between 0 and
# 10.

loop do
  number = rand(100)
  puts number
  break if (0..10).include?(number)
end
