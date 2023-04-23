# swap_case.rb
# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

# You may not use `String#swapcase`; write your own version of this method.

# Pseudo-code:

# Data Structure:
# input: a string
# output: a new string in which every uppercase letter is replaced by its
# lowercase version, and every lowercase letter by its uppercase version.

# 1) Start be defining two constants: 1) UPPERCASE = ('A'..'Z').to_a; and 2)
# LOWERCASE = ('a'..'z').to_a
# 2) initialize the method definition: def swapcase(string)
# 3) split the string into separate characters: chars_array = string.chars
# 4) define a changed_case_array = []
# 5) Start a loop that loops through each characters: chars_array.each do |char
# 6) There are three separate cases two consider: a) when
#    UPPERCASE.include?(char), b) when LOWERCASE.include?(char), and c) when
#    neither of those conditions are satisfied.
# 7) For UPPERCASE.include?(char):
#     - char = LOWERCASE[UPPERCASE.index(char)]
#     - changed_case_array << char
# 8) similar for the lowercase version
# 9) for the third case, simply, changed_case_array << char
# 10) end the each loop, and return the chanced_case_array.join(' ')

UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def swapcase(string)
  chars_array = string.chars
  changed_case_array = []

  chars_array.each do |char|
    if UPPERCASE.include?(char)
      char = LOWERCASE[UPPERCASE.index(char)]
      changed_case_array << char
    elsif LOWERCASE.include?(char)
      char = UPPERCASE[LOWERCASE.index(char)]
      changed_case_array << char
    else
      changed_case_array << char
    end
  end

  changed_case_array.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

puts '------'

# Launch School solution:

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.uppercase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
