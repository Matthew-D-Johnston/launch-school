# all_substrings.rb
# Write a method that returns a list of all substrings of a string. The
# returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on. Since multiple
# substrings will occur at each position, the substrings at a given position
# should be returned in order from shortest to longest.

# You may (and should) use the `substrings_at_start` method you wrote in the
# previous exercise:

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

p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
]

p substrings('hey') == [
    'h', 'he', 'hey',
    'e', 'ey',
    'y'
]

puts '------'

# Launch School solution:

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end

p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
]

p substrings('hey') == [
    'h', 'he', 'hey',
    'e', 'ey',
    'y'
]
