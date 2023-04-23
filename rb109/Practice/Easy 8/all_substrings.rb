# all_substrings.rb

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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
