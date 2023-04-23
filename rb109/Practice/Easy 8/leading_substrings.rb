# leading_substrings.rb

# Write a method
# input: string
# output: a list (i.e. array) of all substrings of a string starting at the
# beginning of the original string.

def substrings_at_start(string)
  substrings = []

  0.upto(string.length - 1) do |ending_index|
    substrings << string[0..ending_index]
  end

  substrings
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
