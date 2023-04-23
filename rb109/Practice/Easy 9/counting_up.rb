# counting_up.rb

# write a method
# input: integer
# output: array of all integers, in sequence between 1 and the argument

def sequence(number)
  (1..number).to_a
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
