# palindromic_numbers.rb
# Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(01210) == true
puts palindromic_number?('hallo') == false

puts '-------'

# Launch School's Solution:

def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(number)
  palindrome?(number.to_s)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(01210) == true
puts palindromic_number?('hallo') == false

puts '------'

# Further Exploration:
# Suppose your number begins with one or more 0s. Will your method still work?
# Why or why not? Is there any way to address this?

# No, it does not work. When trying to convert the number-beginning-with-a-0 to
# a string, it does some weird conversion to a different number. For example,
# `01210.to_s` => "648". Not sure what's going on here. I noticed that simply
# typing `01210` into irb and then hitting the return key produces a value of
# `648`. 

# After some research, it appears that Ruby is converting numbers that lead
# a zero to 'octal' numbers. One way to fix is with the `sprintf` method.

def palindromic_number?(number)
  if number.class == String
    false
  elsif sprintf('0%o', number) == sprintf('0%o', number).reverse
    true
  else
    number.to_s == number.to_s.reverse
  end
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
puts palindromic_number?(01210) == true
puts palindromic_number?('hallo') == false
