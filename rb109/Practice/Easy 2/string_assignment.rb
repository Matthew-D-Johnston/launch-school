# string_assignment.rb

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# This code will output:
# BOB
# BOB

