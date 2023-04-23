# fibonacci_numbers_recursion.rb


# input: an integer representing the nth number in the fibonacci sequence
# ouput: the value of the nth number in the fibonacci sequence

# 1, 1, 2, 3, 5, 8, 13,...
# 1, 2, 3, 4, 5, 6, 7,...

def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
