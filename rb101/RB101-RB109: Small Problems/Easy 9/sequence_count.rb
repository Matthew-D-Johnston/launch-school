# sequence_count.rb
# Create a method that takes two integers as arguments. The first argument is a
# count, and the second is the first number of a sequence that your method will
# create. The method should return an Array that contains the same number of
# elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value. If the count is
# 0, an empty list should be returned.

# Pseudo-code:

# Data Structure:
# input: two arguments: 1) a count that specifies the number of elements in the
# the final array to be returned; 2) the first number of a sequence that the
# method will create.
# output: an array with the same number of elements specified by the first
# argument, and whose elements are multiples of the number given as the second
# argument.
# rules:
# 1) count argument always has a value of 0 or greater
# 2) starting number can be any integer value
# 3) if the count is zero, an empty list should be returned

# Algorithm:
# 1) initialize the method definition: def sequence(count, start)
# 2) define an empty results array: results = []
# 3) use the upto method with 1 as the object being passed to the method and
#    the count argument as the limit; inside the block, multiply each number
#    from one to count by the second method, and shove (<<) to the results
#    array: 1.upto(count) { |num| results << num * start }

def sequence(count, start)
  results = []
  1.upto(count) { |num| results << num * start }
  results
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

puts '-----'

# Launch School solutions:
# 1.

def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

puts '-----'

# 2.

def sequence(count, first)
  (1..count).map { |idx| idx * first }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
