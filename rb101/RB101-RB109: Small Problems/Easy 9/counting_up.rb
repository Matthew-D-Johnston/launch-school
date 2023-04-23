# counting_up.rb
# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is
# greater than 0.

def sequence(number)
  (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

puts '------'

# Launch School solution:
# similar to mine.


# Food for thought: what do you think `sequence` should return if the argument
# is not greater than 0. For instance, what should you do if the argument is
# `-1`? Can you alter your method to handle this case?

def sequence(number)
  number > 0 ? (1..number).to_a : (number..0).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1)
p sequence(-1)
p sequence(-5)
p sequence(0)