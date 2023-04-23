# uppercase_check.rb

# write a method
# input: string
# output: true if all of the alphabetic characters inside the string are
# uppercase; false otherwise

def uppercase?(string)
  !string.match?(/[a-z]/)
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true
