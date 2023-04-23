# whats_my_bonus.rb
# Write a method that takes two arguments, a positive integer and a
# boolean, and calculates the bonus for a given salary. If the boolean
# is `true`, the bonus should be half of the salary. If the boolean is
# `false`, the bonus should be `0`.

# Pseudo-code
# Begin by taking two inputs, a postive integer and a boolean.
# Detemine which boolean value is given: if `true` then the bonus will
# be half the salary, else, the bonus will be zero.

# Formal pseudo-code:
# START by definint a method `calculate_bonus(salary, boolean)`.
# GET inputs.
# READ boolean: IF boolean == `true` then bonus = salary / 2;
# ELSE bonus = 0.
# RETURN bonus variable.
# END

def calculate_bonus(salary, bonus)
  if bonus
    salary / 2
  else
    0
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

puts "------"

# ...or...

def calculates_bonus(salary, boolean)
  boolean ? salary / 2 : 0
end

puts calculates_bonus(2800, true) == 1400
puts calculates_bonus(1000, false) == 0
puts calculates_bonus(50000, true) == 25000

puts "------"

# Launch School solution:
# essentially, same as my second solution.
