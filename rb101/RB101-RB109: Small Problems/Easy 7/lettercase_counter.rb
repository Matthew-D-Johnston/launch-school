# lettercase_counter.rb
# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

# Pseudo-code:

# Data Structure:
# input: string of characters
# output: hash with 3 entries: 1) lowercase: total number; 2) uppercase: total
# number; and 3) neither: total number.

# Algorithm:
# 1) begin by initializing the method definition: def letter_case_count(string)
# 2) split the string into separate characters: string.chars
# 3) use `each_with_object({})` to iterate over each character and splitting
# the block into 3 separate conditions: 1) if ('a'..'z').to_a.include?(char);
# 4) elsif ('A'..'Z').to_a.include?(char); and else
# each conditional will add the appropriate character to the appropriate key in
# the hash.

def letter_case_count(string)
  lowercase = []
  uppercase = []
  neither = []
  result_hash = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if ('a'..'z').to_a.include?(char)
      lowercase << char
      result_hash[:lowercase] = lowercase.size
    elsif ('A'..'Z').to_a.include?(char)
      uppercase << char
      result_hash[:uppercase] = uppercase.size
    else
      neither << char
      result_hash[:neither] = neither.size
    end
  end
  result_hash
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts '------'

# Launch School solution:
# 1)

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if UPPERCASE_CHARS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_CHARS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

puts '------'

# 2)

def letter_case_count(string)
  counts = {}
  chacters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z] }
  counts
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
        