# fibo_num_last_digit.rb

# In the previous exercise, we developed a procedural method for computing the
# value of the `nth` Fibonacci numbers. This method was really fast, computing
# the 20899 digit 100,001st Fibonacci sequence almost instantly.

# In this exercise, you are going to compute a method that returns the last
# digit of the `nth` Fibonacci number.

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

def fibonacci_last(nth)
  fibonacci(nth).digits.first
end

puts fibonacci_last(15)
puts fibonacci_last(20)
puts fibonacci_last(100)
# puts fibonacci_last(100_001)
# puts fibonacci_last(1_000_007)
# puts fibonacci_last(123456789)

puts '-------'

# Launch School solution:

# solution 1:

def fibonacci_last(nth)
  fibonacci(nth).to_s[-1].to_i
end

# solution 2:

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end

puts fibonacci_last(15)
puts fibonacci_last(20)
puts fibonacci_last(100)
puts fibonacci_last(100_001)
# puts fibonacci_last(1_000_007)
# puts fibonacci_last(123456789)

puts '-----'

# Further Exploration

def fibonacci(nth)
  return 1 if nth <= 2
  last_two = [1, 1]
  3.upto(nth) { last_two << (last_two[-1] + last_two[-2])} 
  last_two.last
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
puts '-----'


# 1 - 10, last digit of 10th is 5
# 11 - 20, last digit of 20th is 5
# 21 - 30, last digit of 30th is 0
# then it repeats.
# so, is their a pattern between the upper and lower limits of these ranges
# that would match that of the next thirty
# so once we hit the nth term the last digit will be the same for every
# multiple of 60

# Algorithm:
# for the first 60 numbers of the fibonacci sequence we can just use th

def fibonacci(nth)
  return 1 if nth <= 2
  last_two = [1, 1]
  3.upto(nth) { last_two << (last_two[-1] + last_two[-2])} 
  last_two.last
end

def fibonacci_last(nth)
  return fibonacci(60).digits.first if nth == 60

  fibonacci(nth % 60).digits.first
end

puts fibonacci_last(15)
puts fibonacci_last(20)
puts fibonacci_last(100)
puts fibonacci_last(100_001)
puts fibonacci_last(1_000_007)
puts fibonacci_last(123456789)
puts fibonacci_last(123456789987745)
