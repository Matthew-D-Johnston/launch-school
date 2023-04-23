# next_featured_number.rb

# write a method:
# input: integer
# output: integer representing the next featured number higher than the input
# value

# featured number
# 1) odd number (.odd? == true)
# 2) multiple of 7 (number % 7 == 0) == true
# 3) no single ditig occurs more than once
#    (number.to_s.chars == number.to_s.chars.uniq) == true

# Problem:
# given a number find the first multiple of 7 higher than that number and check
# if it is odd && no single digit occurs more than once
# First thing is to see if the given number is a multipe of seven
# until given number % 7 == 0
# if so, just add 7 and check the featured-number conditions--rinse and repeat
# if not, add 1 and check to see if its a multiple of seven
# Another loop:
# until number.odd? && (number.to_s.chars == number.to_s.chars.uniq)
#   number += 7
# end

def featured(number)
  feature = number + 1

  until feature % 7 == 0
    feature += 1
  end

  until feature.odd? && (feature.to_s.chars == feature.to_s.chars.uniq)
    feature += 7
  end

  feature
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

