# mutation.rb
# What will the following code print, and why? Don't run the code until you
# have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []

array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# My Response:
# => []

# Correct Response:
# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# The first use of the `each` method takes the objects contained within
# `array1` and adds them to `array2`. Thus, while the two arrays are
# themselves different objects, their components refer to identical objects.



