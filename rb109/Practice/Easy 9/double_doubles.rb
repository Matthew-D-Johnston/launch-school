# double_doubles.rb

# write a method:
# input: a number
# output: twice the number, or if the number is a double number, then just the
# number itself

def twice(number)
  string_number = number.to_s
  midpoint = string_number.length / 2

  if midpoint == 0
    number * 2
  elsif string_number[0..(midpoint - 1)] == string_number[midpoint..-1]
    number
  else
    number * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
