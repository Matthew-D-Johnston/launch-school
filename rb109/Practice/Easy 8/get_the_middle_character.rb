# get_the_middle_character.rb

# Write a method
# input: a non-empty string
# returns the middle character or characters of the argument

def center_of(string)
  midpoint = string.length / 2
  
  if string.length.odd?
    string[midpoint]
  else
    string[midpoint-1..midpoint]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
