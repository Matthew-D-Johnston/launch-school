# diamonds.rb
# Write a method that displays a 4-pointed diamond in an n x n grid, where `n`
# is an odd integer that is supplied as an argument to the method. You may
# assume that the argument will always be an odd integer.

# Pseudo-Code

# Data Structure:
# input: an odd integer n
# output: n rows of '*'s, starting with one star centred at the midpoint of n,
# and becoming successively larger by adding two '*'s every line. Until the
# row that is the midpoint of n, after which two '*'s are subtracted from each
# line.
# rules: assume only odd integer inputs

# Algorithm:
# 1) initialize method definition: def diamond(n)
# 2) need to print n rows
# 3) create a spacer variable: spacer = n / 2
# 4) create a stars variable: stars = 1
# 5) start a loop that prints the number of space indicated by the spacer
#    followed by the number of stars indicated by the star variable; on each
#    iteration, deduct one from the spacer variable and adds two to the stars
#    variable.
# 6) Use the `abs` method on spacer when determining the number of spaces to
#    print since deducting one after it reaches zero will produce negative
#    numbers.
# 7) while stars < n, add two, otherwise subtract two.
# 8) as the last line of the loop, have a break condition when stars < 1

def diamond(n)
  spacer = n / 2
  stars = 1

  while spacer > 0
    puts (' ' * spacer) + ('*' * stars)
    spacer -= 1
    stars += 2
  end

  while stars > 0
    puts (' ' * spacer) + ('*' * stars)
    spacer += 1
    stars -= 2
  end
end

diamond(3)
puts ''
diamond(9)
puts ''
diamond(11)
puts ''
diamond(13)

puts '------'

# Launch School solution:

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance) { |distance| print_row(grid_size, distance) }
end

diamond(3)
puts ''
diamond(9)
puts ''
diamond(11)
puts ''
diamond(13)

puts '------'

# Further Exploration:

# Try modifying your solution or our solution so it prints only the outline of
# the diamond.

# Algorithm:
# will need an outer_spacer and an inner_spacer
# outer_spacer is already defined
# inner_spacer = 1 and increments by two up until it is greater than half of n
#

def diamond(n)
  outer_spacer = n / 2
  inner_spacer = 1

  puts (' ') * (1 + outer_spacer) + '*'

  while outer_spacer > 0
    puts (' ' * outer_spacer) + '*' + (' ' * inner_spacer) + '*'
    outer_spacer -= 1
    inner_spacer += 2
  end

  while inner_spacer > 0
    puts (' ' * outer_spacer) + '*' + (' ' * inner_spacer) + '*'
    outer_spacer += 1
    inner_spacer -= 2
  end

  puts (' ' * outer_spacer) + '*'
end

diamond(3)
puts ''
diamond(9)
puts ''
diamond(11)
puts ''
diamond(13)

puts '------'