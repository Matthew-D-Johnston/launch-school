# exclusive_or.rb
# The `||` operator returns a truthy value if either or both of its operands
# are truthy, a falsey value if both operands are falsey. The `&&` operator
# returns a truthy value if both of its operands are truthy, and a falsey value
# if either operand is falsey. This works great until you need only one of two
# conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a method name `xor` that takes two
# arguments, and returns `true` if exactly one of its arguments is truthy,
# `false` otherwise.

def xor?(arg1, arg2)
  if arg1 && arg2
    false
  elsif (arg1 || arg2) == false
    false
  else
    true
  end
end

puts xor?(true, true) == false
puts xor?(false,false) == false
puts xor?(true, false) == true
puts xor?(false, true) == true
puts '-------'
puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
puts '-------'

# Launch School solution:

def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

puts xor?(true, true) == false
puts xor?(false,false) == false
puts xor?(true, false) == true
puts xor?(false, true) == true
puts '-------'
puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false
puts '-------'

# Further exploration:
# An `xor?` method is useful for modelling any situation in which an mutually
# exclusive choice must be made, disallowing the user from choosing both
# both options or from choosing neither option.

# No, a short-circuit operation doesn't make sense. For the `xor?` method to
# properly return a value it must now what both arguments are.
