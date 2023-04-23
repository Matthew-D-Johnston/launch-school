# lettercase_percentage_ratio.rb

# write a method:
# input: a string of characters
# output: a hash with 3 entries: 1) percentage of lowercase letters;
# 2) percentage of uppercase letters; 3) percentage that are neither

# Data Structure:
# strings, hashes, symbols, floats

# Algorithm
# total_chars = string.length
# I want to create two constants, each an array, where one contains all
# lowercase letters and the other uppercase letters
# create a new hash: cases = { lowercase: 0 .... }
# iterate over each character of the string, and checking against the three
# cases, incrementing the components of the hash that are satisfied by each
# case;

# method definition(string)
#   Get total characters with string.length.to_f
#   cases = { lowercase: 0, uppercase: 0, neither: 0 }
#   cases[:lowercase] = string.count(LOWERCASE.join) / 
#     


LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_percentages(string)
  total_chars = string.length.to_f
  percentage_factor = (1 / total_chars) * 100
  cases = { lowercase: 0, uppercase: 0, neither: 0 }

  lowercase = string.count(LOWERCASE.join)
  uppercase = string.count(UPPERCASE.join)
  neither = total_chars - (lowercase + uppercase)

  cases[:lowercase] = (lowercase * percentage_factor).round(1)
  cases[:uppercase] = (uppercase * percentage_factor).round(1)
  cases[:neither] = (neither * percentage_factor).round(1)

  cases.keys.each do |current_case|
    if cases[current_case].round == cases[current_case].round(1)
      cases[current_case] = cases[current_case].round
    else
      cases[current_case] = cases[current_case].round(1)
    end
  end

  cases
end

p letter_percentages('abCdef 123')
p letter_percentages('AbCd +Ef')
p letter_percentages('123')