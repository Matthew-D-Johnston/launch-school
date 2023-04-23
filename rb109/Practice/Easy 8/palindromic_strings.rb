# palindromic_strings.rb

def substrings_at_start(string)
  substrings = []

  0.upto(string.length - 1) do |ending_index|
    substrings << string[0..ending_index]
  end

  substrings
end

def substrings(string)
  substrings = []
  0.upto(string.length - 1) do |idx|
    substrings << substrings_at_start(string[idx..-1])
  end

  substrings.flatten
end

def palindromes(string)
  substrings(string).select do |substring|
    substring.length > 1 && substring == substring.reverse
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
