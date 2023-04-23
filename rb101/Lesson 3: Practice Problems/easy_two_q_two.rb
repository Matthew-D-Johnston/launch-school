# easy_two_q_two.rb
# Starting with this string:

munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original
# `munsters_description` above):  

"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# My response:

# 1:
munsters_description.upcase!.gsub!('TH', 'tH').gsub!('M', 'm')

# 2:
munsters_description.downcase!.gsub!('th', 'Th')

# 3:
munsters_description.downcase!

# 4: 
munsters_description.upcase!

# Launch School's Solutions:
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!
