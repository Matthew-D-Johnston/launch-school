# sequence_count.rb

# create a method
# input: two separate integers
# first integer: a count
# second integer: first number of a sequence that my method creates
# output: an array containing the same number of elements as the count
# while the values of each element will be multiples of the starting number

def sequence(count, start_number)
  results = []
  1.upto(count) { |multiplier| results << start_number * multiplier }
  results
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
