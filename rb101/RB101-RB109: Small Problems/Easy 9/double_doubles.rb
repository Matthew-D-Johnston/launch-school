# double_doubles.rb
# A double number is a number with an even number of digits whose left-side
# digits are exactly the same as its right-side digits. For example, `44`,
# `3333`, `103103`, `7676` are all double numbers. `444`, `334433`, and `107`
# are not.

# Pseudo-code:
# input: a number
# output: 2 times the number, unless the argument is a double number; double
# numbers should be returned as-is.

# Algorithm:
# 1) initialize the method defintion: def twice(num)
# 2) Two different possibilities for output depending on the input; thus a
#    conditional statement will be needed; also, double numbers contain an even
#    number of digits;
# 3) initalize a separate method that checks to see if a number is a double
#    number: def is_double_number?(number)
# a) need to cut the number evenly in half and compare both halves; if they are
#    equal then the method should return true; if not, then false.
# b) first convert to string: str_num = number.to_s
# c) get the index of the middle of the string: mid_index = str_num.size / 2
# d) create a conditional that compares the two sides of the string as integers:
#    str_num[0...mid_index].to_i == str_numb[0..mid_index].to_i ? true : false
# 4) Back to the original method, we can now create a conditional that returns
#    the original number if the is_double_number? method returns true, and
#    twice the number if not.


def is_double_number?(number)
  str_num = number.to_s
  mid_index = str_num.size / 2
  str_num[0...mid_index].to_i == str_num[mid_index..-1].to_i ? true : false
end

def twice(number)
  is_double_number?(number) ? number : number * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice (7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
puts twice(1)
puts is_double_number?(5)



