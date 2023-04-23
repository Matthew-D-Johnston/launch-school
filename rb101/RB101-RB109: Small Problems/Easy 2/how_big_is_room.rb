# how_big_is_room.rb
# Build a program that asks a user for the length and width of a room in
# meters and then displays the area of the room in both square meters
# and square feet.

# Note: 1 square meter == 10.7639 square feet.
# Do not worry about validating the input at this time.

# Pseudo-code:
# Ask user to input length in meters. Take input and store it as a
# variable.
# Ask user to input width in meters. Take input and store it as a
# variable.
# Multiply the two inputs for result in meters. Then multiply the result
# in meters by the conversion factor to get result in feet.
# Print the results to the screen with the appropriate message.

# Formal pseudo-code:
# START by prompting user for length in meters.
# GET input using gets.chomp.to_i
# SET input to variable `length`
# PRINT another message prompting user for width in meters.
# GET input using gets.chomp.to_i
# SET input to variable `width`
# READ variables and multiply `length` * `width` for result in square
# meters.
# READ result and multiply by conversion factor (*10.7639) for result
# in square feet.
# PRINT results: "The area of the room is #{size_sm} sqaure meters
# (#{size_sf} square feet)."
# END

puts "Enter the length of the room in meters:"
length = gets.chomp.to_i

puts "Enter the width of the room in meters:"
width = gets.chomp.to_i

size_sm = length * width
size_sf = size_sm * 10.7639

puts <<-MSG
The area of the room is #{size_sm} square meters (#{size_sf} square feet).
MSG

puts "--------"

# Launch School solution:

SQMETERS_TO_SQFEET = 10.7639

puts '==> Enter the length of the room in meters: '
length = gets.to_f

puts '==> Enter the width of the room in meters: '
width = gets.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} " + \
     "square meters (#{square_feet} square feet)."

puts "--------"

# Further Exploration:

# Modify this program to ask for the input measurements in feet,
# and display the results in square feet, square inches, and square
# centimeters.

SQFEET_TO_SQMETERS = 0.09290304
SQFEET_TO_SQCENTIMETERS = SQFEET_TO_SQMETERS * 10000
SQFEET_TO_SQINCHES = 144
# 1 sq meter == 10,000 sq centimeters

puts '==> Enter the length of the room in feet: '
length = gets.to_f

puts '==> Enter the width of the room in feet: '
width = gets.to_f

sq_feet = (length * width).round(2)
sq_inches = (sq_feet * SQFEET_TO_SQINCHES).round(2)
sq_centimeters = (sq_feet * SQFEET_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{sq_feet} square feet " + \
     "(#{sq_inches} square inches; or, #{sq_centimeters} " + \
     "square centimeters)."
