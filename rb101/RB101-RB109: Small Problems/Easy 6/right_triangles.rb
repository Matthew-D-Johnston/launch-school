# right_triangles.rb
# Write a method that takes a positive integer, `n`, as an argument, and
# displays a right triangle whose sides have `n` stars. The hypoteneuse of the
# triangle (the diagonal side in the images below) should have one end at the
# lower-left of the triangle, and the other end at the upper-right.

# Pseudo-code:

# Data Structure:
# input: positive integer, `n`
# output: a right triangle made of *s whose vertical side is of length `n`, and
# whose hyptoneuse has one end in the lower-left of the triangle and the other
# at the upper-right of the triangle.

# Algorithm:
# 1) start by initializing the method definition: def triangle(n)
# 2) Need a loop that starts with an index = 1
# 3) each iteration of the loop will print n - index blank spaces followed by
# a index numbers of `*`s.
# 4) the loop breaks after `n` `*`s are printed and n = index.

def triangle(n)
  stars = 0

  while stars < n
    stars += 1
    spaces = n - stars
    puts (' ' * spaces) + '*' * stars
  end
end

triangle(5)
triangle(9)
triangle(0)
triangle(1)
triangle(2)
triangle(3)
triangle(4)
triangle(5)

puts '------'

# Launch School solution:

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(5)
triangle(9)
triangle(0)
triangle(1)
triangle(2)
triangle(3)
triangle(4)
triangle(5)

puts '-------'

# Further Exploration:
# Try modifying your solution so it prints the triangle upside down from its
# current orientation. Try modifying your solution again so that you can
# display the triangle with the right angle at any corner of the grid.

# Upside down

def triangle(n)
  spaces = 0

  while spaces < n
    stars = n - spaces
    puts ' ' * spaces + ('*' * stars)
    spaces += 1
  end
end

triangle(5)
puts '-----'

# right-angle in bottom left corner

def triangle(n)
  spaces = 0

  while spaces < n
    spaces += 1
    stars = n - spaces
    puts '*' * spaces + (' ' * stars)
  end
end

triangle(5)

