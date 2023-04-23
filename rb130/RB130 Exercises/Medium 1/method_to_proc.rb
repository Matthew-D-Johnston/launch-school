# method_to_proc.rb

def exponent_of_largest_power(num)
  exp = 0
  largest_power = 0

  while 8**exp < num
    largest_power = 8**exp
    exp += 1
  end

  exp - 1
end


def decimal_to_octal(num)
  return 1 if num == 1
  octal = []

  exponent_of_largest_power(num).downto(0) do |exp|
    largest_power = 8**exp
    remainder = num % largest_power
    octal_digit = (num - remainder) / 8**exp
    octal << octal_digit

    num = remainder
  end

  octal.join.to_i
end

# Or, more simply:

def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc)


# p convert_to_base_8(8)
# p convert_to_base_8(10)
# p convert_to_base_8(12)
# p convert_to_base_8(14)
# p convert_to_base_8(16)
# p convert_to_base_8(33)
# p convert_to_base_8(900)
# p convert_to_base_8(125)
