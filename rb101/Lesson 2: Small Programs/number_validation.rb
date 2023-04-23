# number_validation.rb
# Suppose we're building a scientiic calculator, and we now need to account for
# inputs that include decimals. How can we build a validating method, called
# `number?`, to verify that only valid numbers--integers or floats--are
# entered?

# Option 1 (based on previous example in the assignment)

def number?(input)
  Float(input) rescue false
end

# Option 2

# Pseudo-code:
# Receive a string.
# Verify that it is a float number. Essentially, ensure that it is not a non-
# numerical string.
# When non-numerical strings are passed they are converted to 0.0 when the 
# `to_f` method is invoked.
# I also want to treat a '0' entry as a special case.

def number?(input)
  if input.to_f.to_s != input  # examples: "hello", "4", "0"
    input.to_i.to_s == input
  else
    true
  end
end

puts number?("hello")     # => `false`
puts number?("4")         # => `true`
puts number?("0")         # => `true`
puts number?("4.3")       # => `true`
puts number?("0.0")       # => `true`
puts number?("1.")        # edge case which returns `false`


# Launch School solution:

# We'll create a method that tests to see whether the input is either a number
# or a float.

def number?(input)
  integer?(input) || float?(input)
end

# Where `integer?` was defined in the previous example as,

def integer?(input)
  input.to_i.to_s == input
end

# So, all we need to do is implement a `float?` method.

# Option 1 -- just like before, this is the easiest way to check for floats.

def float?(input)
  input.to_f.to_s == input
end

# However, just as I discovered with my code, this method suffers from an edge
# case (i.e. '1.')







