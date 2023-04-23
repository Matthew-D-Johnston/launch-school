# how_big_is_the_room.rb



print "Please enter the length of the room in meters: "
room_length = gets.chomp.to_i

print "Please enter the width of the room in meters: "
room_width = gets.chomp.to_i

area_in_square_meters = room_length * room_width

area_in_square_feet = area_in_square_meters * 10.7639

puts "The area of the room is #{area_in_square_meters} square meters (#{area_in_square_feet} square feet)."