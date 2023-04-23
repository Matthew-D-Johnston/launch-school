# palindromic_substrings.rb
# Write a method that returns a list of all substrings of a string that are
# palindromic. That is, each substring must consist of the same sequence of
# characters forwards as it does backwards. The return value should be
# arranged in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.

# You may (and should) use the `substrings` method you wrote in the previous
# exercise.

# For the purposes of this exercise, you should consider all characters and pay
# attention to case; that is, `"AbcbA"` is a palindrome, but neither `"Abcba"`
# nor `"Abc-bA"` are. In addition, assume that single characters are not
# palindromes.

# Pseudo-code:

# Data Structure:
# input: a string
# output: an array of palindromic substrings of the original string
# rules:
# 1) palindromes must be case-sensitive
# 2) assume single characters are not palindromes

# Algorithm
# 1) initialize method definition: def palindromes(string)
# 2) pass string to my substrings method and iterate over each element,
#    selecting only those strings that are palindromes and whose size is
#    greater than 1.


def substrings_at_start(string)
  substrings = []
  1.upto(string.size) do |num|
    substrings << string.slice(0, num)
  end
  substrings
end

def substrings(string)
  all_substrings = []
  current_substring = []
  index = 0

  while index < string.size
    current_substring = substrings_at_start(string)[index..(string.size - 1)]
    current_substring.each do |substring|
      all_substrings << substring[index..-1]
    end
    index += 1
  end
  all_substrings
end

def palindromes(string)
  substrings(string).select do |substring|
    substring.size > 1 && substring == substring.reverse
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ["madam", "ada"]
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
puts '------'

# Launch School solution:

def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

p palindromes('abcd') == []
p palindromes('madam') == ["madam", "ada"]
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
puts '------'

# Further Exploration:
# Can you modify this method (and/or its predecessors) to ignore
# non-alphanumeric characters and case? Alphanumeric characters are alphabetic
# characters(upper and lowercase) and digits.

# Response: not sure what is meant by ignore non-alphanumeric characters, but
# I assume ignore case is just to say that palindromes are not case sensitive:

def palindromes(string)
  substrings(string).select do |substring|
    substring.size > 1 && substring.downcase == substring.downcase.reverse
  end
end

p palindromes('abcd') == []
p palindromes('Madam')
