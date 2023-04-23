# diamonds.rb

# Write a method:
# input: an odd integer n
# output: strings: a 4-pointed diamond in an n x n grid

# output will be same number of lines as n
# the middle line will have same number of stars as n
# count up to n, each count will need to print a line with an appropriate
# number of stars

# if n = 5
# first line: 1 star with 2 spaces on either side : 
# ' ' * ((n - 1) / 2) + '*' * 1 + ' ' * ((n - 1) / 2)
# second line: 3 stars with 1 space on either side
# third line: 5 stars with 0 spaces 
# spaces decrease by 1 while stars increase by 2


def diamond(n)
  return puts ' *' if n == 1
  spaces = (n - 1) / 2
  stars = 1

  until spaces < 0
    puts ' ' * spaces + '*' * stars + ' ' * spaces
    spaces -= 1
    stars += 2
  end

  spaces = 1
  stars = n - 2
  until stars <= 0
    puts ' ' * spaces + '*' * stars + ' ' * spaces
    spaces += 1
    stars -= 2
  end
end

diamond(1)
puts '----'
diamond(3)
puts '----'
diamond(5)
puts '-------'
diamond(9)



