# l5_pp_8.rb

# Practice Problem 8
# Using the `each` method, write some code to output all of the vowels from the
# strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.each do |array|
  array.each do |string|
    string.chars.each { |char| puts char if %w(a e i o u).include?(char) }
  end
end
puts '-----'

# Launch School solution:

vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end

