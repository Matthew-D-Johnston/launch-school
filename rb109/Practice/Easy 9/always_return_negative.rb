# always_return_negative.rb

# write a method:
# input: number
# output: return the negative of that number

def negative(number)
  number <= 0 ? number : number * -1
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0
