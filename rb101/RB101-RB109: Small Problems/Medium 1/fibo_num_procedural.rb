# fibo_num_procedural.rb
# In the previous exercise, we developed a recursive solution to calculating
# the `nth` Fibonacci number. In a language that is not optimized for recursion
# some (not all) recursive methods can be extremely slow and require massive
# quantities of memory and/or stack space.

# Ruby does a reasonably good job of handling recursion, but it isn't designed
# for heavy recursion; as a result, the Fibonacci solution is only useful up to
# about `fibonacci(40)`. With higher values of `nth`, the recursive solution is
# impractical. (Our tail recursive solution did much better, but even that
# failed at around `fibonacci(8200)`.)

# Fortunately, evey recursive method can be rewritten as a non-recursive
# (procedural) method.

# Rewrite your recursive `fibonacci` method so that it computes its results
# without recursion.

# Pseudo-code

# Data Structure:
# input: an integer representing the nth term of the Fibonacci sequence
# output: an integer, representing the value of the nth term of the Fibonacci
# sequence.
# rules: use a non-recursive method.

# Algorithm:
# 1) initialize the method definition: def fibonacci(nth)
# 2) for nth == 1 and nth == 2 the return value should be 1
# 3) for nth > 2, the return value should be the fibonacci value of the nth - 1
#    term plus the value of the nth - 2 term.
# 4) could define a loop, where starting with minus1 = 1 and minus2 = 1, we
#    define fib = minus 1 + minus 2, and then minus1 = fib and minus2 = minus 1

def fibonacci(nth)
  return 1 if nth <= 2
  
  counter = 3
  minus1 = 1
  minus2 = 1
  fib = 0

  loop do
    fib = minus1 + minus2
    minus2 = minus1
    minus1 = fib
    break if counter == nth
    counter += 1
  end
  fib
end

puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(5)
puts fibonacci(6)
puts fibonacci(20)
puts fibonacci(50)
puts fibonacci(100)
puts fibonacci(100_001)

puts '------'

# Launch School solution:

def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

puts fibonacci(1)
puts fibonacci(2)
puts fibonacci(3)
puts fibonacci(4)
puts fibonacci(5)
puts fibonacci(6)
puts fibonacci(20)
puts fibonacci(50)
puts fibonacci(100)
puts fibonacci(100_001)


