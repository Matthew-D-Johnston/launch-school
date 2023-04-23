# right_triangles.rb

# write a method
# input: positive integer, n
# output: triangle whose sides each have n stars

def triangle(n)
  stars = 1
  spaces = n - stars

  while stars <= n
    puts (' ' * spaces) + ('*' * stars)
    stars += 1
    spaces -= 1
  end
end

triangle(5)
triangle(9)
