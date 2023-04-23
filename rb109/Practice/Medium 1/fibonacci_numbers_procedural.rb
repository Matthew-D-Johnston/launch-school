# fibonacci_numbers_procedural.rb

# 1, 1, 2, 3, 5, 8, 13,...
# 1, 2, 3, 4, 5, 6, 7,...

def fibonacci(nth)
  return 1 if nth <= 2
  f1 = 1
  f2 = 1
  fib = 0

  (nth - 2).times do
    fib = f2 + f1
    f1 = f2
    f2 = fib
  end

  fib
end

p fibonacci(20) ==  6765
p fibonacci(100) == 354224848179261915075
p fibonacci(100_001)