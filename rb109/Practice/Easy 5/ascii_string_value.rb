# ascii_string_value.rb

# write a method
# takes a string as an input
# output the ASCII string value of that string
# (ASCII string value is sum of ASCII values of every character in the string)

# split each string into individual characters
# loop through an array of those characters
# call the ord method on each character, adding 

def ascii_value(string)
  total_ascii_value = 0 
  string.each_char { |char| total_ascii_value += char.ord }
  total_ascii_value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
